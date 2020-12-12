%%%
%%%  Create subplot of all time and frequency domain plots across all axes
%%%  of inputted motion data
%%%

function plot_exploratory(filenames)
    
    r = 3; % Specify number of rows in subplot
    c = 6; % Specify number of columns in subplot

    for i = 1:length(filenames)

        [accel_x, accel_y, accel_z] = read_data( ...
            strcat('data/', filenames{i}));

        accel_x = filter_time(accel_x);
        accel_y = filter_time(accel_y);
        accel_z = filter_time(accel_z);

        subplot(r, c, c*(i-1)+1);
        hold on;
        plot(accel_x)
        title('Time Domain (x)');

        subplot(r, c, c*(i-1)+2);
        hold on;
        plot(accel_y)
        title('Time Domain (y)');

        subplot(r, c, c*(i-1)+3);
        hold on;
        plot(accel_z)
        title('Time Domain (z)');

        subplot(r, c, c*(i-1)+4);
        hold on;
        [frequencies_shift, y_shift] = find_fft(accel_x);
        [y_filter] = filter_freq(y_shift);
        stem(frequencies_shift, y_filter);
        title('Frequency Domain (x)');

        subplot(r, c, c*(i-1)+5);
        hold on;
        [frequencies_shift, y_shift] = find_fft(accel_y);
        [y_filter] = filter_freq(y_shift);
        stem(frequencies_shift, y_filter);
        title('Frequency Domain (y)');

        subplot(r, c, c*(i-1)+6);
        hold on;
        [frequencies_shift, y_shift] = find_fft(accel_z);
        [y_filter] = filter_freq(y_shift);
        stem(frequencies_shift, y_filter);
        title('Frequency Domain (z)');

    end
    
end


