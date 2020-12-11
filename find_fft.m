%%%
%%% Find Characteristic Frequencies
%%%


function [fft_vec] = find_fft(accel)
    N = length(accel);
    frequencies_shifted = linspace(-pi, pi-2/N*pi, N) + pi/N*mod(N,2);
    fft_vec = fft(accel);
    stem(frequencies_shifted, abs(fftshift(fft_vec)))
end
