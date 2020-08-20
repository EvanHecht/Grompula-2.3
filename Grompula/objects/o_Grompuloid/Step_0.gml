//Update functional variables
center_x = x;
center_y = y - 45;


//AI State Machine
switch(state){
	
	#region "entry" state
	case "entry":
		state = "falling";
	break;
	#endregion
	
	#region "falling" state
	case "falling":
		
		if(y == target_spawner.y){
			state = "pursuit";	
		} else {
			y = approach(y, target_spawner.y, current_falling_speed);
			current_falling_speed += current_falling_acceleration;	
		}
		
	break;
	#endregion
	
	#region "pursuit" state
	case "pursuit":
		
		//Check if can attack
		if(current_target != -1 && point_distance(center_x, center_y, current_target.center_x, current_target.center_y) <= attack_range){
			state = "attack";
		} 
		
		//If cannot attack
		else {
		
		//Set sprite
		set_sprite(spr_grompuloid_moving);
		
		//TARGETING----------------------------------------------
		var targets = instance_nearest_list(x, y, o_Player);
		
		//Re-target if
		if(retarget_counter == 0 && (current_target == -1 || current_target.dead == true || path_get_length(unit_path) > aggro_range)){
			
			var shortest_distance = -1;
			var determined_target = -1;
			
			//Check all possible targets
			for(var i = 0; i < ds_list_size(targets); i++){
				var checking_target = ds_list_find_value(targets, i);
				if(!checking_target.dead){
					var path_available = mp_grid_path(o_RoomGrid.room_grid, unit_path, x, y, checking_target.x, checking_target.y, true);
					var current_path_length = path_get_length(unit_path);
					if(path_available && (current_path_length < shortest_distance || shortest_distance = -1)){
						determined_target = checking_target;
					}	
				}
			}
			
			//Finalize Target
			current_target = determined_target;
			retarget_counter = retarget_cooldown;
		}
		
		//Decrement Retarget Timer
		retarget_counter = approach(retarget_counter, 0, 1);
		
		//TARGETING----------------------------------------------------
		
		
		//Move towards target
		if(current_target != -1){
			mp_grid_path(o_RoomGrid.room_grid, unit_path, x, y, current_target.x, current_target.y, true);
			path_start(unit_path, current_movement_speed, path_action_stop, false);
		}
		
		// Set animation
		set_sprite(spr_grompuloid_moving);
		if(current_target.x > x) {
			image_xscale = 1	
		} else {
			image_xscale = -1
		}
		
		}
		
		
		
	break;
	#endregion
	
	#region "attack" state
	case "attack":
	
	//Set sprite
	set_sprite(spr_grompuloid_idle);
	
	//Stop moving
	path_end();
	
	//Attacking
	if(!attacked && current_target != -1){
		o_GameController.create_args[0] = id
		bite_object = instance_create_depth(x, y, -y - 1, o_GrompuloidBite);
		attacked = true;
	}
	
	
	
	break;
	#endregion
	
}

//Set depth
depth = -y;


//Death
if(hp <= 0){
	instance_destroy();	
}