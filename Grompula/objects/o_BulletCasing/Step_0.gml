//Once hit the ground
if(landed){
	depth = -y;
	lifetime = approach(lifetime, 0, 1);
	//Fade away
	if(lifetime == 0){
		if(collided){
			x += launch_speed_x;
			y += launch_speed_y;
			image_angle += rotation_speed * launch_direction;
		}
		image_alpha = approach(image_alpha, 0, fade_speed);
		if(image_alpha == 0) instance_destroy();
	}
}

//If still Launching
else {
	x += launch_speed_x;
	y = approach(y, launch_ground_coordinate, launch_speed_y);
	launch_speed_x = approach(launch_speed_x, 0, launch_speed_x_deceleration);
	launch_speed_y += launch_gravity;
	image_angle += rotation_speed * launch_direction;
	
	//Check if landed
	if(y == launch_ground_coordinate){
		
		//If hits wall
		if(place_meeting(x, y, o_Collision)){
			landed = true;
			collided = true;
			lifetime = 0;
		} else {
			landed = true;
		}
		
	}
	
}

