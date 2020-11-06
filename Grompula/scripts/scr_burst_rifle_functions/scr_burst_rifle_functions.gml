///This script holds all of the functions used for the burst_rifle weapon.

//		----------------------[PRIMARY]----------------------

///@decription This function is called to primary fire the burst_rifle.
function primary_fire_burst_rifle(){

	//Fire the initial bullet
	fire_bullet(primary);
	burst_rifle_bullet_fired[0] = true;
	
	//Subtract ammo
	ammo_current[current_weapon_slot]--;

}

///@description This function contains the behavior of the primary bullet of the .
function primary_bullet_burst_rifle(){
	
	weapon_bullet_generic();
	
}

///@description This function is called during the primary fire animation of burst_rifle
function primary_firing_burst_rifle(){

	//The frames of the animation where the second and third bullet will be fired.
	var second_bullet_fire_frame = 4;
	var third_bullet_fire_frame = 7;

	//Fire the second bullet
	if(!burst_rifle_bullet_fired[1] && image_index >= second_bullet_fire_frame && ammo_current[current_weapon_slot] > 0 ){
		fire_bullet(primary);
		instance_create_depth(x, y, depth - 1, o_MuzzleFlash);
		ammo_current[current_weapon_slot]--;
		burst_rifle_bullet_fired[1] = true;
	}
	
	//Fire the third bullet
	if(!burst_rifle_bullet_fired[2] && image_index >= third_bullet_fire_frame && ammo_current[current_weapon_slot] > 0 ){
		fire_bullet(primary);
		instance_create_depth(x, y, depth - 1, o_MuzzleFlash);
		ammo_current[current_weapon_slot]--;
		burst_rifle_bullet_fired[2] = true;
	}

	//Reset the bullet fired checkers
	if(animation_finished()){
		burst_rifle_bullet_fired[0] = false;
		burst_rifle_bullet_fired[1] = false;
		burst_rifle_bullet_fired[2] = false;
	}

}

//		-----------------------------------------------------




//		----------------------[SECONDARY]----------------------

///@decription This function is called to secondary fire the burst_rifle.
function secondary_fire_burst_rifle(){}

///@description This function contains the behavior of the secondary bullet of the burst_rifle.
function secondary_bullet_burst_rifle(){}

///@description This function is called during the secondary fire animation of burst_rifle
function secondary_firing_burst_rifle(){}
	

//		-----------------------------------------------------




//		----------------------[RELOADING]----------------------

///@decription This function is called when reloading burst_rifle.
function reload_burst_rifle(){}

//		-------------------------------------------------------




//		-------------------[CONSTANT BEHAVIOR]-----------------

///@decription This function is called constantly while burst_rifle is equipped.
function constant_behavior_burst_rifle(){}

//		-------------------------------------------------------