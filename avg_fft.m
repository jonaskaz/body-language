%%%
%%% Calculate average of each motion's FFT
%%%

function [avg, motions] = avg_fft(fft, id)

    motions = unique(id); % Determine each unique motion
    avg = []; % Initialize vector that will store averaged FFTs
   
    for i = 1:length(motions)
        ind = strfind(id, motions{i}); % Determine which elements correspond to the selected motion
        ind = ~cellfun('isempty', ind); % Convert into logical array
        avg(:,i) = mean(fft(:,ind),2); % Average selected motion's FFTs
    end
end