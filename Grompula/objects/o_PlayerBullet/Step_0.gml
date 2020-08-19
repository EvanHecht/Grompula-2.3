//Act according to script
var behavior = -1;
if(fire_type == primary) behavior = get_weapon_script(weapon_type, weapon_script_primary_bullet);
if(fire_type == secondary) behavior = get_weapon_script(weapon_type, weapon_script_secondary_bullet);
if(!is_undefined(behavior) && behavior != -1)script_execute(behavior);

//Check bullet penetration
if(enemies_hit >= bullet_penetration){
	instance_destroy();
}


//Begin to fade
if(active = 0) {
	
	bullet_speed = smooth_approach(bullet_speed, 0, bullet_fade_speed);
	image_alpha = approach(image_alpha, 0, bullet_fade_speed);
	bullet_damage = smooth_approach(bullet_damage, 0, bullet_fade_speed);
	
	//Once fully faded
	if(image_alpha == 0) instance_destroy();
	
}

