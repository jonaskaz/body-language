%%%
%%% Body Language Translator
%%%

clear all

% Collect training data files
train_filenames = cellstr(ls('data/train/*.mat*')); 

% Collect testing data files
test_filenames = cellstr(ls('data/test/*.mat*')); 

test_model(train_filenames, test_filenames)