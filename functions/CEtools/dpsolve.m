% DPSOLVE  Solves discrete time  Bellman equation
% USAGE
%   [c,scoord,v,x,resid] = dpsolve(model,fspace,s,v,x);
% INPUTS
%   model     : dynamic program model structure
%   fspace    : name of projection space structure
%   s         : matrix of state nodal values
%   v         : initial guess for values or shadow prices at nodes
%   x         : initial guess for optimal continuous actions at nodes
% OUTPUTS
%   c         : value function approximation basis coefficients
%   scoord    : residual evaluation coordinates (cell array for ds>1)
%   v         : value function at evaluation points
%   x         : optimal action at evaluation points
%   resid     : Bellman equation residuals at evaluation points
% MODEL STRUCTURE FIELDS
%   func           : function file name (see below)
%   discount       : discount factor
%   e              : shocks
%   w              : probabilities    
%   horizon        : an integer or inf
%   actions        : vector or cell array of discrete actions
%   discretestates : vector of indices of discrete states
%   params         : additional parameters to function file
% FUNCTION FILE FORMAT
%   [out1,out2,out3] = func(flag,s,x,e,additional parameters)
%   if flag = 'b' returns bound function
%      xl:ns.dx, xu:ns.dx
%   if flag = 'f' returns reward function and derivatives
%      f:ns.1, fx:ns.dx, fxx:ns.dx.dx
%   if flag = 'g' returns transition function and derivatives
%      g:ns.ds, gx:ns.ds.dx, gxx:ns.ds.dx.dx
%   where ns = number of collocation states 
%         ds = state space dimension
%         dx = action space dimension
% USER OPTIONS (SET WITH OPSET)
%   tol       : convergence tolerance
%   maxit     : maximum number of iterations
%   nres      : nres*fspace.n uniform nodes to evaluate residual
%   showiters : 0/1, 1 to display iteration results
%   algorithm : 'newton' (the default) or 'funcit'
% USER OPTIONS FOR DPSOLVE_VMAX
%   tol          : convergence tolerance used by CP solver (default: 5e-8);
%   maxit        : maximum number of iterations used by CP solver (default: 50)
%   maxbacksteps : maximum number of backsteps used by CP solver (default: 0)
%   lcpmethod    : 'minmax' (the default) or 'smooth'
%
% Note: actions must be either all discrete or all continuous (states can be mixed)

% Copyright (c) 1997-2001, Mario J. Miranda & Paul L. Fackler
% miranda.4@osu.edu, paul_fackler@ncsu.edu

% 6/28/06 Improved memory efficiency for sparse basis models - run faster
% and less likely to encounter out-of-memory errors

function [c,scoord,v,x,resid] = dpsolve(model,fspace,s,v,x)

% SET PARAMETER & SHOCK DISTRIBUTION DEFAULTS
  tol       = optget('dpsolve','tol',sqrt(eps));
  maxit     = optget('dpsolve','maxit',500);
  nres      = optget('dpsolve','nres',10);
  showiters = optget('dpsolve','showiters',1);
  algorithm = optget('dpsolve','algorithm','newton');

  if ~isfield(model,'e'); model.e=0; e=0;
    else, e=model.e; end;
  if ~isfield(model,'w'); model.w=1; delw=model.discount;
    else, delw=model.discount*model.w; end;
  if isfield(model,'horizon') & model.horizon<inf, algorithm='finite'; end
  if isfield(model,'actions'), x=model.actions; end
  if isfield(model,'explicit'), explicit=model.explicit; else, explicit=0; end
  func=model.func;
  params=model.params;
  if nargin<3, s=gridmake(funnode(fspace)); end
  if nargin<4 | isempty(v), v = zeros(size(s,1),1); end
  %v = zeros(size(s,1),1);
% DETERMINE NUMBER OF DIMENSIONS & COORDINATES
  n  = fspace.n;                % number of collocation coordinates by state dimension 
  ns = prod(n);                 % number of collocation states
  ds = length(n);               % dimension of state space
  dx = size(x,2);               % dimension of action space
  
% COMPUTE COLLOCATION NODES AND INTERPOLATION MATRIX
  PhiS = funbasx(fspace,s);          % collocation matrix

  c   = funfitxy(fspace,PhiS,v);     % initial basis coefficients
  [F,G,X] = GetFG(s,fspace,model);   % basis functions for discrete states

  % SOLVE BELLMAN EQUATION
  tic
  switch algorithm
    case 'funcit'                              % FUNCTION ITERATION
    for it=1:maxit                             % perform iterations
      cold = c;                                % store old basis coefficients
      if explicit
        [v,x] = vmax(s,[],c,fspace,model,F,G,X);  % update value function and policy
      else
        [v,x] = vmax(s,x,c,fspace,model,F,G,X);  % update value function and policy
      end
      c     = funfitxy(fspace,PhiS,v);         % update basis coefficient
      if any(isnan(c))
        error('NaNs encountered')
      end
      change = norm(c-cold,inf);               % compute change
      if showiters 
        fprintf ('%4i %10.1e\n',it,change)     % print progress
      end
      if change<tol, break, end;               % convergence check  
    end
  case 'newton'                                % NEWTON METHOD
    Phi=funbconv(PhiS,zeros(1,ds),'expanded');
    Phi=Phi.vals{1};
    for it=1:maxit                             % perform iterations
      cold = c;                                % store old basis coefficients
      if explicit
        [v,x,vderc] = vmax(s,[],c,fspace,model,F,G,X);  % update value function and policy
      else
        [v,x,vderc] = vmax(s,x,c,fspace,model,F,G,X);  % update value function and policy
      end
      c = cold - [Phi-vderc]\[Phi*c-v];        % update basis coefficient
      if any(isnan(c))
        error('NaNs encountered')
      end
      change = norm(c-cold,inf);               % compute change
      if showiters 
        fprintf ('%4i %10.1e\n',it,change)     % print progress
      end

      if change<tol, break, end;               % convergence check  
    end
  case 'finite'                                % BACKWARD RECURSION   
    T  = model.horizon;                        % number of decision periods
    xx = zeros(ns,dx,T);                       % declare action matrix
    vv = [zeros(ns,T) v];                      % declare value matrix
    cc = [zeros(ns,T) c];                      % declare coefficient matrix
    for t=T:-1:1                               % perform recursions
      if explicit
        [v,x] = vmax(s,[],c,fspace,model,F,G,X);  % update value function and policy
      else
        [v,x] = vmax(s,x,c,fspace,model,F,G,X);  % update value function and policy
      end
      c     = funfitxy(fspace,PhiS,v);         % update basis coefficient
      if any(isnan(c))
        error('NaNs encountered')
      end
      xx(:,:,t) = x;                           % store actions
      vv(:,t) = v;                             % store values
      cc(:,t) = c;                             % store coefficients
      if showiters 
        fprintf ('Solving for time %1i\n',t)      % print progress
      end
    end 
    c=cc; v=vv; x=xx; scoord=s;
    return
  end
  if showiters, fprintf('Elapsed Time = %7.2f Seconds\n',toc); end

  
  % CHECK STATE TRANSITION SATISFY BOUNDS
  snmin=inf; snmax=-inf;
  for k=1:length(delw);
    kk = k*ones(ns,1);
    g = feval(func,'g',s,x,e(kk,:),params{:});
    snmin = min(snmin,min(g)); snmax = max(snmax,max(g));  
  end
  if any(snmin<fspace.a-eps), disp('Warning: extrapolating beyond smin'), end;
  if any(snmax>fspace.b+eps), disp('Warning: extrapolating beyond smax'), end;
  
  % COMPUTE RESIDUAL
  scoord = funnode(fspace);            % state collocaton coordinates
  if ~strcmp(algorithm,'finite') && nargout>4
    ind = ones(1,ds);
    if isfield(model,'discretestates')
      ind(model.discretestates) = 0;
    end
    if ds==1
      if ind
        n = nres*n;
        scoord = linspace(fspace.a,fspace.b,n)';
      end
    else 
      for i=1:ds
        if ind(i)
          n(i) = nres*n(i);
          scoord{i} = linspace(fspace.a(i),fspace.b(i),n(i))';
        end
      end
    end
    s = gridmake(scoord);
    if isempty(F)
      if explicit
        x=[];
      else
        x = funeval(funfitxy(fspace,PhiS,x),fspace,scoord);   % rough guess for actions at evaluation points
      end
      [v,x] = vmax(s,x,c,fspace,model,F,G);                 % values and actions at evaluation points
    else
      [ss,xx]=gridmake(s,X);
      %% BUG PLACE
      v = valfunc(c,fspace,ss,xx,e,delw,func,params);
      [v,j] = max(reshape(v,size(s,1),size(X,1)),[],2); % values and actions at evaluation points
      x = X(j,:);
    end
    resid = v-funeval(c,fspace,scoord);   % residual at evaluation points
    resid = reshape(resid,[n 1]);         % reshape residual for plotting
  end
  
% RESHAPE OUTPUT
  switch algorithm
  case 'finite' 
    x = squeeze(xx);
    v = vv;
    c = cc;
  otherwise
    x = reshape(x,[n dx]); 
    v = reshape(v,[n  1]);
  end
  
    

  
 


  
