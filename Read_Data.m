%%%
%%% Read Data
%%%


function [accel_x, accel_y, accel_z] = Read_Data(filename)
    % Read and parse data
    accel_struct = load(filename);
    accel_time = table2array(accel_struct.Acceleration);
    accel_x = accel_time(:,1);
    accel_y = accel_time(:,2);
    accel_z = accel_time(:,3);
end

