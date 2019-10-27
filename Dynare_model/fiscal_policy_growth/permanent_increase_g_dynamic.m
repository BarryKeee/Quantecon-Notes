function [residual, g1, g2, g3] = permanent_increase_g_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(2, 1);
T29 = params(1)*y(4)^(-params(2));
T35 = T29*(1+x(it_-1, 2))/(1+x(it_, 2));
T48 = y(1)^(params(4)-1);
T50 = (1-params(3))*(1-x(it_, 1))/(1-x(it_-1, 1))+params(5)*params(4)*(1-x(it_, 3))/(1-x(it_-1, 1))*T48;
lhs =y(3);
rhs =params(5)*y(1)^params(4)+y(1)*(1-params(3))-y(2)-x(it_, 4);
residual(1)= lhs-rhs;
lhs =y(2)^(-params(2));
rhs =T35*T50;
residual(2)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(2, 8);

  %
  % Jacobian matrix
  %

  g1(1,2)=1;
  g1(1,1)=(-(1-params(3)+params(5)*getPowerDeriv(y(1),params(4),1)));
  g1(1,3)=1;
  g1(1,8)=1;
  g1(2,2)=getPowerDeriv(y(2),(-params(2)),1);
  g1(2,4)=(-(T50*(1+x(it_-1, 2))/(1+x(it_, 2))*params(1)*getPowerDeriv(y(4),(-params(2)),1)));
  g1(2,1)=(-(T35*params(5)*params(4)*(1-x(it_, 3))/(1-x(it_-1, 1))*getPowerDeriv(y(1),params(4)-1,1)));
  g1(2,5)=(-(T35*((1-params(3))*(1-x(it_, 1))/((1-x(it_-1, 1))*(1-x(it_-1, 1)))+T48*params(5)*params(4)*(1-x(it_, 3))/((1-x(it_-1, 1))*(1-x(it_-1, 1))))));
  g1(2,5)=(-(T35*(-(1-params(3)))/(1-x(it_-1, 1))));
  g1(2,6)=(-(T50*T29*1/(1+x(it_, 2))));
  g1(2,6)=(-(T50*T29*(-(1+x(it_-1, 2)))/((1+x(it_, 2))*(1+x(it_, 2)))));
  g1(2,7)=(-(T35*T48*params(5)*params(4)*(-1)/(1-x(it_-1, 1))));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],2,64);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],2,512);
end
end
end
end
