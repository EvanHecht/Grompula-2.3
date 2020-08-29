//Given a keycode, will return it's name or -1 if it doesnt exist
function keycode_to_keyname(keycode){
	
	//Converts a keycode to its name
	var index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_code, 0), keycode);
	if(index == -1) return index;
	else return ds_list_find_value(ds_grid_get(global.input_grid, input_grid_name, 0), index);
	
}

//Given a keycode, will return it's name or -1 if it doesnt exist
function keyname_to_keycode(keyname){
	
	//Converts a keycode to its name
	var index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_name, 0), keyname);
	if(index == -1) return index;
	else return ds_list_find_value(ds_grid_get(global.input_grid, input_grid_code, 0), index);
	
}

//Given an input keycode or keyname, will return the input type
function get_input_type(input){
	
	//Determine if keycode or keyname
	var input_type;
	if(is_string(input)) input_type = "keyname";
	else if(is_int32(input) || is_int64(input)) input_type = "keycode";
	else show_error("Invalid input value: " + string(input), true);
	
	//if keyname, convert to keycode
	if(input_type = "keyname"){
		input = keyname_to_keycode(input);
	}
	
	//Return input type
	var index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_code, 0), input);
	return ds_list_find_value(ds_grid_get(global.input_grid, input_grid_code, 0), index);
	
}

function read_input(input, pressed){

	//Determine if keycode or keyname
	var input_type;
	if(is_string(input)) input_type = "keyname";
	else if(is_int32(input) || is_int64(input)) input_type = "keycode";
	else show_error("Invalid input value: " + string(input), true);
	
	
	//Determine if is valid input
	var input_index;
	if(input_type == "keyname") input_index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_name, 0), input);	
	else input_index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_code, 0), input);	
	if(!input_index) show_error("Invalid input value: " + string(input) + " | This input code does not exist in the database.", true);

	
	//if keyname, convert to keycode
	if(input_type = "keyname"){
		input = keyname_to_keycode(input);
	}


	//Get the input type
	var input_method = get_input_type(input);
	
	//Keyboard
	if(input_method == input_type_keyboard){
		if(pressed) return keyboard_check_pressed(input);
		else if(!pressed) return keyboard_check(input);
	}
	
	//Mouse
	else if(input_method == input_type_mouse){
		if(pressed) return mouse_check_button_pressed(input);
		else if(!pressed) return mouse_check_button(input);
	}
	
	
	
}