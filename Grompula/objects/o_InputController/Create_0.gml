
//True if player one will be using the keyboard
player_1_use_keyboard = true;
state = "input processing";

//debugging
debug = false;
last_key_pressed = "";

#region Assign Controllers To Slots & Gather Information About Them

controller_slot = [-1, -1, -1, -1];
controller_type = ["No Controller Connected", "No Controller Connected", "No Controller Connected", "No Controller Connected"];
number_of_controller_slots = 4;

//This function is called to assign controllers to controller slots.
function assign_controller_slots(){

	//Loop through all controller slots and find which ones are occupied
	var current_slot_to_fill = 0;
	for(var i = 0; i < gamepad_get_device_count() && current_slot_to_fill < 4; i++){
	 
		show_debug_message("Slot " + string(i) + ": " + gamepad_get_description(i));
		
		//Check if a controller is connected in the slot, and if so, assign it to a slot
		if(gamepad_is_connected(i)){
			controller_slot[current_slot_to_fill] = i;
			controller_type[current_slot_to_fill] = gamepad_get_description(i);
			current_slot_to_fill++;
		}
	
	}
	
}
	
//Call the assign controller slots function
assign_controller_slots();
#endregion

#region Define the Input Grid

//--------------------------------------------------------------------------------------------------------

/*
					  Input Grid
					   
		  0				   1                 2					   
-------------------------------------------------------
| Input Name List | Input Code List | Input Type List |
-------------------------------------------------------

*/

//Set up the input grid
global.input_grid = ds_grid_create(3, 1);
#macro input_grid_name 0
#macro input_grid_code 1
#macro input_grid_type 2
input_name_list = ds_list_create(); //Holds the name of every input
input_code_list = ds_list_create(); //Holds the input code of every input
input_type_list = ds_list_create(); //Holds the type of input for each entry (Keyboard, Mouse, Controller)
ds_grid_set(global.input_grid, input_grid_name, 0, input_name_list);
ds_grid_set(global.input_grid, input_grid_code, 0, input_code_list);
ds_grid_set(global.input_grid, input_grid_type, 0, input_type_list);

//--------------------------------------------------------------------------------------------------------
#endregion

#region Define all inputs

//Function for defining inputs
function input_define(name, code, type){
	
	//Add the input to all of the lists
	ds_list_add(input_name_list, name);
	ds_list_add(input_code_list, code);
	ds_list_add(input_type_list, type);
	
}

//Define all keyboard inputs (Sorted By Keycode)
input_define("left click", 1, input_type_mouse);
input_define("right click", 2, input_type_mouse);
input_define("middle click", 3, input_type_mouse);
input_define("middle click 2", 4, input_type_mouse);
input_define("x1 click", 5, input_type_mouse);
input_define("x2 click", 6, input_type_mouse);
//Keycode 7 is Undefined.
input_define("backspace", 8, input_type_keyboard);
input_define("tab", 9, input_type_keyboard);
//Keycode 10 is undefined.
//Keycode 11 is undefined.
input_define("clear", 12, input_type_keyboard);
input_define("enter", 13, input_type_keyboard);
//Keycode 14 is undefined.
//Keycode 15 is undefined.
input_define("shift", 16, input_type_keyboard);
input_define("control", 17, input_type_keyboard);
input_define("alt", 18, input_type_keyboard);
input_define("pause", 19, input_type_keyboard);
input_define("caps lock", 20, input_type_keyboard);
input_define("kana mode", 21, input_type_keyboard);
//Keycode 22 is undefined.
input_define("junja mode", 23, input_type_keyboard);
input_define("final mode", 24, input_type_keyboard);
input_define("hanja mode", 25, input_type_keyboard);
//Keycode 26 is undefined.
input_define("escape", 27, input_type_keyboard);
input_define("convert", 28, input_type_keyboard);
input_define("non-convert", 29, input_type_keyboard);
input_define("accept", 30, input_type_keyboard);
input_define("mode change", 31, input_type_keyboard);
input_define("space", 32, input_type_keyboard);
input_define("page up", 33, input_type_keyboard);
input_define("page down", 34, input_type_keyboard);
input_define("end", 35, input_type_keyboard);
input_define("home", 36, input_type_keyboard);
input_define("left arrow", 37, input_type_keyboard);
input_define("up arrow", 38, input_type_keyboard);
input_define("right arrow", 39, input_type_keyboard);
input_define("down arrow", 40, input_type_keyboard);
input_define("select", 41, input_type_keyboard);
input_define("print", 42, input_type_keyboard);
input_define("execute", 43, input_type_keyboard);
input_define("print screen", 44, input_type_keyboard);
input_define("insert", 45, input_type_keyboard);
input_define("delete", 46, input_type_keyboard);
input_define("help", 47, input_type_keyboard);
input_define("0", 48, input_type_keyboard);
input_define("1", 49, input_type_keyboard);
input_define("2", 50, input_type_keyboard);
input_define("3", 51, input_type_keyboard);
input_define("4", 52, input_type_keyboard);
input_define("5", 53, input_type_keyboard);
input_define("6", 54, input_type_keyboard);
input_define("7", 55, input_type_keyboard);
input_define("8", 56, input_type_keyboard);
input_define("9", 57, input_type_keyboard);
input_define("a", 65, input_type_keyboard);
input_define("b", 66, input_type_keyboard);
input_define("c", 67, input_type_keyboard);
input_define("d", 68, input_type_keyboard);
input_define("e", 69, input_type_keyboard);
input_define("f", 70, input_type_keyboard);
input_define("g", 71, input_type_keyboard);
input_define("h", 72, input_type_keyboard);
input_define("i", 73, input_type_keyboard);
input_define("j", 74, input_type_keyboard);
input_define("k", 75, input_type_keyboard);
input_define("l", 76, input_type_keyboard);
input_define("m", 77, input_type_keyboard);
input_define("n", 78, input_type_keyboard);
input_define("o", 79, input_type_keyboard);
input_define("p", 80, input_type_keyboard);
input_define("q", 81, input_type_keyboard);
input_define("r", 82, input_type_keyboard);
input_define("s", 83, input_type_keyboard);
input_define("t", 84, input_type_keyboard);
input_define("u", 85, input_type_keyboard);
input_define("v", 86, input_type_keyboard);
input_define("w", 87, input_type_keyboard);
input_define("x", 88, input_type_keyboard);
input_define("y", 89, input_type_keyboard);
input_define("z", 90, input_type_keyboard);
input_define("left windows key", 91, input_type_keyboard);
input_define("right windows key", 92, input_type_keyboard);
input_define("applications key", 93, input_type_keyboard);
//Keycode 94 is undefined.
input_define("sleep", 95, input_type_keyboard);
input_define("numpad 0", 96, input_type_keyboard);
input_define("numpad 1", 97, input_type_keyboard);
input_define("numpad 2", 98, input_type_keyboard);
input_define("numpad 3", 99, input_type_keyboard);
input_define("numpad 4", 100, input_type_keyboard);
input_define("numpad 5", 101, input_type_keyboard);
input_define("numpad 6", 102, input_type_keyboard);
input_define("numpad 7", 103, input_type_keyboard);
input_define("numpad 8", 104, input_type_keyboard);
input_define("numpad 9", 105, input_type_keyboard);
input_define("multiply", 106, input_type_keyboard);
input_define("add", 107, input_type_keyboard);
input_define("seperator", 108, input_type_keyboard);
input_define("subtract", 109, input_type_keyboard);
input_define("decimal", 110, input_type_keyboard);
input_define("divide", 111, input_type_keyboard);
input_define("F1", 112, input_type_keyboard);
input_define("F2", 113, input_type_keyboard);
input_define("F3", 114, input_type_keyboard);
input_define("F4", 115, input_type_keyboard);
input_define("F5", 116, input_type_keyboard);
input_define("F6", 117, input_type_keyboard);
input_define("F7", 118, input_type_keyboard);
input_define("F8", 119, input_type_keyboard);
input_define("F9", 120, input_type_keyboard);
input_define("F10", 121, input_type_keyboard);
input_define("F11", 122, input_type_keyboard);
input_define("F12", 123, input_type_keyboard);
input_define("F13", 124, input_type_keyboard);
input_define("F14", 125, input_type_keyboard);
input_define("F15", 126, input_type_keyboard);
input_define("F16", 127, input_type_keyboard);
//Keycodes 128-143 are unbindable
input_define("num lock", 144, input_type_keyboard);
input_define("scroll lock", 145, input_type_keyboard);
input_define("misc key 1", 146, input_type_keyboard);
input_define("misc key 2", 147, input_type_keyboard);
input_define("misc key 3", 148, input_type_keyboard);
input_define("misc key 4", 149, input_type_keyboard);
input_define("misc key 5", 150, input_type_keyboard);
//Keycodes 151-159 are unbindable
input_define("left shift", 160, input_type_keyboard);
input_define("right shift", 161, input_type_keyboard);
input_define("left control", 162, input_type_keyboard);
input_define("right control", 163, input_type_keyboard);
input_define("left alt", 164, input_type_keyboard);
input_define("right alt", 165, input_type_keyboard);
//Keycodes 166-185 are obscure and will not be used
input_define(";", 186, input_type_keyboard);
input_define("=", 187, input_type_keyboard);
input_define(",", 188, input_type_keyboard);
input_define("-", 189, input_type_keyboard);
input_define(".", 190, input_type_keyboard);
input_define("/", 191, input_type_keyboard);
input_define("`", 192, input_type_keyboard);
//Keycodes 192-218 are undefined.
input_define("[", 219, input_type_keyboard);
input_define("\\", 220, input_type_keyboard);
input_define("]", 221, input_type_keyboard);
input_define("'", 222, input_type_keyboard);
//keycodes 223-232 are obscure.
input_define("misc key 6", 233, input_type_keyboard);
input_define("misc key 7", 234, input_type_keyboard);
input_define("misc key 8", 235, input_type_keyboard);
input_define("misc key 9", 236, input_type_keyboard);
input_define("misc key 10", 237, input_type_keyboard);
input_define("misc key 11", 238, input_type_keyboard);
input_define("misc key 12", 239, input_type_keyboard);
input_define("misc key 13", 240, input_type_keyboard);
input_define("misc key 14", 241, input_type_keyboard);
input_define("misc key 15", 242, input_type_keyboard);
input_define("misc key 16", 243, input_type_keyboard);
input_define("misc key 17", 244, input_type_keyboard);
input_define("misc key 18", 245, input_type_keyboard);
input_define("attention", 246, input_type_keyboard);
input_define("crsel", 247, input_type_keyboard);
input_define("exsel", 248, input_type_keyboard);
input_define("erase", 249, input_type_keyboard);
input_define("play", 250, input_type_keyboard);
input_define("zoom", 251, input_type_keyboard);
//Keycode 252 is undefined.
input_define("pa1", 253, input_type_keyboard);
input_define("oem clear", 254, input_type_keyboard);

//Mouse Scroll (These codes are made up by me)
input_define("scroll up", 260, input_type_scroll);
input_define("scroll down", 261, input_type_scroll);


//Controller Input Definitions (These codes are made by me)
input_define("face 1", 300, input_type_controller);
input_define("face 2", 301, input_type_controller);
input_define("face 3", 302, input_type_controller);
input_define("face 4", 303, input_type_controller);
input_define("left bumper", 304, input_type_controller);
input_define("left trigger", 305, input_type_controller);
input_define("right bumper", 306, input_type_controller);
input_define("right trigger", 307, input_type_controller);
input_define("select", 308, input_type_controller);
input_define("start", 310, input_type_controller);
input_define("left stick press", 310, input_type_controller);
input_define("right stick press", 311, input_type_controller);
input_define("dpad up", 312, input_type_controller);
input_define("dpad down", 313, input_type_controller);
input_define("dpad left", 314, input_type_controller);
input_define("dpad right", 315, input_type_controller);
input_define("left stick horizontal", 316, input_type_controller);
input_define("left stick horizontal positive", 317, input_type_controller);
input_define("left stick horizontal negative", 318, input_type_controller);
input_define("left stick vertical", 319, input_type_controller);
input_define("left stick vertical positive", 320, input_type_controller);
input_define("left stick vertical negative", 321, input_type_controller);
input_define("right stick horizontal", 322, input_type_controller);
input_define("right stick horizontal positive", 323, input_type_controller);
input_define("right stick horizontal negative", 324, input_type_controller);
input_define("right stick vertical", 325, input_type_controller);
input_define("right stick vertical positive", 326, input_type_controller);
input_define("right stick vertical negative", 327, input_type_controller);



#endregion


#region Define The Default Bindings, and Load Any Saved Custom Bindings

//Default Keyboard Controls
move_left_default_keyboard = "a";
move_right_default_keyboard = "d";
move_up_default_keyboard = "w";
move_down_default_keyboard = "s";
fire_default_keyboard = "left click";
secondary_fire_default_keyboard = "right click";
reload_default_keyboard = "r";
switch_weapons_default_keyboard = "q";
character_action_default_keyboard = "space";
select_default_keyboard = "e";
back_default_keyboard = "escape";

//Default Controller Controls
move_left_default_controller = "left stick horizontal negative";
move_right_default_controller = "left stick horizontal positive";
move_up_default_controller = "left stick vertical negative";
move_down_default_controller = "left stick vertical positive";
fire_default_controller = "right trigger";
secondary_fire_default_controller = "left trigger";
reload_default_controller = "face 3";
switch_weapons_default_controller = "face 4";
character_action_default_controller = "right bumper";
select_default_controller = "face 1";
back_default_controller = "face 2";

//Open The Control Config File
ini_open(controls_config);

//If first time setup, write the default controls to the file
if(global.first_time_setup){
for(var slot = 0; slot <= number_of_controller_slots; slot++){
	
	//Load Keyboard Bindings (Slot 0)
	if(slot == 0){
		move_left_binding[slot] = ini_write_string("Keyboard Controls", "move_left", move_left_default_keyboard);
		move_right_binding[slot] = ini_write_string("Keyboard Controls", "move_right", move_right_default_keyboard);
		move_up_binding[slot] = ini_write_string("Keyboard Controls", "move_up", move_up_default_keyboard);
		move_down_binding[slot] = ini_write_string("Keyboard Controls", "move_down", move_down_default_keyboard);
		fire_binding[slot] = ini_write_string("Keyboard Controls", "fire", fire_default_keyboard);
		secondary_fire_binding[slot] = ini_write_string("Keyboard Controls", "secondary_fire", secondary_fire_default_keyboard);
		reload_binding[slot] = ini_write_string("Keyboard Controls", "reload", reload_default_keyboard);
		switch_weapons_binding[slot] = ini_write_string("Keyboard Controls", "switch_weapons", switch_weapons_default_keyboard);
		character_action_binding[slot] = ini_write_string("Keyboard Controls", "character_action", character_action_default_keyboard);
		select_binding[slot] = ini_write_string("Keyboard Controls", "select", select_default_keyboard);
		back_binding[slot] = ini_write_string("Keyboard Controls", "back", back_default_keyboard);
	}
	
	//Load Controller Bindings (Slot 1-4)
	else {
		move_left_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "move_left", move_left_default_controller);
		move_right_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "move_right", move_right_default_controller);
		move_up_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "move_up", move_up_default_controller);
		move_down_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "move_down", move_down_default_controller);
		fire_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "fire", fire_default_controller);
		secondary_fire_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "secondary_fire", secondary_fire_default_controller);
		reload_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "reload", reload_default_controller);
		switch_weapons_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "switch_weapons", switch_weapons_default_controller);
		character_action_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "character_action", character_action_default_controller);
		select_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "select", select_default_controller);
		back_binding[slot] = ini_write_string("Player " + string(slot) + " Controls", "back", back_default_controller);
	}
	
}
}


//Read Saved Controls From File
for(var slot = 0; slot <= number_of_controller_slots; slot++){
	
	//Load Keyboard Bindings (Slot 0)
	if(slot == 0){
		move_left_binding[slot] = ini_read_string("Keyboard Controls", "move_left", move_left_default_keyboard);
		move_right_binding[slot] = ini_read_string("Keyboard Controls", "move_right", move_right_default_keyboard);
		move_up_binding[slot] = ini_read_string("Keyboard Controls", "move_up", move_up_default_keyboard);
		move_down_binding[slot] = ini_read_string("Keyboard Controls", "move_down", move_down_default_keyboard);
		fire_binding[slot] = ini_read_string("Keyboard Controls", "fire", fire_default_keyboard);
		secondary_fire_binding[slot] = ini_read_string("Keyboard Controls", "secondary_fire", secondary_fire_default_keyboard);
		reload_binding[slot] = ini_read_string("Keyboard Controls", "reload", reload_default_keyboard);
		switch_weapons_binding[slot] = ini_read_string("Keyboard Controls", "switch_weapons", switch_weapons_default_keyboard);
		character_action_binding[slot] = ini_read_string("Keyboard Controls", "character_action", character_action_default_keyboard);
		select_binding[slot] = ini_read_string("Keyboard Controls", "select", select_default_keyboard);
		back_binding[slot] = ini_read_string("Keyboard Controls", "back", back_default_keyboard);
	}
	
	//Load Controller Bindings (Slot 1-4)
	else {
		move_left_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "move_left", move_left_default_controller);
		move_right_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "move_right", move_right_default_controller);
		move_up_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "move_up", move_up_default_controller);
		move_down_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "move_down", move_down_default_controller);
		fire_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "fire", fire_default_controller);
		secondary_fire_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "secondary_fire", secondary_fire_default_controller);
		reload_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "reload", reload_default_controller);
		switch_weapons_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "switch_weapons", switch_weapons_default_controller);
		character_action_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "character_action", character_action_default_controller);
		select_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "select", select_default_controller);
		back_binding[slot] = ini_read_string("Player " + string(slot) + " Controls", "back", back_default_controller);
	}
	
}

//Close control config
ini_close();

#endregion 

controller_slot_min = 0;
controller_slot_max = 3;


//Initialize Input Variables
for(var i = 1; i <= max_number_of_players; i++){

	move_left[i] = 0;
	move_right[i] = 0;
	move_up[i] = 0;
	move_down[i] = 0;
	move_left_pressed[i] = 0;
	move_right_pressed[i] = 0;
	move_up_pressed[i] = 0;
	move_down_pressed[i] = 0;
	move_horizontal[i] = 0;
	move_vertical[i] = 0;
	move_horizontal_pressed[i] = 0;
	move_vertical_pressed[i] = 0;
	right_stick_horizontal[i] = 0;
	right_stick_vertical[i] = 0;
	fire[i] = 0;
	secondary_fire[i] = 0;
	fire_pressed[i] = 0;
	secondary_fire_pressed[i] = 0;
	reload[i] = 0;
	reload_pressed[i] = 0;
	switch_weapons[i] = 0;
	switch_weapons_pressed[i] = 0;
	character_action[i] = 0;
	character_action_pressed[i] = 0;
	select[i] = 0;
	select_pressed[i] = 0;
	move_horizontal_previous_frame[i] = 0;
	move_vertical_previous_frame[i] = 0;
	
}


//Set Deadzones
for(i = controller_slot_min; i <= controller_slot_max; i++){
	gamepad_set_axis_deadzone(i, .15);	
}


