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
M_.fname = 'permanent_income';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('permanent_income.log');
M_.exo_names = 'e_d';
M_.exo_names_tex = 'e\_d';
M_.exo_names_long = 'e_d';
M_.exo_names = char(M_.exo_names, 'e_b');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_b');
M_.exo_names_long = char(M_.exo_names_long, 'e_b');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'mu_c');
M_.endo_names_tex = char(M_.endo_names_tex, 'mu\_c');
M_.endo_names_long = char(M_.endo_names_long, 'mu_c');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'in');
M_.endo_names_tex = char(M_.endo_names_tex, 'in');
M_.endo_names_long = char(M_.endo_names_long, 'in');
M_.endo_partitions = struct();
M_.param_names = 'R';
M_.param_names_tex = 'R';
M_.param_names_long = 'R';
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'rho_b');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_b');
M_.param_names_long = char(M_.param_names_long, 'rho_b');
M_.param_names = char(M_.param_names, 'mu_b');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_b');
M_.param_names_long = char(M_.param_names_long, 'mu_b');
M_.param_names = char(M_.param_names, 'mu_d');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_d');
M_.param_names_long = char(M_.param_names_long, 'mu_d');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 6;
M_.param_nbr = 5;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
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
erase_compiled_function('permanent_income_static');
erase_compiled_function('permanent_income_dynamic');
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 4 0;
 1 5 0;
 0 6 10;
 2 7 0;
 3 8 0;
 0 9 0;]';
M_.nstatic = 2;
M_.nfwrd   = 1;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 1;
M_.nspred   = 3;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(5, 1);
M_.NNZDerivatives = [18; -1; -1];
options_.periods = 1000;
M_.params( 1 ) = 1.05;
R = M_.params( 1 );
M_.params( 2 ) = 0;
rho = M_.params( 2 );
M_.params( 4 ) = 30;
mu_b = M_.params( 4 );
M_.params( 5 ) = 5;
mu_d = M_.params( 5 );
M_.params( 3 ) = 0;
rho_b = M_.params( 3 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 5 ) = M_.params(5);
oo_.steady_state( 2 ) = 100;
oo_.steady_state( 1 ) = (M_.params(1)-1)*oo_.steady_state(2)+oo_.steady_state(5);
oo_.steady_state( 3 ) = M_.params(4)-oo_.steady_state(1);
oo_.steady_state( 4 ) = M_.params(4);
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
options_.irf = 10;
options_.order = 1;
options_.periods = 1000;
var_list_ = char();
info = stoch_simul(var_list_);
save('permanent_income_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('permanent_income_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('permanent_income_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('permanent_income_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('permanent_income_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('permanent_income_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('permanent_income_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 2 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
