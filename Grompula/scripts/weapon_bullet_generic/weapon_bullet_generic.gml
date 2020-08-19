function weapon_bullet_generic() {
	//Determine next frame position
	var destination_x = x + lengthdir_x(bullet_speed, angle);
	var destination_y = y + lengthdir_y(bullet_speed, angle);

	//Determine targets that will be hit
	collision_line_list(x, y, destination_x, destination_y, o_Shootable, false, true, frame_targets, true);

	for(var i = 0; i < ds_list_size(frame_targets); i++){
	
		var target = ds_list_find_value(frame_targets, i);
		if(ds_list_find_index(bullet_hit_list, target) == -1){
			inflict_damage(bullet_damage, target);
			enemies_hit++;
			if(enemies_hit >= bullet_penetration){
				active = false;
			} else {
				ds_list_add(bullet_hit_list, target);	
			}
		}
	}

	//Range
	distance_traveled += point_distance(x, y, destination_x, destination_y);
	if(distance_traveled >= bullet_range){
		active = false;
	}

	//Move
	x = destination_x;
	y = destination_y;


}
