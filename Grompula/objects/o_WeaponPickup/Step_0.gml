switch(state){
	
	#region floating state
	case "floating":
	
		//Weapon Floating
		if(float_direction == 1){
			y = approach(y, starting_y + float_distance, float_speed);
			if(y == starting_y + float_distance) float_direction = 2;
		}

		else if(float_direction == 2){

			y = approach(y, starting_y - float_distance, float_speed);
			if(y == starting_y - float_distance) float_direction = 1;
	
		}

		//Check if players are close enough to interact
		player_in_range = false;
		for(var i = 1; i <= o_GameController.current_number_of_players; i++){
	
			var current_player = scr_get_player(i);
	
			//If a player is close enough
			if(point_distance(shadow_x, shadow_y, current_player.x, current_player.y) <= interaction_range){
		
				//Indicate that the player is in range
				player_in_range = true;
		
				//Player Picking Up
				if(o_InputController.select_pressed[i]){
					interacting_player = current_player;
					state = "aquiring";
					var angle = point_direction(x, y, interacting_player.player_weapon.x, interacting_player.player_weapon.y) + 180;
					turning_point_x = interacting_player.player_weapon.x + lengthdir_x(turning_point_distance, angle);
					turning_point_y = interacting_player.player_weapon.y + lengthdir_y(turning_point_distance, angle)
			
				}
		
			}

		}
		
	break;
	#endregion
	
	#region aquiring state
	case "aquiring":
		
		//Move towards destination
		image_xscale = approach(image_xscale, interacting_player.image_xscale, grow_speed);
		image_yscale = approach(image_yscale, interacting_player.image_yscale, grow_speed);
		var target_weapon = interacting_player.player_weapon;
		
		var speed_percentage = 1 - (point_distance(target_weapon.x, target_weapon.y, x, y)/point_distance(target_weapon.x, target_weapon.y, turning_point_x, turning_point_y));
		var fly_speed = max(fly_base_speed * speed_percentage, 1);
		
		
		//Determine destination
		var target_x; 
		var target_y;
		if(fly_direction == "away"){
			target_x = turning_point_x;
			target_y = turning_point_y;
	
		} else {
			target_x = target_weapon.x;
			target_y = target_weapon.y;
		}
		
		var movement_direction = point_direction(x, y, target_x, target_y);
		var x_increment = abs(lengthdir_x(fly_speed, movement_direction));
		var y_increment = abs(lengthdir_y(fly_speed, movement_direction));
		x = approach(x, target_x, x_increment);
		y = approach(y, target_y, y_increment);
		
		//Check if reached destination
		if(within(x, target_x, 20) && within(y, target_y, 20)){
			if(fly_direction == "away"){
				fly_direction = "towards";
			} else {
				set_weapon(interacting_player, pickup_weapon_type, "current");
				instance_destroy();
			}
			
		}
		
	break;
	#endregion
	
	


}





//Player Interaction






//Handle Depth
depth = -shadow_y;