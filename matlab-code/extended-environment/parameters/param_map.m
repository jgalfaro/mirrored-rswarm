%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters for the map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



if DRONE_TYPE == "quadcopter" || DRONE_TYPE == "point_mass"
    map.width = 300; %300 the map is of size (width)x(width)
    map.max_height = 100; %100 maximum height of trees
elseif DRONE_TYPE == "fixed_wing"
    map.width = 4000; %4000 the map is of size (width)x(width)
    map.max_height = 10; %10 maximum height of trees
end

if exist('ACTIVE_ENVIRONMENT', 'var')
    map.ACTIVE_ENVIRONMENT = ACTIVE_ENVIRONMENT; % for those functions calling map
end
    
if ~exist('ACTIVE_ENVIRONMENT', 'var') || ACTIVE_ENVIRONMENT == false     
    return 
end

if exist('ACTIVE_ENVIRONMENT', 'var') && ACTIVE_ENVIRONMENT == true    

    % number of blocks per row
    if app.SparsitySlider.Value < 4
            map.nb_blocks = 1; 
            disp('Sparsity 1');
    elseif app.SparsitySlider.Value < 6
            map.nb_blocks = 2; 
            disp('Sparsity 2');            
    elseif app.SparsitySlider.Value < 8
            map.nb_blocks = 3; 
            disp('Sparsity 3');            
    elseif app.SparsitySlider.Value < 10
            map.nb_blocks = 4; 
            disp('Sparsity 4');            
    end
    
    map.street_width_perc = 0.5; % percentage of block that is empty

    map.building_width = map.width/map.nb_blocks*(1-map.street_width_perc);
    map.street_width = map.width/map.nb_blocks*map.street_width_perc;

    %map.building_shape = 'cylinder';
    %map.building_shape = 'parallelepiped';
    
    %ccece-paper__here
    map.building_shape = 'zone';

    % Create buildings parameters
    map = create_shifted_buildings(map);
    %map = create_buildings(map);
end

