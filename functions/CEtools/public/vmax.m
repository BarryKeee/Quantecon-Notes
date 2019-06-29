% VMAX - Solves Bellman Equation
  function [v,x,vc] = vmax(s,x,c,fspace,model,F,G,X)
  % CONTINUOUS ACTIONS
  if isempty(F)
    % SET CONVERGENCE PARAMETER DEFAULTS
    tol           = optget('dpsolve_vmax','tol',5e-8);
    maxit         = optget('dpsolve_vmax','maxit',50);
    maxbacksteps  = optget('dpsolve_vmax','maxbacksteps',0);
    lcpmethod     = optget('dpsolve_vmax','lcpmethod','minmax');

    e=model.e;
    delw = model.discount*model.w;
    func=model.func;
    params=model.params;
    
    if isempty(x) % explict solution to control available
      dv=squeeze(funeval(c,fspace,s,eye(size(s,2))));
      x=feval(func,'x',s,dv,[],params{:});
      v = valfunc(c,fspace,s,x,e,delw,func,params);
    else
      % COMPUTE BOUNDS      
      [xl,xu] = feval(func,'b',s,x,[],params{:}); 

      % SOLVE FIRST ORDER CONDITIONS
      for it=1:maxit
        [v,vx,vxx] = valfunc(c,fspace,s,x,e,delw,func,params);
        [vx,deltax] = lcpstep(lcpmethod,x,xl,xu,vx,vxx);
        err = max(abs(vx),[],2);
        if all(err<tol), break, end;
        eold = inf;
        if maxbacksteps<1
          x = x+deltax;
        else
          for k=1:maxbacksteps
            xnew = x + deltax;
            [v,vx] = valfunc(c,fspace,s,xnew,e,delw,func,params);
            vx = lcpstep(lcpmethod,x,xl,xu,vx);
            enew = max(abs(vx),[],2);
            ind = find(eold>enew & enew>err);
            if isempty(ind), break; end
            eold = enew;
            deltax(ind,:) = deltax(ind,:)/2;
          end 
          x = xnew;
        end
      end
    end

    % COMPUTE dv/dc 
    if nargout>2
      ns = size(s,1);
      g = feval(func,'g',s,x,e(ones(ns,1),:),params{:});
      vc = delw(1)*funbas(fspace,g);
      for k=2:length(delw)
        g = feval(func,'g',s,x,e(k+zeros(ns,1),:),params{:});
        vc = vc + delw(k)*funbas(fspace,g);
      end
    end
  % DISCRETE ACTIONS
  else
    [ns,nc] = size(G);
    nx = length(model.actions);
    ns = ns/nx;
    [v,j] = max(reshape(F+G*c,ns,nx),[],2);
    x = X(j,:);
    if nargout>2
      i = (j-1)*ns + (1:ns)';   
      vc = reshape(G(i,:),ns,nc);
    end
  end