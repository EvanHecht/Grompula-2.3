switch(state) {
	
	case "inactive":
		if (o_Geyser_Left.timer <= 0) {
			state = "rising";
		}
	break;
	
	case "rising":
		x = o_Geyser_Left.x;
		y = o_Geyser_Left.y;
		image_speed = 1;
		if (image_index >= 12) {
			image_speed = 0;
			image_index = 12;
			state = "active";
		}
	break;
	
	case "active":
		if (o_Geyser_Left.image_index >= 84) {
				image_speed = 1;
				state = "falling";
		}
	break;

	case "falling":
		if (animation_finished()) {
			image_speed = 0;
			image_index = 0;
			x = 112;
			y = 1568;
			state = "inactive";
		}
	break;

}

if (place_meeting(x, y, o_Player) && (state != "inactive")) {
	var player_inst = instance_place(x, y, o_Player);	
	if ((player_inst.y <= y) && (player_inst.environmental_damage_timer <= 0)) {
		player_inst.hp--;
		player_inst.environmental_damage_timer = 60;
	}
}

if (place_meeting(x, y, o_Enemy) && (state != "inactive") && (o_Enemy.y <= y)) {
	var enemy_inst = instance_place(x, y, o_Enemy);
	if (ds_list_find_index(damaged_enemies, enemy_inst) == -1) {
		enemy_inst.hp--;
		enemy_inst.alarm[0] = 60;
		ds_list_add(damaged_enemies, enemy_inst);
	}
}

for (var i = 0; i < ds_list_size(damaged_enemies); i++) {
	var curr_enemy = ds_list_find_value(damaged_enemies, i);
	if (!instance_exists(curr_enemy)) { //In the case that the enemy has died
		continue;	
	} else if (curr_enemy.alarm[0] <= 0) {
		ds_list_delete(damaged_enemies, i);	
	}
}