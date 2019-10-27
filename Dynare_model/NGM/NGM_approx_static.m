function [residual, g1, g2, g3] = NGM_approx_static(y, x, params)
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

residual = zeros( 4, 1);

%
% Model equations
%

T10 = y(1)^params(2);
T14 = (1-y(3))^(1-params(2));
T15 = T10*T14;
T18 = T15^(1-params(5));
T19 = T18/y(1);
T29 = params(4)*exp(y(4))*y(2)^(params(4)-1);
T31 = y(3)^(1-params(4));
T35 = 1+T29*T31-params(3);
T41 = y(2)^params(4);
T44 = y(3)^(-params(4));
T46 = (1-y(3))*exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T41*T44;
lhs =T19;
rhs =T19*params(1)*T35;
residual(1)= lhs-rhs;
lhs =y(1);
rhs =T46;
residual(2)= lhs-rhs;
lhs =y(2);
rhs =T31*exp(y(4))*T41-y(1)+y(2)*(1-params(3));
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(6)+params(7)*x(1);
residual(4)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(4, 4);

  %
  % Jacobian matrix
  %

T64 = getPowerDeriv(T15,1-params(5),1);
T69 = (y(1)*T14*getPowerDeriv(y(1),params(2),1)*T64-T18)/(y(1)*y(1));
T78 = getPowerDeriv(y(2),params(4),1);
T91 = T64*T10*(-(getPowerDeriv(1-y(3),1-params(2),1)))/y(1);
T93 = getPowerDeriv(y(3),1-params(4),1);
  g1(1,1)=T69-T35*params(1)*T69;
  g1(1,2)=(-(T19*params(1)*T31*params(4)*exp(y(4))*getPowerDeriv(y(2),params(4)-1,1)));
  g1(1,3)=T91-(T35*params(1)*T91+T19*params(1)*T29*T93);
  g1(1,4)=(-(T19*params(1)*T29*T31));
  g1(2,1)=1;
  g1(2,2)=(-((1-y(3))*T44*exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T78));
  g1(2,3)=(-((-(exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T41*T44))+(1-y(3))*exp(y(4))*(1-params(4))*params(2)/(1-params(2))*T41*getPowerDeriv(y(3),(-params(4)),1)));
  g1(2,4)=(-T46);
  g1(3,1)=1;
  g1(3,2)=1-(1-params(3)+T31*exp(y(4))*T78);
  g1(3,3)=(-(exp(y(4))*T41*T93));
  g1(3,4)=(-(T31*exp(y(4))*T41));
  g1(4,4)=1-params(6);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],4,16);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],4,64);
end
end
end
end
