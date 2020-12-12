%%%
%%% Body Language Translator
%%%

clear all
train_filenames = {'circle-1.mat', 'vertical-slow-2.mat', 'horizontal-slow-2.mat'};

model = train_model(train_filenames);

[U,S,V] = svd(model)

train_coef = U*model;

test = train_model({'circle-4.mat', 'vertical-slow-3.mat', 'horizontal-slow-1.mat'});

test_coef = U*test;





