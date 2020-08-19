//Camera Behavior Types

#region Single Player Camera
if(camera_mode == "single"){
	
	//Set the camera scale
	camera_set_view_size(camera, camera_width, camera_height);
	
	//Get the target x
	var target_x;
	target_x =  camera_target[1].center_x - (camera_width/2) + lengthdir_x(single_player_aim_offset, camera_target[1].aim_angle);
	target_x = max(0, min(target_x, room_width - camera_width)); //Keep camera view in room.
	
	
	//Get the target y
	var target_y;
	target_y =  camera_target[1].center_y - (camera_height/2) + lengthdir_y(single_player_aim_offset, camera_target[1].aim_angle);
	target_y = max(0, min(target_y, room_height - camera_height)); //Keep camera view in room.
	
	//Set the actual position for the next frame
	var actual_x = smooth_approach(camera_get_view_x(camera), target_x, camera_pan_speed) + irandom_range(-screen_shake_horizontal, screen_shake_horizontal);
	var actual_y = smooth_approach(camera_get_view_y(camera), target_y, camera_pan_speed) + irandom_range(-screen_shake_vertical, screen_shake_vertical);
	camera_set_view_pos(camera, actual_x, actual_y);
	
	
}
#endregion

#region Multi-Player Camera
else if(camera_mode == "multi"){
	
	//Get the target positions
	var target_x = 0;
	var target_y = 0;
	var max_x = 0;
	var min_x = room_width;
	var max_y = 0;
	var min_y = room_height;
	for(var i = 1; i <= o_GameController.current_number_of_players; i++){
		
		if(camera_target[i] != -1){
			target_x += camera_target[i].center_x;
			target_y += camera_target[i].center_y;
			
			//Update max variables
			max_x = max(max_x, camera_target[i].center_x);
			min_x = min(min_x, camera_target[i].center_x);
			max_y = max(max_y, camera_target[i].center_y);
			min_y = min(min_y, camera_target[i].center_y);
		}
	
	}
	
	
	//Scale the camera
	var desired_width = abs(max_x - min_x + multiplayer_camera_margin);
	var desired_height = abs(max_y - min_y + multiplayer_camera_margin);
	
	//Scale 
	var target_camera_scale;
	target_camera_scale = max(camera_minimum_scale, max(desired_height, desired_width) / aspect_ratio[2]);
	var max_camera_width = room_width;
	var max_camera_height = room_width * (aspect_ratio[2]/aspect_ratio[1]);
	camera_width = min(max_camera_width, smooth_approach(camera_width, target_camera_scale * aspect_ratio[1], camera_zoom_speed));
	camera_height = min(max_camera_height, smooth_approach(camera_height, target_camera_scale * aspect_ratio[2], camera_zoom_speed));
	show_debug_message("CAM WIDTH: " + string(camera_width));
	show_debug_message("CAM HEIGHT: " + string(camera_height));
	camera_set_view_size(camera, camera_width, camera_height);
	
	//Adjust Target Position
	target_x /= o_GameController.current_number_of_players;
	target_y /= o_GameController.current_number_of_players;
	target_x -= (camera_width/2);
	target_y -= (camera_height/2);
	target_x = max(0, min(target_x, (room_width - camera_width)));
	target_y = max(0, min(target_y, (room_height - camera_height)));
	
	//Set the actual position for the next frame
	var actual_x = min(room_width - camera_width, smooth_approach(camera_get_view_x(camera), target_x, camera_pan_speed));
	var actual_y = min(room_height - camera_height, smooth_approach(camera_get_view_y(camera), target_y, camera_pan_speed));
	camera_set_view_pos(camera, actual_x, actual_y);
	

}
#endregion

#region Cutscene Camera
if(camera_mode == "cutscene"){
	
	//Set the camera scale
	camera_set_view_size(camera, camera_width, camera_height);
	
	//Get the target x
	var target_x;
	target_x =  camera_cutscene_target[1].center_x - (camera_width/2);
	target_x = max(0, min(target_x, room_width - camera_width)); //Keep camera view in room.
	
	
	//Get the target y
	var target_y;
	target_y =  camera_cutscene_target[1].center_y - (camera_height/2);
	target_y = max(0, min(target_y, room_height - camera_height)); //Keep camera view in room.
	
	//Set the actual position for the next frame
	var actual_x = smooth_approach(camera_get_view_x(camera), target_x, camera_pan_speed);
	var actual_y = smooth_approach(camera_get_view_y(camera), target_y, camera_pan_speed);
	camera_set_view_pos(camera, actual_x, actual_y);
	
	
}
#endregion

//Reduce screen shake
screen_shake_horizontal = approach(screen_shake_horizontal, 0, screen_shake_decrement_speed);
screen_shake_vertical = approach(screen_shake_vertical, 0, screen_shake_decrement_speed);