switch(state) {

	case "begin":
		if (animation_finished()) {
			set_sprite(spr_lava_below);
			state = "active";
		}
	break;
	
	case "active":
		if (o_lava.state == "inactive") {
			set_sprite(spr_lava_below_finish);
			state = "finish";
		}
	break;
	
	case "inactive":
		if (o_lava.state == "active") {
			set_sprite(spr_lava_below_begin);
			visible = true;
			image_speed = .5;
			state = "begin";
		}
	break;
	
	case "finish":
		if (animation_finished()) {
			image_speed = 0;
			visible = false;
			state = "inactive";
		}
	break;

}