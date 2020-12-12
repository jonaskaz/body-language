%%%
%%%  Apply moving average filter to time domain
%%%

function [accel_filt] = filter_time(accel)

    % Apply moving average filter to time domain
    accel = accel(1:120,:);
    accel_filt = movmean(accel,7);
    
end