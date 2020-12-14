%%%
%%% Identify motions based on filename
%%%

function [id] = id_motion(filenames)
   
    id = {}; 
    for file = 1:length(filenames)
        name = filenames{file};
        name = split(name, {'-'});
        name = name{1};
        id{file} = name; 
    end
    
end