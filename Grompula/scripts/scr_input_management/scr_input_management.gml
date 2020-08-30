//------------------------------------------------------------------------------------------------
//Given a keycode, will return it's name or -1 if it doesnt exist
function keycode_to_keyname(keycode){
	
	//Converts a keycode to its name
	var index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_code, 0), keycode);
	if(index == -1) return index;
	else return ds_list_find_value(ds_grid_get(global.input_grid, input_grid_name, 0), index);
	
}
//------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------
//Given a keycode, will return it's name or -1 if it doesnt exist
function keyname_to_keycode(keyname){
	
	//Converts a keycode to its name
	var index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_name, 0), keyname);
	if(index == -1) return index;
	else return ds_list_find_value(ds_grid_get(global.input_grid, input_grid_code, 0), index);
	
}
//------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------
//Given an input keycode or keyname, will return the input type.
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
	return ds_list_find_value(ds_grid_get(global.input_grid, input_grid_type, 0), index);
	
}
//------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------
//Returns the current value of the desired input.
/*NOTES
1) If checking a non controllerinput, the controller_slot parameter value does not matter.
2) If checking a scroll input, or gamepad axis input, the pressed paramater value does not matter.
3) The input paramater can be the keyname or keycode of the desired input.
*/
function read_input(input, pressed, controller_slot){

	//Determine if keycode or keyname
	var input_type;
	if(is_string(input)) input_type = "keyname";
	else if(is_int32(input) || is_int64(input)) input_type = "keycode";
	else show_error("Invalid input value: " + string(input), true);
	
	
	//Determine if is valid input
	var input_index;
	if(input_type == "keyname") input_index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_name, 0), input);	
	else input_index = ds_list_find_index(ds_grid_get(global.input_grid, input_grid_code, 0), input);	
	if(input_index == -1) show_error("Invalid input value: " + string(input) + " | This input code does not exist in the database.", true);

	
	//Retrieve both the keyname and keycode
	var keyname;
	var keycode;
	if(input_type = "keyname"){
		keyname = input;
		keycode = keyname_to_keycode(input);
	} else if("keycode"){
		keyname = keycode_to_keyname(input);
		keycode = input;
	}

	//Get the input type
	var input_method = get_input_type(input);
	
	//Keyboard
	if(input_method == input_type_keyboard){
		if(pressed) return keyboard_check_pressed(keycode);
		else if(!pressed) return keyboard_check(keycode);
	}
	
	//Mouse
	else if(input_method == input_type_mouse){
		if(pressed) return mouse_check_button_pressed(keycode);
		else if(!pressed) return mouse_check_button(keycode);
	}
	
	//Scroll
	else if(input_method == input_type_scroll){
		if(keyname == "scroll up") return mouse_wheel_up();
		else if(keyname == "scroll down") return mouse_wheel_down();
	}

	//Controller
	else if(input_method == input_type_controller){
		
		switch(keyname){
			
			//Face Button 1
			case "face 1":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_face1);
				else return gamepad_button_check(controller_slot, gp_face1);
			break;
			
			//Face Button 2
			case "face 2":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_face2);
				else return gamepad_button_check(controller_slot, gp_face2);
			break;
			
			//Face Button 3
			case "face 3":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_face3);
				else return gamepad_button_check(controller_slot, gp_face3);
			break;
			
			//Face Button 4
			case "face 4":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_face4);
				else return gamepad_button_check(controller_slot, gp_face4);
			break;
			
			//Left Bumper
			case "left bumper":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_shoulderl);
				else return gamepad_button_check(controller_slot, gp_shoulderl);
			break;
			
			//Left Trigger
			case "left trigger":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_shoulderlb);
				else return gamepad_button_check(controller_slot, gp_shoulderlb);
			break;
			
			//Right Bumper
			case "right bumper":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_shoulderr);
				else return gamepad_button_check(controller_slot, gp_shoulderr);
			break;
			
			//Right Trigger
			case "right trigger":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_shoulderrb);
				else return gamepad_button_check(controller_slot, gp_shoulderrb);
			break;
			
			//Select
			case "select":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_select);
				else return gamepad_button_check(controller_slot, gp_select);
			break;
			
			//start
			case "start":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_start);
				else return gamepad_button_check(controller_slot, gp_start);
			break;
			
			//left stick press
			case "left stick press":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_stickl);
				else return gamepad_button_check(controller_slot, gp_stickl);
			break;
			
			//right stick press
			case "right stick press":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_stickr);
				else return gamepad_button_check(controller_slot, gp_stickr);
			break;
			
			//dpad up
			case "dpad up":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_padu);
				else return gamepad_button_check(controller_slot, gp_padu);
			break;
			
			//dpad down
			case "dpad down":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_padd);
				else return gamepad_button_check(controller_slot, gp_padd);
			break;
			
			//dpad left
			case "dpad left":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_padl);
				else return gamepad_button_check(controller_slot, gp_padl);
			break;
			
			//dpad right
			case "dpad right":
				if(pressed) return gamepad_button_check_pressed(controller_slot, gp_padr);
				else return gamepad_button_check(controller_slot, gp_padr);
			break;
			
			//left stick horizontal
			case "left stick horizontal":
				return gamepad_axis_value(controller_slot, gp_axislh);
			break;
			
			//left stick horizontal positive
			case "left stick horizontal positive":
				return max(0, gamepad_axis_value(controller_slot, gp_axislh));
			break;
			
			//left stick horizontal negative
			case "left stick horizontal negative":
				return min(0, gamepad_axis_value(controller_slot, gp_axislh));
			break;
			
			//left stick vertical
			case "left stick vertical":
				return gamepad_axis_value(controller_slot, gp_axislv);
			break;
			
			//left stick vertical positive
			case "left stick vertical positive":
				return max(0, gamepad_axis_value(controller_slot, gp_axislv));
			break;
			
			//left stick vertical negative
			case "left stick vertical negative":
				return min(0, gamepad_axis_value(controller_slot, gp_axislv));
			break;
			
			//right stick horizontal
			case "right stick horizontal":
				return gamepad_axis_value(controller_slot, gp_axisrh);
			break;
			
			//right stick horizontal positive
			case "right stick horizontal positive":
				return max(0, gamepad_axis_value(controller_slot, gp_axisrh));
			break;
			
			//right stick horizontal negative
			case "right stick horizontal negative":
				return min(0, gamepad_axis_value(controller_slot, gp_axisrh));
			break;
			
			//right stick vertical
			case "right stick vertical":
				return gamepad_axis_value(controller_slot, gp_axisrv);
			break;
			
			//right stick vertical positive
			case "right stick vertical positive":
				return max(0, gamepad_axis_value(controller_slot, gp_axisrv));
			break;
			
			//right stick vertical negative
			case "right stick vertical negative":
				return min(0, gamepad_axis_value(controller_slot, gp_axisrv));
			break;
			
		}
		
	}
	
}
//------------------------------------------------------------------------------------------------