
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
	
	set_sprite(spr_Spitter_moving);
		
		//TARGETING----------------------------------------------
		var targets = instance_nearest_list(x, y, o_Player);
		
		//Re-target if-
		if(current_target == -1 || current_target.dead == true || path_get_length(unit_path) > aggro_range){
			
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
		}
		//TARGETING----------------------------------------------------
		
		
		//Move towards target
		if(current_target != -1){
			mp_grid_path(o_RoomGrid.room_grid, unit_path, x, y, current_target.x, current_target.y, true);
			path_start(unit_path, current_movement_speed, path_action_stop, false);
		}
		
		//Determine if close enough to enter sentry mode
		if(current_target != -1 && point_distance(x, y, current_target.x, current_target.y) < sentry_range) {
			state = "sentry";
		}
		
		
	break;
	#endregion
	
	#region "sentry" state
	case "sentry": 
	
	if(sprite_index == spr_Spitter_sentry_shooting) {
		if(animation_finished())
			set_sprite(spr_Spitter_sentry_idle)
	} else {
		set_sprite(spr_Spitter_sentry_idle);
	}
	
	
	path_end(); // Stop previous pursuit path
	
	//TARGETING----------------------------------------------
		var targets = instance_nearest_list(x, y, o_Player);
		
		//Re-target if-
		if(current_target == -1 || current_target.dead == true || path_get_length(unit_path) > aggro_range){
			
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
		}
		//TARGETING----------------------------------------------------
		
		
		// Determine if close enough to attack
		attack_timer = approach(attack_timer, 0, 1);
		if(current_target != -1 && point_distance(x, y, current_target.x, current_target.y) < attack_range && attack_timer <= 0){
			attack_timer = 70;
		
			// Attack animation starts timing to attack and spawn spit ball
			set_sprite(spr_Spitter_sentry_shooting);
			o_GameController.create_args[2] = current_target.id
			instance_create_depth(x,y,-999999,o_spitball);
			
		}
		
		// Determine to go back to pursuit
		if(current_target != -1 && point_distance(x, y, current_target.x, current_target.y) > attack_range) {
			state = "pursuit"
		}
		
		
	
	break;
	#endregion
	
}



// Set sprite and direction
		if(current_target.x > x) {
			image_xscale = 1	
		} else {
			image_xscale = -1
		}

//Death
if(hp <= 0){
	instance_destroy();	
}