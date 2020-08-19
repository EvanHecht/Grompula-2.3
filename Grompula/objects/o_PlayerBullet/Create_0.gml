#region Functional Variables

creator = o_GameController.create_arge[0];
fire_type = o_GameController.create_args[1];
weapon_type = creator.weapon_slot[creator.current_weapon_slot];
active = true;
distance_traveled = 0;
enemies_hit = 0;
bullet_hit_list = ds_list_create();
frame_targets = ds_list_create();
sprite_index = get_weapon_sprite(weapon_type, weapon_sprite_primary_bullet);
bullet_fade_speed = .2;



#endregion

#region Bullet Stats

if(fire_type == primary){
	
	bullet_range = get_weapon_stat(weapon_type, primary_range);
	bullet_speed = get_weapon_stat(weapon_type, primary_shot_speed);
	bullet_accuracy = get_weapon_stat(weapon_type, primary_accuracy);
	bullet_damage = get_weapon_stat(weapon_type, primary_damage);
	bullet_range = get_weapon_stat(weapon_type, primary_range);
	bullet_penetration = get_weapon_stat(weapon_type, primary_penetration);
	
}

else {
	
	bullet_range = get_weapon_stat(weapon_type, secondary_range);
	bullet_speed = get_weapon_stat(weapon_type, secondary_shot_speed);
	bullet_accuracy = get_weapon_stat(weapon_type, secondary_accuracy);
	bullet_damage = get_weapon_stat(weapon_type, secondary_damage);
	bullet_range = get_weapon_stat(weapon_type, secondary_range);
	bullet_penetration = get_weapon_stat(weapon_type, secondary_penetration);
	
}


//Set initial variables
initial_bullet_range = bullet_range;
initial_bullet_speed = bullet_speed;
initial_bullet_accuracy = bullet_accuracy;
initial_bullet_damage = bullet_damage;
initial_bullet_range = bullet_range;
initial_bullet_penetration = bullet_penetration;;

#endregion

//Set Trajectory of bullet
angle = creator.image_angle + random_range(-bullet_accuracy, bullet_accuracy);
image_angle = angle;

//Execute the on creation portion of behavior script
on_creation = true;
var behavior = -1;
if(fire_type == primary) behavior = get_weapon_script(weapon_type, weapon_script_primary_bullet);
else if(fire_type == secondary) behavior = get_weapon_script(weapon_type, weapon_script_secondary_bullet);
if(!is_undefined(behavior) && behavior != -1) script_execute(behavior);
on_creation = false;
