x = o_Geyser_Base_Right.x;
y = o_Geyser_Base_Right.y - 78;
depth = -y;

switch(state) {

	case "inactive":
		timer--;
		if (timer <= 0) {
			visible = true;
			image_speed = 1;
			state = "rising";
		}
	break;
	
	case "rising":
		if (image_index >= 48) {
			timer = random_range(300, 600);
			set_sprite(spr_geyser_active);
			state = "active";
		}
	break;

	case "active":
		timer--;
		if ((timer <= 0) && (animation_finished())) {
			set_sprite(spr_geyser);
			image_index = 48;
			state = "falling";
		}
	break;

	case "falling":
		if (animation_finished()) {
			image_speed = 0;
			image_index = 0;
			visible = false;
			timer = random_range(300, 600);
			state = "inactive";
		}
	break;
	
}