%%%
%%% Train the motion model
%%%

function [x_model, y_model] = train_model(filename_vec)
    x_model = [];
    y_model = [];
    for file = 1:length(filename_vec)
        [accel_x, accel_y, accel_z] = read_data(...
                            strcat('data/', filename_vec{file}));
        accel_x = filter_time(accel_x);
        accel_y = filter_time(accel_y);
        accel_z = filter_time(accel_z);
        
        [freq char_x] = find_fft(accel_x);
        x_model(:,file) =  filter_freq(char_x);

        char_y = find_fft(accel_y);
        y_model(:,file) =  filter_freq(char_y);

    end
end

