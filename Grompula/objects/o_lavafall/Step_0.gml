depth = -y;

switch(state) {
	
	case "inactive":
		if (o_lava.timer <= 205 && o_lava.state == "inactive") {
			image_speed = .5;
			set_sprite(spr_lavafall_begin);	
			state = "begin";
		}
	break;
	
	case "begin":
		if (image_index == 9) {
			set_sprite(spr_lavafall_active);
			state = "active";
		}
	break;
	
	case "active":
		if (o_lava.timer <= 205 && o_lava.state == "active") {
			set_sprite(spr_lavafall_finish);
			state = "finish";
		}
	break;
	
	case "finish":
		if (animation_finished()) {
			image_speed = 0;
			set_sprite(spr_lavafall_begin);
			state = "inactive";
		}
	break;
	
}