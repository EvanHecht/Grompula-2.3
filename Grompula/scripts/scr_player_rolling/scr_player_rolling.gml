///@function scr_player_movement()
///@Description Handles Player Movement
function scr_player_rolling() {

	//Rolling Speed Curve

	var current_rolling_speed;
	if(image_index < 4) current_rolling_speed = rolling_speed;
	else current_rolling_speed = rolling_speed/3.5;

	var horizontal_movement_increment = current_rolling_speed * direction_moving_horizontal;
	var vertical_movement_increment = current_rolling_speed * direction_moving_vertical;

	//Move Horizontally
	if(!place_meeting(x + horizontal_movement_increment, y, o_Collision)){
		x += horizontal_movement_increment;
	} else {
		while(!place_meeting(x + sign(horizontal_movement_increment), y, o_Collision)){
			x += sign(horizontal_movement_increment);
		}
	}


	//Move Vertically
	if(!place_meeting(x, y + vertical_movement_increment, o_Collision)){
		y += vertical_movement_increment;
	} else {
		while(!place_meeting(x, y + sign(vertical_movement_increment), o_Collision)){
			y += sign(vertical_movement_increment);
		}
	}

	//Update Center Variables
	center_x = x;
	center_y = y - 45;


}
