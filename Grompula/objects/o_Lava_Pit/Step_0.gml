if (place_meeting(x, y, o_Player) && image_index == 0) {
	o_Player.x = 1344;
	o_Player.y = 1440;
	//Player weapon position doesn't update
}

if (place_meeting(x, y, o_Enemy) && image_index == 0) {
	var enemy_inst = instance_place(x, y, o_Enemy);
	instance_destroy(enemy_inst);
}