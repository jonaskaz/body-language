%%%
%%% Body Language Translator
%%%

clear all

% Collect training data files
train_filenames = cellstr(ls('data/train/*.mat*')); % Store all filenames in training data folder

% Perform FFT on each training motion
train_fft = perform_fft(train_filenames, 'train'); 
train_id = id_motion(train_filenames); % Identify each motion based on the filename

% Average each training motion's FFTs
[train_avg, train_id] = avg_fft(train_fft, train_id);

% Perform SVD on training motion FFTs to create motionspace
[U,S,V] = svd(train_avg);

% Project train data onto motionspace
train_weights = U*train_avg;


% Perform FFT on test motion
test_fft = perform_fft({'circ-4.mat'}, 'test');

% Project test data onto new motionspace
test_weights = U*test_fft;

% Use RMSE to compare and identify test motion
RMSE = sqrt(mean((train_weights - test_weights).^2));
[M, I] = min(RMSE);
id = train_id{I}




