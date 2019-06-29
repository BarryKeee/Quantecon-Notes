% AFFODE ODE file for exponential affine differential equation
% 
% See affasset

% Copyright (c) 1997-2002, Paul L. Fackler & Mario J. Miranda
% paul_fackler@ncsu.edu, miranda.4@osu.edu

function out=affode(t,X,flag,AA,BB,Ct,GG)
  X=X(1:end-1);
  CX=Ct*X;
  switch flag
  case 'jacobian'
    out=[AA+2*BB*diag(CX)*C zeros(size(Ct,1)+1,1)];
  otherwise
    out=AA*X+BB*(CX.*CX)-GG;
  end