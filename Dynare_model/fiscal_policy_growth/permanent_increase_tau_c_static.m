function [residual, g1, g2, g3] = permanent_increase_tau_c_static(y, x, params)
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

residual = zeros( 2, 1);

%
% Model equations
%

T24 = y(1)^(-params(2));
T41 = (1-params(3))*(1-x(1))/(1-x(1))+params(5)*params(4)*(1-x(3))/(1-x(1))*y(2)^(params(4)-1);
lhs =y(2);
rhs =params(5)*y(2)^params(4)+y(2)*(1-params(3))-y(1)-x(4);
residual(1)= lhs-rhs;
lhs =T24;
rhs =T24*params(1)*T41;
residual(2)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(2, 2);

  %
  % Jacobian matrix
  %

T44 = getPowerDeriv(y(1),(-params(2)),1);
  g1(1,1)=1;
  g1(1,2)=1-(1-params(3)+params(5)*getPowerDeriv(y(2),params(4),1));
  g1(2,1)=T44-T41*params(1)*T44;
  g1(2,2)=(-(T24*params(1)*params(5)*params(4)*(1-x(3))/(1-x(1))*getPowerDeriv(y(2),params(4)-1,1)));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],2,4);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],2,8);
end
end
end
end
