//Check if being hovered over
if(mouse_over()){
	panel_graphic_frame = approach(panel_graphic_frame, largest_possible_value, panel_graphic_animation_speed);
	image_index = 1;
	
	//Being clicked
	if(mouse_check_button_pressed(mb_left)){
		selected = true;	
	}
	
//If not being hovered over
} else {
	panel_graphic_frame = 0;
	image_index = 0;
}

