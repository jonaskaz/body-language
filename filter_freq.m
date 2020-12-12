%%%
%%%  Filter out amplitudes above 100 in frequency domains
%%%

function [y_filter] = filter_freq(y_shift)

    % Filter out amplitudes above 100 
    ind = y_shift > 100;
    y_filter = y_shift;
    y_filter(ind) = 0;
    
end