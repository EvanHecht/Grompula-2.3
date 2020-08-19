depth = -y;

switch(state) {

	case "begin":
		if (animation_finished()) {
			set_sprite(spr_lava);
			timer = random_range(300, 600); //Deactivates within certain range of time (3000-4200)
			state = "active";	
		}
	break;

	case "inactive":
		timer--;
		if (timer <= 0) {
			state = "begin";
			image_speed = .5;
			set_sprite(spr_lava_begin);
			visible = true;
		}
	break;
	
	case "active":
		timer--;
		if (timer <= 0) {
			set_sprite(spr_lava_finish);
			state = "finish";
		}
	break;

	case "finish":
		if (image_index == 9) {
			image_speed = 0;
			visible = false;
			timer = random_range(300, 600); //Activates again within a certain range of time (3000-4200)
			state = "inactive";	
		}
	break;
		
}