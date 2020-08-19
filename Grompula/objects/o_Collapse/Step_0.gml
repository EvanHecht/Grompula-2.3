switch(state) {
		case "inactive": //Not being stepped on
			if (place_meeting(x, y, o_Player) || place_meeting(x, y, o_Enemy)) {
				state = "active";
			}
		break;
		
		case "active": //Being stepped on
			durability--;
			
			if (durability <= 0) {
				state = "collapsed";
				image_speed = 1;
				instance_create_depth(x, y, -y, o_Lava_Pit);
				o_Lava_Pit.image_index = 1;
			} else if (durability <= 100) {
				image_index = 2;	
			} else if (durability <= 300) {
				image_index = 1;	
			}

			if ((!place_meeting(x, y, o_Player)) && (!place_meeting(x, y, o_Enemy))) {
				state = "inactive";	
			}
		break;
		
		case "collapsed":
			if (image_index > 7) {
				image_speed = 0;
				image_index = 8;
				alarm[0] = 300;
				state = "idle";
			}
		break;
			
		case "idle":
		
		break;
			
		case "respawning":
			if (image_index == 12) {
				image_speed = 0;
				image_index = 0;
				instance_destroy(o_Lava_Pit);
				durability = 600;
				state = "inactive";
			}
		break;
}