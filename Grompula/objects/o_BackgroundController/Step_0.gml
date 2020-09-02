//Make every grompuloid in the falling grompuloid fall
for(var i = 0; i < ds_list_size(falling_grompuloid_list); i++){
	
	var current_falling_grompuloid = ds_list_find_value(falling_grompuloid_list, i);
	
	//Move the falling grompuloid if it has not landed yet
	if(!current_falling_grompuloid.landed){	
		
		//Determine the fall speed for this frame
		var fall_speed_x = lengthdir_x(current_falling_grompuloid.falling_speed, current_falling_grompuloid.falling_direction);
		var fall_speed_y = lengthdir_y(current_falling_grompuloid.falling_speed, current_falling_grompuloid.falling_direction);
	
		//Move the grompuloid
		current_falling_grompuloid.falling_x += (fall_speed_x + background_speed);
		current_falling_grompuloid.falling_y = approach(current_falling_grompuloid.falling_y, current_falling_grompuloid.falling_destination_y, fall_speed_y);

		//Check if grompuloid has landed
		if(current_falling_grompuloid.falling_y == current_falling_grompuloid.falling_destination_y){
			current_falling_grompuloid.landed = true;	
			current_falling_grompuloid.sprite = spr_explosion1;
			current_falling_grompuloid.falling_direction = 90;
			current_falling_grompuloid.xscale = 3 * current_falling_grompuloid.attribute_multiplier;
			current_falling_grompuloid.yscale = 3 * current_falling_grompuloid.attribute_multiplier;
			current_falling_grompuloid.falling_y += 60 * current_falling_grompuloid.attribute_multiplier;
		}
		
	}

	//If the grompuloid has landed, explode him
	else {
		current_falling_grompuloid.sprite_frame += current_falling_grompuloid.sprite_speed;
		current_falling_grompuloid.falling_x += background_speed;
		if(current_falling_grompuloid.sprite_frame >= sprite_get_number(current_falling_grompuloid.sprite)){
			ds_list_delete(falling_grompuloid_list, i);
		}
		
	}
	
}
	
//Spawning falling grompuloids
falling_grompuloid_spawn_timer = approach(falling_grompuloid_spawn_timer, 0, 1);
if(falling_grompuloid_spawn_timer == 0){
	
	var new_falling_grompuloid = new falling_grompuloid();
	ds_list_add(falling_grompuloid_list, new_falling_grompuloid);
	falling_grompuloid_spawn_timer = irandom_range(60, 180);
}