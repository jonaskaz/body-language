%%%
%%% Perform SVD, identify motion, play sound
%%%

function [abc] = run_model(train_filenames, test_filenames)
   
    % Perform FFT on each training motion
    train_fft = perform_fft(train_filenames, 'train'); 
    train_id = id_motion(train_filenames); % Identify each motion based on the filename

    % Average each training motion's FFTs
    [train_avg, train_id] = avg_fft(train_fft, train_id);

    % Perform SVD on training motion FFTs to create motionspace
    [U,S,V] = svd(train_avg);
    
    
    
    % Project train data onto motionspace then reduce dimensionality
    train_weights = U*train_avg;
    train_weights = train_weights(1:3,:);

    % Perform FFT on each test motion
    test_fft = perform_fft(test_filenames, 'test'); 
    test_id = id_motion(test_filenames); % Identify each motion based on the filename

    % Project test data onto new motionspace then reduce dimensionality
    test_weights = U*test_fft;
    test_weights = test_weights(1:3,:);

    
    % Use RMSE to compare and identify each test motion
 
    RMSE = sqrt(mean((train_weights - test_weights).^2));
    [~, I] = min(RMSE);
    
    if isequal(train_id{I}, 'vib')
        [y, fs] = audioread('data/audio/attention.mp3');
        sound(y, fs)
    end
    if isequal(train_id{I}, 'circ')
        [y, fs] = audioread('data/audio/bus_stop.mp3');
        sound(y, fs)
    end
    if isequal(train_id{I}, 'hori')
        [y, fs] = audioread('data/audio/peanut.mp3');
        sound(y, fs)
    end
   abc = train_id{I}
    
end