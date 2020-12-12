%%%
%%% Apply Fourier Transform to acceleration data
%%%

function [frequencies_shift, y_shift] = find_fft(accel)
    N = length(accel);
    frequencies_shift = linspace(-pi, pi-2/N*pi, N) + pi/N*mod(N,2);
    y_shift = fftshift(abs(fft(accel)));
    %fft_vec = fft(accel);
    %stem(frequencies_shifted, abs(fftshift(fft_vec)))
end
