player_damage_timer--;
switch(state) {

	case "begin":
		switch(o_lava.image_index) {
		#region Change hitbox position with lava animation
			case 1:
				y = 160;
			break;
			case 2:
				y = 192;
			break;
			case 3:
				y = 224;
			break;
			case 4:
				y = 256;
			break;
			case 5:
				y = 288;
			break;
			case 6:
				y = 320;
			break;
			case 7:
				y = 352;
			break;
			case 8:
				y = 384;
			break;
		#endregion
		}
		
		if (o_lava.state == "active") {
			y = 400;
			state = "active";
		}
	break;
	
	case "inactive":
		if (o_lava.state == "begin") {
			state = "begin";	
		}
	break;
	
	case "active":
		if (o_lava.state == "finish") {
			state = "finish";	
		}
	break;
	
	case "finish":
		switch(o_lava.image_index) {
		#region Change hitbox position with lava animation
			case 1:
				y = 416;
			break;
			case 2:
				y = 448;
			break;
			case 3:
				y = 480;
			break;
			case 4:
				y = 512;
			break;
			case 5:
				y = 544;
			break;
			case 6:
				y = 576;
			break;
			case 7:
				y = 608;
			break;
			case 8:
				y = 640;
			break;
		#endregion
		}
		
		if (o_lava.state == "inactive") {
			y = 816;
			state = "inactive";
		}
	break;

}

if (place_meeting(x, y, o_Player) && player_damage_timer <= 0) {
				var player_inst = instance_place(x, y, o_Player);
				player_inst.hp--;
				player_inst.environmental_damage_timer = 60; //One second wait to damage player again
}

/*if (place_meeting(x, y, o_Player)) { //Lava slows the player
	var player_inst = instance_place(x, y, o_Player);
	player_inst.movement_speed = 3.5;
} else {
	player_inst.movement_speed = 5;	
}*/
		
if (place_meeting(x, y, o_Enemy)) {
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