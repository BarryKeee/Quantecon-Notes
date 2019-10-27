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
M_.fname = 'transit_increase_g';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('transit_increase_g.log');
M_.exo_names = 'taui';
M_.exo_names_tex = 'taui';
M_.exo_names_long = 'taui';
M_.exo_names = char(M_.exo_names, 'tauc');
M_.exo_names_tex = char(M_.exo_names_tex, 'tauc');
M_.exo_names_long = char(M_.exo_names_long, 'tauc');
M_.exo_names = char(M_.exo_names, 'tauk');
M_.exo_names_tex = char(M_.exo_names_tex, 'tauk');
M_.exo_names_long = char(M_.exo_names_long, 'tauk');
M_.exo_names = char(M_.exo_names, 'g');
M_.exo_names_tex = char(M_.exo_names_tex, 'g');
M_.exo_names_long = char(M_.exo_names_long, 'g');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_partitions = struct();
M_.param_names = 'bet';
M_.param_names_tex = 'bet';
M_.param_names_long = 'bet';
M_.param_names = char(M_.param_names, 'gam');
M_.param_names_tex = char(M_.param_names_tex, 'gam');
M_.param_names_long = char(M_.param_names_long, 'gam');
M_.param_names = char(M_.param_names, 'del');
M_.param_names_tex = char(M_.param_names_tex, 'del');
M_.param_names_long = char(M_.param_names_long, 'del');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'A');
M_.param_names_tex = char(M_.param_names_tex, 'A');
M_.param_names_long = char(M_.param_names_long, 'A');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 2;
M_.param_nbr = 5;
M_.orig_endo_nbr = 2;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('transit_increase_g_static');
erase_compiled_function('transit_increase_g_dynamic');
M_.orig_eq_nbr = 2;
M_.eq_nbr = 2;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 2 4;
 1 3 0;]';
M_.nstatic = 0;
M_.nfwrd   = 1;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 1;
M_.nspred   = 1;
M_.ndynamic   = 2;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(2, 1);
M_.maximum_exo_lag = 1;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(5, 1);
M_.NNZDerivatives = [12; 0; -1];
M_.params( 1 ) = .95;
bet = M_.params( 1 );
M_.params( 2 ) = 2;
gam = M_.params( 2 );
M_.params( 3 ) = .2;
del = M_.params( 3 );
M_.params( 4 ) = .33;
alpha = M_.params( 4 );
M_.params( 5 ) = 1;
A = M_.params( 5 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 1.5;
oo_.steady_state( 1 ) = 0.6;
oo_.exo_steady_state( 4 ) = 0.2;
oo_.exo_steady_state( 2 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 2 ) = 1.5;
oo_.steady_state( 1 ) = 0.6;
oo_.exo_steady_state( 4 ) = 0.4;
oo_.exo_steady_state( 2 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
steady;
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',4,'multiplicative',0,'periods',10:10,'value',0.2) ];
M_.exo_det_length = 0;
options_.periods = 100;
perfect_foresight_setup;
perfect_foresight_solver;
co=ys0_(1);
ko = ys0_(2);
go = ex0_(1,1);
rbig0=1/bet;
rbig=c(2:101).^(-gam)./(bet*c(3:102).^(-gam));
rq0=alpha*A*ko^(alpha-1);
rq=alpha*A*k(1:100).^(alpha-1);
wq0=A*ko^alpha-ko*alpha*A*ko^(alpha-1);
wq=A*k(1:100).^alpha-k(1:100).*alpha*A.*k(1:100).^(alpha-1);
figure
subplot(2,3,1)
plot([ko*ones(100,1)  k(1:100) ])
title('k')
subplot(2,3,2)
plot([co*ones(100,1)  c(2:101) ])
title('c')
subplot(2,3,3)
plot([rbig0*ones(100,1) rbig ])
title('R')
subplot(2,3,4)
plot([wq0*ones(100,1) wq ])
title('w/q')
subplot(2,3,5)
plot([rq0*ones(100,1) rq ])
title('r/q')
save('transit_increase_g_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('transit_increase_g_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('transit_increase_g_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('transit_increase_g_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('transit_increase_g_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('transit_increase_g_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('transit_increase_g_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
