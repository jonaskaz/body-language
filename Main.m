%%%
%%% Body Language Translator
%%%

clear all

% Collect training data files
train_filenames = cellstr(ls('data/train/*.mat*')); 

% Collect testing data files
test_filenames = cellstr(ls('data/test/*.mat*')); 

% Test model and display accuracy
test_model(train_filenames, test_filenames)

% Run model and play sound
% filename = cellstr('hori-10.mat');
% run_model(train_filenames, filename)