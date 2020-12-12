%%%
%%% Train the motion model
%%%

function [x_model, y_model] = train_model(filename_vec)
    x_model = [];
    y_model = [];
    for file = 1:length(filename_vec)
        [accel_x, accel_y, accel_z] = read_data(...
                            strcat('data/', filename_vec{file}));
        accel_x = accel_x(1:120,:);
        accel_y = accel_y(1:120,:);
        accel_z = accel_z(1:120,:);
        [freq char_x] = find_fft(accel_x);
        x_model(:,file) =  char_x;

        char_y = find_fft(accel_y);
        y_model(:,file) =  char_y;

    end
end

