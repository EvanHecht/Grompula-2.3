//Falling Grompuloid Struct
falling_grompuloid = function() constructor {
	
	falling_x = random_range(0, room_width);
	falling_y = -100;
	falling_destination_y = irandom_range(650, 800);
	attribute_multiplier = max(.25, (falling_destination_y - 650)/(800 - 650));
	falling_direction = random_range(260, 280);
	falling_speed = 60 * attribute_multiplier;
	landed = false;
	sprite = spr_grompuloid_idle;
	sprite_frame = 0;
	sprite_speed = .25;
	xscale = 1 * attribute_multiplier;
	yscale = 1 * attribute_multiplier;
	
}

//This list holds of the structs for the falling grompuloids
falling_grompuloid_list = ds_list_create();

//Timer for determining when to spawn another falling grompuloid
falling_grompuloid_spawn_timer = irandom_range(120, 300);

//Background speed used to align the falling grompuloids
background_speed = layer_get_hspeed("Background");