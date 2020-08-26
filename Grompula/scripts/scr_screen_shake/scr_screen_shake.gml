///This script contains functions for modifying the screen shake of the game.

/// @description screen_shake_add(horizontal_screen_shake, vertical_screen_shake)
/// @param horizontal_screen_shake
/// @param vertical_screen_shake
function screen_shake_add(horizontal_screen_shake, vertical_screen_shake) {

	//Add the screen shake to the camera
	if(instance_exists(o_Camera)){
		o_Camera.screen_shake_horizontal += horizontal_screen_shake;
		o_Camera.screen_shake_vertical += vertical_screen_shake;
	}

}

/// @description screen_shake_add_until_limit(horizontal_screen_shake, vertical_screen_shake, horizontal_limit, vertical_limit)
/// @param horizontal_screen_shake
/// @param vertical_screen_shake
/// @param horizontal_limit
/// @param vertical_limit
function screen_shake_add_until_limit(horizontal_screen_shake, vertical_screen_shake, horizontal_limit, vertical_limit) {

	//Add the screen shake to the camera
	if(instance_exists(o_Camera)){
		if(o_Camera.screen_shake_horizontal < horizontal_screen_shake) o_Camera.screen_shake_horizontal = approach(o_Camera.screen_shake_horizontal, horizontal_limit, horizontal_screen_shake);
		if(o_Camera.screen_shake_vertical < vertical_screen_shake) o_Camera.screen_shake_vertical = approach(o_Camera.screen_shake_vertical, vertical_limit, vertical_screen_shake);
	}

}


/// @description screen_shake_set(horizontal_screen_shake, vertical_screen_shake)
/// @param horizontal_screen_shake
/// @param vertical_screen_shake
function screen_shake_set(horizontal_screen_shake, vertical_screen_shake) {

	//Add the screen shake to the camera
	if(instance_exists(o_Camera)){
		o_Camera.screen_shake_horizontal = horizontal_screen_shake;
		o_Camera.screen_shake_vertical = vertical_screen_shake;
	}


}
