///This script holds all of the functions used for the pistol weapon.

//		----------------------[PRIMARY]----------------------

///@decription This function is called to primary fire the pistol.
function primary_fire_pistol() {

	//Fire Bullet
	fire_bullet(primary);
	audio_play_sound(snd_pistol_fire, 1, false);

	//Subtract Ammo
	ammo_current[current_weapon_slot]--;

}

///@description This function contains the behavior of the primary bullet of the pistol.
function primary_bullet_pistol() {
	
	weapon_bullet_generic();

}

///@description This function is called during the primary fire animation of pistol
function primary_firing_pistol(){}

//		-----------------------------------------------------




//		----------------------[SECONDARY]----------------------

///@decription This function is called to secondary fire the pistol.
function secondary_fire_pistol() {

	//Determine how many bullets to fire
	var bullets_to_fire = min(3, ammo_current[current_weapon_slot]);
	
	//Fire all bullets
	for(var i = 0; i < bullets_to_fire; i++){
		fire_bullet(secondary);
		ammo_current[current_weapon_slot]--;
	}

}

///@description This function contains the behavior of the secondary bullet of the pistol.
function secondary_bullet_pistol() {
	weapon_bullet_generic();
}

///@description This function is called during the secondary fire animation of pistol
function secondary_firing_pistol(){}
	

//		-----------------------------------------------------




//		----------------------[RELOADING]----------------------

///@decription This function is called when reloading pistol.
function reload_pistol(){}

//		-------------------------------------------------------




//		-------------------[CONSTANT BEHAVIOR]-----------------

///@decription This function is called constantly while pistol is equipped.
function constant_behavior_pistol(){}

//		-------------------------------------------------------