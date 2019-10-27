function [residual, g1, g2, g3] = engineer_market_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(10, 1);
T41 = params(6)^4*(1-params(3))^4;
lhs =y(6);
rhs =params(1)+params(2)*y(8)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =(1-params(3))*y(2)+y(5);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =params(4)-params(5)*y(9)+x(it_, 2);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =(1-params(3))*params(6)*y(16)+T41*y(20);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(17);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =y(18);
residual(6)= lhs-rhs;
lhs =y(12);
rhs =y(19);
residual(7)= lhs-rhs;
lhs =y(13);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =y(3);
residual(9)= lhs-rhs;
lhs =y(15);
rhs =y(4);
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 22);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,8)=(-params(2));
  g1(1,21)=(-1);
  g1(2,2)=(-(1-params(3)));
  g1(2,7)=1;
  g1(2,5)=(-1);
  g1(3,7)=1;
  g1(3,9)=params(5);
  g1(3,22)=(-1);
  g1(4,8)=1;
  g1(4,16)=(-((1-params(3))*params(6)));
  g1(4,20)=(-T41);
  g1(5,17)=(-1);
  g1(5,10)=1;
  g1(6,18)=(-1);
  g1(6,11)=1;
  g1(7,19)=(-1);
  g1(7,12)=1;
  g1(8,1)=(-1);
  g1(8,13)=1;
  g1(9,3)=(-1);
  g1(9,14)=1;
  g1(10,4)=(-1);
  g1(10,15)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,484);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,10648);
end
end
end
end
