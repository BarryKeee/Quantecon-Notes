function [F,G,X] = GetFG(s,fspace,model)
  
  if ~isfield(model,'actions'), F=[];G=[]; X=[]; return; end

  e = model.e;
  delw = model.discount*model.w;
  func=model.func;
  params=model.params;

  K = length(delw);
  X = gridmake(model.actions);
  [ss,xx] = gridmake(s,X);
  ns=size(ss,1);
  
  F = feval(func,'f',ss,xx,[],params{:});
  g = feval(func,'g',ss,xx,e(ones(ns,1),:),params{:});
  G=delw(1)*funbas(fspace,g);
  for k=2:K
    g = feval(func,'g',ss,xx,e(k + zeros(ns,1),:),params{:});
    G = G + delw(k)*funbas(fspace,g);
  end