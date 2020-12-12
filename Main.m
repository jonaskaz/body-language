%%%
%%% Body Language Translator
%%%

clear
train_filenames = {'circle-1.mat', 'vertical-slow-2.mat', 'horizontal-slow-2.mat'};

[x_model, y_model] = train_model(train_filenames);

[U,S,V] = svd(x_model)

train_coef = U*x_model;

[x_model, y_model] = train_model({'circle-4.mat', 'vertical-slow-3.mat', 'horizontal-slow-1.mat'});

test_coef = U*x_model;





