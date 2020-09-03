///This script holds all of the functions used for the SMG weapon.

//		----------------------[PRIMARY]----------------------

///@decription This function is called to primary fire the SMG.
function primary_fire_SMG() {
	
	//Fire Bullet
	fire_bullet(primary);

	//Subtract Ammo
	ammo_current[current_weapon_slot]--;
	
}

///@description This function contains the behavior of the primary bullet of the SMG.
function primary_bullet_SMG() {
	weapon_bullet_generic();
}

///@description This function is called during the primary fire animation of SMG
function primary_firing_SMG(){}

//		-----------------------------------------------------




//		----------------------[SECONDARY]----------------------

///@decription This function is called to secondary fire the SMG.
function secondary_fire_SMG() {
	
	//Fire Bullet
	fire_bullet(secondary);

	//Subtract Ammo
	ammo_current[current_weapon_slot]--;

}

///@description This function contains the behavior of the secondary bullet of the SMG.
function secondary_bullet_SMG() {
	
	weapon_bullet_generic();

}

///@description This function is called during the secondary fire animation of SMG
function secondary_firing_SMG(){}
	

//		-----------------------------------------------------




//		----------------------[RELOADING]----------------------

///@decription This function is called when reloading SMG.
function reload_SMG(){}

//		-------------------------------------------------------




//		-------------------[CONSTANT BEHAVIOR]-----------------

///@decription This function is called constantly while SMG is equipped.
function constant_behavior_SMG(){}

//		-------------------------------------------------------