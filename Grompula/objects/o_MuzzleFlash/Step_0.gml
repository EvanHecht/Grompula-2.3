//Set Position & Depth
x = creator.x + lengthdir_x(get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_distance_offset), creator.image_angle + (sign(creator.image_yscale) * get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_angle_offset))) + current_x_offset;
y = creator.y + lengthdir_y(get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_distance_offset), creator.image_angle + (sign(creator.image_yscale) * get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_angle_offset))) + current_y_offset;
depth = creator.depth - 1;

//Count down to destroy
image_index = approach(image_index, sprite_get_number(sprite_index) - 1, animation_speed);
if(animation_finished()){
	instance_destroy();	
}
