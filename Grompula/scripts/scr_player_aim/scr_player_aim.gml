///@function scr_player_aim()
///@Description Handles Player Aiming
function scr_player_aim() {


	if(player == 1 && o_InputController.player_1_use_keyboard){
		aim_angle = angle_approach(aim_angle, point_direction(center_x, center_y, mouse_x, mouse_y), aiming_speed); 	
	} else if(o_InputController.right_stick_horizontal[player] != 0 || o_InputController.right_stick_vertical[player] != 0) {
		aim_angle = angle_approach(aim_angle, point_direction(center_x, center_y, center_x + o_InputController.right_stick_horizontal[player], center_y + o_InputController.right_stick_vertical[player]), aiming_speed);
	}

	//Update Direction Facing
	if(abs(angle_difference(0, aim_angle)) < 90) direction_facing = 1;
	else direction_facing = -1;


}
