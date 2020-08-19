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
