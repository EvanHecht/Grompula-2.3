///@function scr_player_movement()
///@Description Handles Player Movement
function scr_player_movement() {

	var horizontal_movement = o_InputController.move_horizontal[player] * movement_speed;
	var vertical_movement = o_InputController.move_vertical[player] * movement_speed;

	//Update Player Moving Direction
	direction_moving_horizontal = sign(horizontal_movement);
	direction_moving_vertical = sign(vertical_movement);

	//Move Horizontally
	moving = false;
	var original_x = x;
	if(!place_meeting(x + horizontal_movement, y, o_Collision)){
		x += horizontal_movement;
	} else {
		while(!place_meeting(x + sign(horizontal_movement), y, o_Collision)){
			x += sign(horizontal_movement);
		}
	}

	//Check if moved
	if(x != original_x) moving = true;

	//Move Vertically
	var original_y = y;
	if(!place_meeting(x, y + vertical_movement, o_Collision)){
		y += vertical_movement;
	} else {
		while(!place_meeting(x, y + sign(vertical_movement), o_Collision)){
			y += sign(vertical_movement);
		}
	}

	//Check if moved
	if(y != original_y) moving = true;

	//Update Center Variables
	center_x = x;
	center_y = y - 45;


}
