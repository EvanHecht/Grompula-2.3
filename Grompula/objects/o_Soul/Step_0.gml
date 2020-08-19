var targets = instance_nearest_list(x, y, o_Tombstone);

if (target_tombstone == -1) {
	var shortest_distance = -1;
	var determined_target = -1;

	for (var i = 0; i < ds_list_size(targets); i++) {
		var current_target = ds_list_find_value(targets, i);
		var path_available = mp_grid_path(o_RoomGrid.room_grid, unit_path, x, y, current_target.x, current_target.y, true);
		var current_path_length = path_get_length(unit_path);
	
		if (path_available && (current_path_length < shortest_distance || shortest_distance == -1)) {
			determined_target = current_target;
			shortest_distance = current_path_length;
		}
	}
	
	if (determined_target == -1) { //If no tombstones exist, destroy
		instance_destroy();	
	} else {
		target_tombstone = determined_target; //The target tombstone decided upon
	}
}

//Move towards tombstone
if (target_tombstone != -1) {
		mp_grid_path(o_RoomGrid.room_grid, unit_path, x, y, target_tombstone.x, target_tombstone.y, true);
		path_start(unit_path, movement_speed, path_action_stop, false);
}

//Disappear on tombstone
if (point_distance(x, y, target_tombstone.x, target_tombstone.y) < 10) {
			path_end();
			set_sprite(spr_soul_death);
			
			if (animation_finished()) {
				instance_destroy();
			}
}

//Absorbed by player
if (point_distance(x, y, o_Player.x, o_Player.y) < 100) {
			absorbed = true;
			o_Player.soul_count++;
			
}

if (absorbed == true) {
			image_speed = 0;
			path_end();
			set_sprite(spr_soul_death);
			image_index = approach(image_index, sprite_get_number(sprite_index) - 1, animation_speed);
			if (animation_finished()) {
				instance_destroy();
			}	
}