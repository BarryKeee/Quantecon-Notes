function [residual, g1, g2, g3] = International_BC_approx_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 6, 1);

%
% Model equations
%

T14 = exp(y(1))^(-params(1));
T25 = params(3)*exp(y(5))*exp(y(3))^(params(3)-1);
T28 = 1+T25-params(2);
T32 = exp(y(2))^(-params(1));
T40 = params(3)*exp(y(6))*exp(y(4))^(params(3)-1);
T42 = 1+T40-params(2);
T54 = exp(y(5))*exp(y(3))^params(3);
T56 = exp(y(6))*exp(y(4))^params(3);
lhs =y(1);
rhs =y(2);
residual(1)= lhs-rhs;
lhs =T14;
rhs =T14*params(4)*T28;
residual(2)= lhs-rhs;
lhs =T32;
rhs =params(4)*T32*T42;
residual(3)= lhs-rhs;
lhs =exp(y(4))+exp(y(3))+exp(y(1))+exp(y(2))-exp(y(3))*(1-params(2))-exp(y(4))*(1-params(2));
rhs =T54+T56;
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(5)+x(1);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(5)+x(2);
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

T69 = exp(y(1))*getPowerDeriv(exp(y(1)),(-params(1)),1);
T74 = exp(y(2))*getPowerDeriv(exp(y(2)),(-params(1)),1);
  g1(1,1)=1;
  g1(1,2)=(-1);
  g1(2,1)=T69-T28*params(4)*T69;
  g1(2,3)=(-(T14*params(4)*params(3)*exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3)-1,1)));
  g1(2,5)=(-(T14*params(4)*T25));
  g1(3,2)=T74-T42*params(4)*T74;
  g1(3,4)=(-(params(4)*T32*params(3)*exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(3)-1,1)));
  g1(3,6)=(-(params(4)*T32*T40));
  g1(4,1)=exp(y(1));
  g1(4,2)=exp(y(2));
  g1(4,3)=exp(y(3))-exp(y(3))*(1-params(2))-exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3),1);
  g1(4,4)=exp(y(4))-exp(y(4))*(1-params(2))-exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(3),1);
  g1(4,5)=(-T54);
  g1(4,6)=(-T56);
  g1(5,5)=1-params(5);
  g1(6,6)=1-params(5);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,216);
end
end
end
end
