function fig_handle = draw_zones(fig_handle, map, overlaps, swarm)

  NB_EDGES  = 32;% the higher the NB_EDGES (e.g., 20), the closest to a 2D circle 
  gray_shade = 0.01;
  
  %[X,Y,Z] = cylinder(map.building_width/2, NB_EDGES);
  %Z = map.max_height * Z;
  
 
  
  nb_buildings = length(map.buildings_north);
  
  

  
  if(swarm.nb_zones<1)
      
    % Generating Zones 
    fprintf("[-] Generating %d zones \n",nb_buildings);
  
    for i = 1:nb_buildings

      rng('shuffle'); %avoid repeating seeds
      randValue=rand(1,1);
      if ~swarm.dyn_radii
        myranvar = 1;
      else
        if overlaps > 0 %app.ZoneoverlapsCheckBox.value
          %fprintf('overlaps==%.1f',overlaps);
          myranvar = 1 - (0.25 * (overlaps/4) * randValue); %%with overlaps
        else
          myranvar = 1 + (0.5 * randValue); %%without overlaps
        end
      end
      
      %myranvar=1.5; <-- fixed radii
      %myranvar = 1 - (0.25 * rand(2,1)); %%SHOW CENTER

      zoneRadius=map.building_width/myranvar;
      swarm.add_zone(zoneRadius);

      [X,Y,Z] = cylinder(zoneRadius, NB_EDGES);
      Z = map.max_height * Z;
      
      Xtrasl = X + map.buildings_north(i);
      Ytrasl = Y + map.buildings_east(i);
      C = repmat(gray_shade*ones(size(Xtrasl)),1,1,3);
      surf(Ytrasl, Xtrasl, Z, C,'FaceAlpha',0.5);
      idString=sprintf("p_{%d}",i);
      text(Ytrasl(1), Xtrasl(1)-(zoneRadius),150,idString);
      
      fprintf(' [--] Adding zone %d (center [%.1f,%.1f,%.1f], radius %.1f)\n' ...
                ,i,Xtrasl(1)-(zoneRadius),Ytrasl(1), Z(2), zoneRadius);
      hold on;
    end
  else
      
      % Generating Zones
      fprintf("[-] Restoring %d zones \n",nb_buildings);

      
      for i = 1:swarm.nb_zones
        zoneRadius=swarm.get_zone(i);
        fprintf(' [--] Reading zone %d (radius %f)\n',i,zoneRadius);

        [X,Y,Z] = cylinder(zoneRadius, NB_EDGES);
        Z = map.max_height * Z;
      
        Xtrasl = X + map.buildings_north(i);
        Ytrasl = Y + map.buildings_east(i);
        C = repmat(gray_shade*ones(size(Xtrasl)),1,1,3);
        surf(Ytrasl, Xtrasl, Z, C,'FaceAlpha',0.5);
        idString=sprintf("p_{%d}",i);
        text(Ytrasl(1), Xtrasl(1)-(zoneRadius),150,idString);
        hold on;
	  end
  end
  
  map_width = map.width;
  axes_lim = [-map_width/5, map_width+map_width/5, ...
      -map_width/5, map_width+map_width/5, ...
      0, 1.2*map.max_height];
  axis(axes_lim);
  axis square;
  view(0,90);
end