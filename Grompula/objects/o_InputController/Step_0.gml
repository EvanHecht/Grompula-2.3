//Input controller state machine
switch(state){
	
	#region Input Processing State (The standard state)
	case "input processing":
	
	//Check if player 1 is using keyboard
	var controller_index_modifier = 0;
	if(player_1_use_keyboard) controller_index_modifier = -1;

	//Update Inputs
	for(var i = 1; i <= o_GameController.current_number_of_players; i++){
			
		//Player 1 Keyboard Controls
		if(i == 1 && player_1_use_keyboard){
		
			move_left[i] = read_input(move_left_binding[0], false, -1);
			move_right[i] = read_input(move_right_binding[0], false, -1);
			move_up[i] = read_input(move_up_binding[0], false, -1);
			move_down[i] = read_input(move_down_binding[0], false, -1);
			move_left_pressed[i] = read_input(move_left_binding[0], true, -1);
			move_right_pressed[i] = read_input(move_right_binding[0], true, -1);
			move_up_pressed[i] = read_input(move_up_binding[0], true, -1);
			move_down_pressed[i] = read_input(move_down_binding[0], true, -1);
			move_horizontal[i] = -move_left[i] + move_right[i];
			move_vertical[i] = -move_up[i] + move_down[i];
			move_horizontal_pressed[i] = -move_left_pressed[i] + move_right_pressed[i];
			move_vertical_pressed[i] = -move_up_pressed[i] + move_down_pressed[i];
			right_stick_horizontal[i] = 0; //Keyboard uses mouse instead.
			right_stick_vertical[i] = 0;//Keyboard uses mouse instead.
			fire[i] = read_input(fire_binding[0], false, -1);
			fire_pressed[i] = read_input(fire_binding[0], true, -1);
			secondary_fire[i] = read_input(secondary_fire_binding[0], false, -1);
			secondary_fire_pressed[i] = read_input(secondary_fire_binding[0], true, -1);
			reload[i] = read_input(reload_binding[0], false, -1);
			reload_pressed[i] = read_input(reload_binding[0], true, -1);
			switch_weapons[i] = read_input(switch_weapons_binding[0], false, -1);
			switch_weapons_pressed[i] = read_input(switch_weapons_binding[0], true, -1);
			character_action[i] = read_input(character_action_binding[0], false, -1);
			character_action_pressed[i] = read_input(character_action_binding[0], true, -1);
			select[i] = read_input(select_binding[0], false, -1);
			select_pressed[i] = read_input(select_binding[0], true, -1);
			move_horizontal_previous_frame[i] = 0;
			move_vertical_previous_frame[i] = 0;
		
		} 
	
		//Controllers Bindings
		else{
			
			var current_device_index = controller_slot[i - 1 + controller_index_modifier];
			
			move_left[i] = -read_input(move_left_binding[i], false, current_device_index);
			move_right[i] = read_input(move_right_binding[i], false, current_device_index);
			move_up[i] = -read_input(move_up_binding[i], false, current_device_index);
			move_down[i] = read_input(move_down_binding[i], false, current_device_index);
			move_horizontal[i] = -move_left[i] + move_right[i];
			move_vertical[i] = -move_up[i] + move_down[i];
			
			//Move horizontal | right | left pressed
			if(move_horizontal[i] != 0 && sign(move_horizontal_previous_frame[i]) != move_horizontal[i]){
				move_horizontal_pressed[i] = sign(move_horizontal[i]);
				move_right_pressed[i] = max(0, move_horizontal_pressed[i]);
				move_left_pressed[i] = min(0, move_horizontal_pressed[i]);
			} else {
				move_horizontal_pressed[i] = 0;
				move_right_pressed[i] = 0;
				move_left_pressed[i] = 0;
			}
			
			//Move vertical | down | up pressed
			if(move_vertical[i] != 0 && sign(move_vertical_previous_frame[i]) != move_vertical[i]){
				move_vertical_pressed[i] = sign(move_vertical[i]);
				move_down_pressed[i] = max(0, move_vertical_pressed[i]);
				move_up_pressed[i] = min(0, move_vertical_pressed[i]);
			} else {
				move_vertical_pressed[i] = 0;
				move_down_pressed[i] = 0;
				move_up_pressed[i] = 0;
			}
			
			right_stick_horizontal[i] = read_input("right stick horizontal", false, current_device_index);
			right_stick_vertical[i] = read_input("right stick vertical", false, current_device_index);
			fire[i] = read_input(fire_binding[i], false, current_device_index);
			fire_pressed[i] = read_input(fire_binding[i], true, current_device_index);
			secondary_fire[i] = read_input(secondary_fire_binding[i], false, current_device_index);
			secondary_fire_pressed[i] = read_input(secondary_fire_binding[i], true, current_device_index);
			reload[i] = read_input(reload_binding[i], false, current_device_index);
			reload_pressed[i] = read_input(reload_binding[i], true, current_device_index);
			switch_weapons[i] = read_input(switch_weapons_binding[i], false, current_device_index);
			switch_weapons_pressed[i] = read_input(switch_weapons_binding[i], true, current_device_index);
			character_action[i] = read_input(character_action_binding[i], false, current_device_index);
			character_action_pressed[i] = read_input(character_action_binding[i], true, current_device_index);
			select[i] = read_input(select_binding[i], false, current_device_index);
			select_pressed[i] = read_input(select_binding[i], true, current_device_index);
		
			//Store previous frame values for next frame
			move_horizontal_previous_frame[i] = move_horizontal_pressed[i];
			move_vertical_previous_frame[i] = move_vertical_pressed[i];
			
		}
	}
	
	break;
	#endregion

}