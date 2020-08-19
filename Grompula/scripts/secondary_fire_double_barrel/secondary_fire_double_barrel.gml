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
