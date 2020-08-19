 // The PlayerWeapon object this muzzle Flash Belongs to
creator = o_GameController.create_arge[0];

//Set Appearance
sprite_index = get_weapon_sprite(creator.weapon_slot[creator.current_weapon_slot], weapon_sprite_muzzle_flash);
image_angle = irandom_range(0, 359);
image_speed = 0;
animation_speed = .8;
depth = creator.depth - 1;

//Set Position
muzzle_offset_range = 10;
current_x_offset = irandom_range(-muzzle_offset_range, muzzle_offset_range);
current_y_offset = irandom_range(-muzzle_offset_range, muzzle_offset_range);
x = creator.x + lengthdir_x(get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_distance_offset), creator.image_angle + (sign(creator.image_yscale) * get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_angle_offset)));
y = creator.y + lengthdir_y(get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_distance_offset), creator.image_angle + (sign(creator.image_yscale) * get_weapon_stat(creator.weapon_slot[creator.current_weapon_slot], muzzle_angle_offset)));









