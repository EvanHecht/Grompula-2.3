/// @description scr_screen_shake_set(horizontal_screen_shake, vertical_screen_shake)
/// @param horizontal_screen_shake
/// @param vertical_screen_shake
function scr_screen_shake_set(argument0, argument1) {

	var horizontal_screen_shake = argument0;
	var vertical_screen_shake = argument1;

	//Add the screen shake to the camera
	if(instance_exists(o_Camera)){
		o_Camera.screen_shake_horizontal = horizontal_screen_shake;
		o_Camera.screen_shake_vertical = vertical_screen_shake;
	}


}
