% VALFUNC  Evaluates Bellman Optimand
  

function [v,vx,vxx]=valfunc(c,fspace,s,x,e,delw,func,params);
  
  % COMPUTE LOCAL CONSTANTS
    [ns,ds] = size(s);
    dx  = size(x,2);
    dxx = dx*dx;
    K = length(delw);

    if nargout<2
      v = feval(func,'f',s,x,[],params{:});
      for k=1:K
        kk = k + zeros(ns,1); 
        g = feval(func,'g',s,x,e(kk,:),params{:});
        v  = v  + delw(k)*funeval(c,fspace,g);
      end
    elseif nargout<3
      [v,vx] = feval(func,'f',s,x,[],params{:});
      vx = reshape(vx,ns,1,dx);
      for k=1:K
        kk = k + zeros(ns,1); 
        [g,gx] = feval(func,'g',s,x,e(kk,:),params{:});
        [vnext,vs] = fund(c,fspace,g,1);
        v  = v  + delw(k)*vnext;
        vx = vx + delw(k)*arraymult_new(vs,gx,ns,1,ds,dx);
      end
      clear g gx 
      vx = reshape(vx,ns,dx);
    else
      [v,vx,vxx] = feval(func,'f',s,x,[],params{:});
      vx  = reshape(vx,ns,1,dx);
      vxx = reshape(vxx,ns,dx,dx);
      for k=1:K
        kk = k + zeros(ns,1);
        [g,gx,gxx] = feval(func,'g',s,x,e(kk,:),params{:});
        [vnext,vs,vss] = fund(c,fspace,g,1);
        v   = v   + delw(k)*vnext;
        vx  = vx  + delw(k)*arraymult_new(vs,gx,ns,1,ds,dx);
        vxx = vxx + delw(k)*(reshape(arraymult_new(vs,gxx,ns,1,ds,dxx),ns,dx,dx) ...
          + arraymult_new(permute(gx,[1 3 2]),arraymult_new(vss,gx,ns,ds,ds,dx),ns,dx,ds,dx));
      end  
      clear g gx gxx vss
      vx  = reshape(vx,ns,dx);
      vxx = reshape(vxx,ns,dxx);
    end