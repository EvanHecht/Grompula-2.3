switch(state) {
	
	case "inactive":
		if (o_Geyser_Left.timer < 40) {
			x = random_range(359, 537);
			y = random_range(1260, 1572);
			visible = true;
			image_speed = 1;
			state = "rising";
		}
	break;
	
	case "rising":
		if (image_index > 14) {
			image_index = 15;
			image_speed = 0;
			state = "active";
		}
	break;

	case "active":
		if (o_Geyser_Left.state = "inactive") {
			image_speed = 1;
			state = "falling";
		}
	break;
	
	case "falling":
		if (animation_finished()) {
			image_speed = 0;
			image_index = 0;
			visible = false;
			state = "inactive";
		}
	
}