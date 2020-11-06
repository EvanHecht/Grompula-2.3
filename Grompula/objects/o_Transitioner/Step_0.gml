if(transitioning){

	switch(transition_phase){

		//Rectangle Coming in
		case "enter":

			var target_x = display_get_gui_width();
			rectangle_end_x = smooth_approach(rectangle_end_x, target_x, transition_speed);
			if(rectangle_end_x == target_x){
				transition_phase = "exit";
				room = destination_room;
			}

		break;

		//Rectangle Going out
		case "exit":

			var target_x = display_get_gui_width();
			rectangle_start_x = smooth_approach(rectangle_start_x, target_x, transition_speed);
			if(rectangle_start_x == target_x){
				transition_phase = "enter";
				transitioning = false;
			}

		break;

	}

} else {	
	
	
	
}