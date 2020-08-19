//Check if player 1 is using keyboard
var controller_index_modifer = 0;
if(player_1_use_keyboard) controller_index_modifer = 1;

//Update Inputs
for(var i = 1; i <= o_GameController.current_number_of_players; i++){
	
	var current_device = controller_slot_min + i - 1 - controller_index_modifer;
	
	//Player 1 Keyboard Controls
	if(i == 1 && player_1_use_keyboard){
		
		move_horizontal[i] = -keyboard_check(ord("A")) + keyboard_check(ord("D"));
		move_vertical[i] = -keyboard_check(ord("W")) + keyboard_check(ord("S"));
		move_horizontal_pressed[i] = -keyboard_check_pressed(ord("A")) + keyboard_check_pressed(ord("D"));
		move_vertical_pressed[i] = -keyboard_check_pressed(ord("W")) + keyboard_check_pressed(ord("S"));
		right_stick_horizontal[i] = 0;
		right_stick_vertical[i] = 0;
		fire[i] = mouse_check_button(mb_left);
		secondary_fire[i] = mouse_check_button(mb_right);
		fire_pressed[i] = mouse_check_button_pressed(mb_left);
		secondary_fire_pressed[i] = mouse_check_button_pressed(mb_right);
		reload[i] = keyboard_check_pressed(ord("R"));
		switch_weapons[i] = keyboard_check_pressed(ord("Q"));
		character_action[i] = keyboard_check_pressed(vk_shift);
		select[i] = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
		
	} 
	
	//Controllers Bindings
	else {
		
		move_horizontal[i] = gamepad_axis_value(current_device, gp_axislh);
		move_vertical[i] = gamepad_axis_value(current_device, gp_axislv);
		right_stick_horizontal[i] = gamepad_axis_value(current_device, gp_axisrh);
		right_stick_vertical[i] = gamepad_axis_value(current_device, gp_axisrv);
		fire[i] = gamepad_button_check(current_device, gp_shoulderrb);
		secondary_fire[i] = gamepad_button_check(current_device, gp_shoulderlb);
		fire_pressed[i] = gamepad_button_check_pressed(current_device, gp_shoulderrb);
		secondary_fire_pressed[i] = gamepad_button_check_pressed(current_device, gp_shoulderlb);
		reload[i] = gamepad_button_check_pressed(current_device, gp_face3);
		switch_weapons[i] = gamepad_button_check_pressed(current_device, gp_face4);
		character_action[i] = gamepad_button_check_pressed(current_device, gp_face1);
		select[i] = gamepad_button_check_pressed(current_device, gp_face1);
		
		//Used for determining if the stick was just moved into the non-neutral position
		if(previous_frame_horizontal_input[i] == 0) move_horizontal_pressed[i] = sign(gamepad_axis_value(current_device, gp_axislh));
		else move_horizontal_pressed[i] = 0;
		if(previous_frame_vertical_input[i] == 0) move_vertical_pressed[i] = sign(gamepad_axis_value(current_device, gp_axislv));
		move_vertical_pressed[i] = 0;
		previous_frame_horizontal_input[i] = move_horizontal[i];
		previous_frame_vertical_input[i] = move_vertical[i];
				
	
	}
	show_debug_message("Left Stick: " + string(gamepad_axis_value(current_device, gp_axislh)));
}

