%%%
%%% Perform SVD, identify motion, calculate accuracy
%%%

function [accuracy] = test_model(train_filenames, test_filenames)
   
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
    predict_id = {}; % Initialize vector that will store motion predictions
    accuracy = 0; % Initialize overall accuracy count

    for i = 1:size(test_weights, 2)
        RMSE = sqrt(mean((train_weights - test_weights(:,i)).^2));
        [M, I] = min(RMSE);
        predict_id{i} = train_id{I};
        if isequal(predict_id{i}, test_id{i}) % Check if overall predict id
            accuracy = accuracy + 1; 
        end
    end

    % Calculate overall accuracy of identification
    accuracy = accuracy/size(test_weights,2);
    
end