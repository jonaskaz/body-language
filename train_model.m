%%%
%%% Train the motion model
%%%

function [model] = train_model(filenames)
    x_model = [];
    y_model = [];
    
    for file = 1:length(filenames)
        [accel_x, accel_y, accel_z] = read_data(...
                            strcat('data/', filenames{file}));
                        
        accel_x = filter_time(accel_x);
        accel_y = filter_time(accel_y);
        accel_z = filter_time(accel_z);
        
        [~, y_shift] = find_fft(accel_x);
        x_model(:,file) =  filter_freq(y_shift);

        [~, y_shift] = find_fft(accel_y);
        y_model(:,file) =  filter_freq(y_shift);
    end
    
    model = [x_model; y_model];
    
end

