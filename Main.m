%%%
%%% Body Language Translator
%%%

clear
train_filenames = {'circle-1.mat', 'circle-2.mat', 'circle-4.mat'};

[x_model, y_model] = train_model(train_filenames);

[U,S,V] = svd(x_model)




