[X, y,X_header] = load_heart_csv('heart.csv','numeric','array');

%Create set of values for distributions to do gridsearch over
dists_cat = 1;
dists_cont = [2,3];

%Create an ndimensional grid to store all combinations of distribution
[d_age, d_sex, d_cp, d_trestbps, d_chol, d_fbs, d_restecg, d_thalach, d_exang, d_oldpeak, d_slope, d_ca, d_thal] = ...
    ndgrid(dists_cont,dists_cat,dists_cat,dists_cont,dists_cont,dists_cat,dists_cat,dists_cont,dists_cat,...
    dists_cont,dists_cat,dists_cat,dists_cat);


results = arrayfun(@(d_age, d_sex, d_cp, d_trestbps, d_chol,d_fbs, d_restecg, ...
    d_thalach, d_exang, d_oldpeak, d_slope, d_ca, d_thal) fitcnb(X,y,'CVPartition',cp,...
    'DistributionNames',get_char_args(d_age,d_sex, d_cp, d_trestbps, d_chol, d_fbs, ...
    d_restecg, d_thalach, d_exang, d_oldpeak,...
    d_slope, d_ca, d_thal)),d_age, d_sex, d_cp, d_trestbps, d_chol, d_fbs, ...
    d_restecg, d_thalach, d_exang, d_oldpeak, d_slope, d_ca, d_thal,'UniformOutput',false);


function char_args = get_char_args(d_age, d_sex, d_cp, d_trestbps, d_chol, d_fbs,d_restecg, d_thalach, d_exang, d_oldpeak, d_slope, d_ca, d_thal)
    dists = {'mn','gaussian','kernel'};
    cell_args = {dists{d_age}, dists{d_sex}, dists{d_cp}, dists{d_trestbps}, ...
        dists{d_chol}, dists{d_fbs},dists{d_restecg}, dists{d_thalach}, ...
        dists{d_exang}, dists{d_oldpeak}, dists{d_slope}, dists{d_ca}, dists{d_thal}};
    char_args = cell_args;
end



