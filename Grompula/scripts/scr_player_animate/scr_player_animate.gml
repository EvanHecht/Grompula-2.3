///@function scr_player_animate()
///@Description Handles Player Visuals
function scr_player_animate() {

	//Update Depth
	depth = -y;


	//Player Sprites
	if(moving){
		set_sprite(spr_player_moving);
		image_speed = movement_speed / 4;
	}
	else set_sprite(spr_player_idle);

	//Update Direction Facing
	if(abs(angle_difference(aim_angle, 0)) > 90){
		image_xscale = -abs(image_xscale);
		image_speed = -abs(image_speed);
	}
	else {
		image_xscale = abs(image_xscale);
		image_speed = abs(image_speed);
	}




}
