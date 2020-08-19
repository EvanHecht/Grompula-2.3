switch(state) {

	case "inactive":
		if (o_lava_below.state == "active") {
			visible = true;
			image_index = 0;
			image_speed = 1;
			state = "active";	
		}
	break;
	
	case "active":
		if (o_lava_below.state == "inactive") {
			if (animation_finished()) {
				visible = false;
				image_speed = 0;
				state = "inactive";
			}
		}
	break;

}