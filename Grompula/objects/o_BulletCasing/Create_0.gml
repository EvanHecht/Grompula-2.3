//The o_PlayerWeapon object that created this
creator = o_GameController.create_args[0];

//The weapon associated with this casing
weapon_type = o_GameController.create_args[1];

//Set launch variables
launch_direction = -sign(creator.image_yscale); //-1 = left & 1 = right
launch_angle_offset = irandom_range(110, 140);
launch_angle = creator.image_angle + (-launch_direction * launch_angle_offset);
launch_speed = 12;
launch_speed_x = lengthdir_x(launch_speed, launch_angle);
launch_speed_y = lengthdir_y(launch_speed, launch_angle);
launch_ground_coordinate = creator.creator.y;
launch_gravity = .35;
launch_speed_x_deceleration = .05;
landed = false;
collided = false;

//Appearance
sprite_index = get_weapon_sprite(creator.weapon_slot[creator.current_weapon_slot], weapon_sprite_bullet_casing);
depth = creator.depth - 1;
rotation_speed = launch_speed_x * 2;

//How many frames they persist for after hitting the ground
lifetime = 180;

//How quickly to fade away
fade_speed = .1;

#region Special 'Cases' ;)

//Double Barrel Shotgun - Shouldn't show casings after firing
if(weapon_type == double_barrel && creator.weapon_state != "reloading"){
	instance_destroy();
}

#endregion

