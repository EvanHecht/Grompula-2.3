function create_bullet_casing() {
	//Determine where to create the casing
	var create_x = x + lengthdir_x(get_weapon_stat(weapon_slot[current_weapon_slot], casing_distance_offset), get_weapon_stat(weapon_slot[current_weapon_slot], casing_angle_offset));
	var create_y = y + lengthdir_y(get_weapon_stat(weapon_slot[current_weapon_slot], casing_distance_offset), get_weapon_stat(weapon_slot[current_weapon_slot], casing_angle_offset));

	//Set the casings creator
	o_GameController.create_args[0] = id;

	//Set the casings weapon type
	o_GameController.create_args[1] = weapon_slot[current_weapon_slot];

	//Create the casing
	return instance_create_depth(create_x, create_y, depth - 1, o_BulletCasing);


}
