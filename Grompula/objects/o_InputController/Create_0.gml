//True if player one will be using the keyboard
player_1_use_keyboard = true;

//debugging
last_key_pressed = "";

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

	move_horizontal[i] = 0;//Used to check the horizontal input of the left stick.
	move_vertical[i] = 0; //Used to check the vertical input of the left stick
	move_horizontal_pressed[i] = 0; //Used to check if the right stick horizontal input was just changed from the neutral position..
	move_vertical_pressed[i] = 0; //Used to check if the right stick vertical input was just changed from the neutral position.
	right_stick_horizontal[i] = 0; //Used to check the horizontal input of the right stick.
	right_stick_vertical[i] = 0; //Used to check the vertical input of the right stick
	fire[i] = 0; //Used to see if the fire button is being held down.
	secondary_fire[i] = 0; //Used to see if the secondary fire button is being held down.
	fire_pressed[i] = 0; //Used to see if the fire button was pressed this frame.
	secondary_fire_pressed[i] = 0; //Used to see if the secondary fire button was pressed this frame.
	reload[i] = 0; //Used to trigger a reload.
	switch_weapons[i] = 0; //Used to switch between primary and secondary weapon.
	character_action[i] = 0; //Used for rolling or other character actions.
	select[i] = 0; //The select key.
	previous_frame_horizontal_input[i] = 0; //Used for determining if the stick was just moved into the non-neutral position.
	previous_frame_vertical_input[i] = 0; //Used for determining if the stick was just moved into the non-neutral position.
	
}



//Set Deadzones
for(i = controller_slot_min; i <= controller_slot_max; i++){
	gamepad_set_axis_deadzone(i, .15);	
}

//Debug Controllers
for(var i = 0; i <= 12; i++){
	show_debug_message("Slot " + string(i) + " : " + gamepad_get_description(i));
}

