function [residual, g1, g2, g3] = International_BC_approx_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(6, 1);
T19 = params(4)*exp(y(11))^(-params(1));
T28 = params(3)*exp(y(13))*exp(y(7))^(params(3)-1);
T31 = 1+T28-params(2);
T39 = params(4)*exp(y(12))^(-params(1));
T46 = params(3)*exp(y(14))*exp(y(8))^(params(3)-1);
T48 = 1+T46-params(2);
T66 = exp(y(9))*exp(y(1))^params(3);
T70 = exp(y(10))*exp(y(2))^params(3);
lhs =y(5);
rhs =y(6);
residual(1)= lhs-rhs;
lhs =exp(y(5))^(-params(1));
rhs =T19*T31;
residual(2)= lhs-rhs;
lhs =exp(y(6))^(-params(1));
rhs =T39*T48;
residual(3)= lhs-rhs;
lhs =exp(y(8))+exp(y(7))+exp(y(5))+exp(y(6))-exp(y(1))*(1-params(2))-(1-params(2))*exp(y(2));
rhs =T66+T70;
residual(4)= lhs-rhs;
lhs =y(9);
rhs =params(5)*y(3)+x(it_, 1);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =params(5)*y(4)+x(it_, 2);
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 16);

  %
  % Jacobian matrix
  %

T85 = exp(y(5))*getPowerDeriv(exp(y(5)),(-params(1)),1);
T87 = exp(y(11))*getPowerDeriv(exp(y(11)),(-params(1)),1);
T92 = exp(y(6))*getPowerDeriv(exp(y(6)),(-params(1)),1);
T94 = exp(y(12))*getPowerDeriv(exp(y(12)),(-params(1)),1);
T100 = exp(y(1))*getPowerDeriv(exp(y(1)),params(3),1);
T104 = exp(y(7))*getPowerDeriv(exp(y(7)),params(3)-1,1);
T105 = params(3)*exp(y(13))*T104;
T110 = exp(y(2))*getPowerDeriv(exp(y(2)),params(3),1);
T114 = exp(y(8))*getPowerDeriv(exp(y(8)),params(3)-1,1);
T115 = params(3)*exp(y(14))*T114;
  g1(1,5)=1;
  g1(1,6)=(-1);
  g1(2,5)=T85;
  g1(2,11)=(-(T31*params(4)*T87));
  g1(2,7)=(-(T19*T105));
  g1(2,13)=(-(T19*T28));
  g1(3,6)=T92;
  g1(3,12)=(-(T48*params(4)*T94));
  g1(3,8)=(-(T39*T115));
  g1(3,14)=(-(T39*T46));
  g1(4,5)=exp(y(5));
  g1(4,6)=exp(y(6));
  g1(4,1)=(-(exp(y(1))*(1-params(2))))-exp(y(9))*T100;
  g1(4,7)=exp(y(7));
  g1(4,2)=(-((1-params(2))*exp(y(2))))-exp(y(10))*T110;
  g1(4,8)=exp(y(8));
  g1(4,9)=(-T66);
  g1(4,10)=(-T70);
  g1(5,3)=(-params(5));
  g1(5,9)=1;
  g1(5,15)=(-1);
  g1(6,4)=(-params(5));
  g1(6,10)=1;
  g1(6,16)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(32,3);
  v2(1,1)=2;
  v2(1,2)=69;
  v2(1,3)=T85+exp(y(5))*exp(y(5))*getPowerDeriv(exp(y(5)),(-params(1)),2);
  v2(2,1)=2;
  v2(2,2)=171;
  v2(2,3)=(-(T31*params(4)*(T87+exp(y(11))*exp(y(11))*getPowerDeriv(exp(y(11)),(-params(1)),2))));
  v2(3,1)=2;
  v2(3,2)=107;
  v2(3,3)=(-(params(4)*T87*T105));
  v2(4,1)=2;
  v2(4,2)=167;
  v2(4,3)=  v2(3,3);
  v2(5,1)=2;
  v2(5,2)=103;
  v2(5,3)=(-(T19*params(3)*exp(y(13))*(T104+exp(y(7))*exp(y(7))*getPowerDeriv(exp(y(7)),params(3)-1,2))));
  v2(6,1)=2;
  v2(6,2)=203;
  v2(6,3)=(-(T28*params(4)*T87));
  v2(7,1)=2;
  v2(7,2)=173;
  v2(7,3)=  v2(6,3);
  v2(8,1)=2;
  v2(8,2)=199;
  v2(8,3)=(-(T19*T105));
  v2(9,1)=2;
  v2(9,2)=109;
  v2(9,3)=  v2(8,3);
  v2(10,1)=2;
  v2(10,2)=205;
  v2(10,3)=(-(T19*T28));
  v2(11,1)=3;
  v2(11,2)=86;
  v2(11,3)=T92+exp(y(6))*exp(y(6))*getPowerDeriv(exp(y(6)),(-params(1)),2);
  v2(12,1)=3;
  v2(12,2)=188;
  v2(12,3)=(-(T48*params(4)*(T94+exp(y(12))*exp(y(12))*getPowerDeriv(exp(y(12)),(-params(1)),2))));
  v2(13,1)=3;
  v2(13,2)=124;
  v2(13,3)=(-(params(4)*T94*T115));
  v2(14,1)=3;
  v2(14,2)=184;
  v2(14,3)=  v2(13,3);
  v2(15,1)=3;
  v2(15,2)=120;
  v2(15,3)=(-(T39*params(3)*exp(y(14))*(T114+exp(y(8))*exp(y(8))*getPowerDeriv(exp(y(8)),params(3)-1,2))));
  v2(16,1)=3;
  v2(16,2)=220;
  v2(16,3)=(-(T46*params(4)*T94));
  v2(17,1)=3;
  v2(17,2)=190;
  v2(17,3)=  v2(16,3);
  v2(18,1)=3;
  v2(18,2)=216;
  v2(18,3)=(-(T39*T115));
  v2(19,1)=3;
  v2(19,2)=126;
  v2(19,3)=  v2(18,3);
  v2(20,1)=3;
  v2(20,2)=222;
  v2(20,3)=(-(T39*T46));
  v2(21,1)=4;
  v2(21,2)=69;
  v2(21,3)=exp(y(5));
  v2(22,1)=4;
  v2(22,2)=86;
  v2(22,3)=exp(y(6));
  v2(23,1)=4;
  v2(23,2)=1;
  v2(23,3)=(-(exp(y(1))*(1-params(2))))-exp(y(9))*(T100+exp(y(1))*exp(y(1))*getPowerDeriv(exp(y(1)),params(3),2));
  v2(24,1)=4;
  v2(24,2)=103;
  v2(24,3)=exp(y(7));
  v2(25,1)=4;
  v2(25,2)=18;
  v2(25,3)=(-((1-params(2))*exp(y(2))))-exp(y(10))*(T110+exp(y(2))*exp(y(2))*getPowerDeriv(exp(y(2)),params(3),2));
  v2(26,1)=4;
  v2(26,2)=120;
  v2(26,3)=exp(y(8));
  v2(27,1)=4;
  v2(27,2)=129;
  v2(27,3)=(-(exp(y(9))*T100));
  v2(28,1)=4;
  v2(28,2)=9;
  v2(28,3)=  v2(27,3);
  v2(29,1)=4;
  v2(29,2)=137;
  v2(29,3)=(-T66);
  v2(30,1)=4;
  v2(30,2)=146;
  v2(30,3)=(-(exp(y(10))*T110));
  v2(31,1)=4;
  v2(31,2)=26;
  v2(31,3)=  v2(30,3);
  v2(32,1)=4;
  v2(32,2)=154;
  v2(32,3)=(-T70);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),6,256);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,4096);
end
end
end
end
