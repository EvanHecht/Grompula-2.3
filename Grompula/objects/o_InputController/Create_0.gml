//Declare Input Variables
player_1_use_keyboard = true;

//Functional variables


#region Adjust controller slots based on platform
current_platform = "xbox";

//Switch
if(current_platform == "switch"){
	controller_slot_min = 4;
	controller_slot_max = 7;
} else {
	controller_slot_min = 0;
	controller_slot_max = 3;
}
	
#endregion 

//Initialize Input Variables
for(var i = 1; i <= o_GameController.max_number_of_players; i++){

	move_horizontal[i] = 0;
	move_vertical[i] = 0;
	right_stick_horizontal[i] = 0;
	right_stick_vertical[i] = 0;
	fire[i] = 0;
	secondary_fire[i] = 0;
	fire_pressed[i] = 0;
	secondary_fire_pressed[i] = 0;
	reload[i] = 0;
	switch_weapons[i] = 0;
	character_action[i] = 0;
	horizontal_input_neutral[i] = true;
	vertical_input_neutral[i] = true;
	move_horizontal_pressed[i] = 0;
	move_vertical_pressed[i] = 0;
	select[i] = 0;
	
	
	//Used for determining if the stick was just moved into the non-neutral position
	previous_frame_horizontal_input[i] = 0;
	previous_frame_vertical_input[i] = 0;
	
}



//Set Deadzones
for(i = controller_slot_min; i <= controller_slot_max; i++){
	gamepad_set_axis_deadzone(i, .15);	
}

//Debug Controllers
for(var i = 0; i <= 12; i++){
	show_debug_message("Slot " + string(i) + " : " + gamepad_get_description(i));
}

