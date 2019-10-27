%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'engineer_market';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('engineer_market.log');
M_.exo_names = 'e_s';
M_.exo_names_tex = 'e\_s';
M_.exo_names_long = 'e_s';
M_.exo_names = char(M_.exo_names, 'e_d');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_d');
M_.exo_names_long = char(M_.exo_names_long, 'e_d');
M_.endo_names = 's';
M_.endo_names_tex = 's';
M_.endo_names_long = 's';
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'P');
M_.endo_names_tex = char(M_.endo_names_tex, 'P');
M_.endo_names_long = char(M_.endo_names_long, 'P');
M_.endo_names = char(M_.endo_names, 'W');
M_.endo_names_tex = char(M_.endo_names_tex, 'W');
M_.endo_names_long = char(M_.endo_names_long, 'W');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_47');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_47');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_47');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_51');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_51');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_51');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_42');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_42');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_42');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_3');
M_.endo_partitions = struct();
M_.param_names = 'a0';
M_.param_names_tex = 'a0';
M_.param_names_long = 'a0';
M_.param_names = char(M_.param_names, 'a1');
M_.param_names_tex = char(M_.param_names_tex, 'a1');
M_.param_names_long = char(M_.param_names_long, 'a1');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'd0');
M_.param_names_tex = char(M_.param_names_tex, 'd0');
M_.param_names_long = char(M_.param_names_long, 'd0');
M_.param_names = char(M_.param_names, 'd1');
M_.param_names_tex = char(M_.param_names_tex, 'd1');
M_.param_names_long = char(M_.param_names_long, 'd1');
M_.param_names = char(M_.param_names, 'bet');
M_.param_names_tex = char(M_.param_names_tex, 'bet');
M_.param_names_long = char(M_.param_names_long, 'bet');
M_.param_names = char(M_.param_names, 'k');
M_.param_names_tex = char(M_.param_names_tex, 'k');
M_.param_names_long = char(M_.param_names_long, 'k');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 10;
M_.param_nbr = 7;
M_.orig_endo_nbr = 4;
M_.aux_vars(1).endo_index = 5;
M_.aux_vars(1).type = 0;
M_.aux_vars(2).endo_index = 6;
M_.aux_vars(2).type = 0;
M_.aux_vars(3).endo_index = 7;
M_.aux_vars(3).type = 0;
M_.aux_vars(4).endo_index = 8;
M_.aux_vars(4).type = 1;
M_.aux_vars(4).orig_index = 1;
M_.aux_vars(4).orig_lead_lag = -1;
M_.aux_vars(5).endo_index = 9;
M_.aux_vars(5).type = 1;
M_.aux_vars(5).orig_index = 1;
M_.aux_vars(5).orig_lead_lag = -2;
M_.aux_vars(6).endo_index = 10;
M_.aux_vars(6).type = 1;
M_.aux_vars(6).orig_index = 1;
M_.aux_vars(6).orig_lead_lag = -3;
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('engineer_market_static');
erase_compiled_function('engineer_market_dynamic');
M_.orig_eq_nbr = 4;
M_.eq_nbr = 10;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 6 0;
 2 7 0;
 0 8 16;
 0 9 17;
 0 10 18;
 0 11 19;
 0 12 20;
 3 13 0;
 4 14 0;
 5 15 0;]';
M_.nstatic = 0;
M_.nfwrd   = 5;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 5;
M_.nspred   = 5;
M_.ndynamic   = 10;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(7, 1);
M_.NNZDerivatives = [24; -1; -1];
options_.periods = 500;
M_.params( 1 ) = 10;
a0 = M_.params( 1 );
M_.params( 2 ) = 1;
a1 = M_.params( 2 );
M_.params( 4 ) = 1000;
d0 = M_.params( 4 );
M_.params( 5 ) = 1;
d1 = M_.params( 5 );
M_.params( 6 ) = .99;
bet = M_.params( 6 );
M_.params( 3 ) = .02;
delta = M_.params( 3 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state(5)=oo_.steady_state(4);
oo_.steady_state(6)=oo_.steady_state(5);
oo_.steady_state(7)=oo_.steady_state(6);
oo_.steady_state(8)=oo_.steady_state(1);
oo_.steady_state(9)=oo_.steady_state(8);
oo_.steady_state(10)=oo_.steady_state(9);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 10;
options_.order = 1;
options_.periods = 500;
var_list_ = char();
info = stoch_simul(var_list_);
save('engineer_market_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('engineer_market_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('engineer_market_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('engineer_market_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('engineer_market_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('engineer_market_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('engineer_market_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 2 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
