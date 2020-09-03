///This script holds all of the functions used for the double_barrel weapon.

//		----------------------[PRIMARY]----------------------

///@decription This function is called to primary fire the double_barrel.
function primary_fire_double_barrel() {
	//How many pellets each shot will fire
	var number_of_pellets = 12;

	//Fire All Pellets
	for(var i = 0; i < number_of_pellets; i++){
		fire_bullet(primary);
	}

	//Subtract Ammo
	ammo_current[current_weapon_slot]--;

}

///@description This function contains the behavior of the primary bullet of the double_barrel.
function primary_bullet_double_barrel() {
	
	//Vary speed on creation
	if(on_creation){
	
		var double_barrel_bullet_speed_offset = 20;
		bullet_speed += random_range(-double_barrel_bullet_speed_offset, double_barrel_bullet_speed_offset);
	}

	else {
	
		//Set bullet damage
		var minimum_damage_percentage = .25;
		var damage_fall_off_rate = 2.25;
		bullet_damage = max(initial_bullet_damage * minimum_damage_percentage, initial_bullet_damage * (bullet_range/(distance_traveled * damage_fall_off_rate)));
	
		//Generic Bullet Behavior
		weapon_bullet_generic();
	
	}
	
}


///@description This function is called during the primary fire animation of double_barrel
function primary_firing_double_barrel(){}

//		-----------------------------------------------------




//		----------------------[SECONDARY]----------------------

///@decription This function is called to secondary fire the double_barrel.
function secondary_fire_double_barrel() {
	//How many pellets each shot will fire
	var number_of_pellets = 12 * ammo_current[current_weapon_slot];

	//Fire All Pellets
	for(var i = 0; i < number_of_pellets; i++){
		fire_bullet(secondary);
	}

	//Subtract Ammo
	ammo_current[current_weapon_slot] = 0;

}


///@description This function contains the behavior of the secondary bullet of the double_barrel.
function secondary_bullet_double_barrel() {
	//Vary speed on creation
	if(on_creation){
	
		var double_barrel_bullet_speed_offset = 25;
		bullet_speed += random_range(-double_barrel_bullet_speed_offset, double_barrel_bullet_speed_offset);
	}

	else {
	
		//Set bullet damage
		var minimum_damage_percentage = .25;
		var damage_fall_off_rate = 2.25;
		bullet_damage = max(initial_bullet_damage * minimum_damage_percentage, initial_bullet_damage * (bullet_range/(distance_traveled * damage_fall_off_rate)));
	
		weapon_bullet_generic();
	
	}

}

///@description This function is called during the secondary fire animation of double_barrel
function secondary_firing_double_barrel(){}
	

//		-----------------------------------------------------




//		----------------------[RELOADING]----------------------

///@decription This function is called when reloading double_barrel.
function reload_double_barrel() {
	
	//The shotgun ejects its shells when opened
	if(round(image_index >= 5) && !double_barrel_shells_ejected){
		create_bullet_casing();
		create_bullet_casing();
		double_barrel_shells_ejected = true;
	}

	//Shells have not been ejected once put back in during the animation
	if(animation_finished()){
		double_barrel_shells_ejected = false;
	}

}


//		-------------------------------------------------------




//		-------------------[CONSTANT BEHAVIOR]-----------------

///@decription This function is called constantly while double_barrel is equipped.
function constant_behavior_double_barrel(){}

//		-------------------------------------------------------