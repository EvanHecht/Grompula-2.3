function secondary_fire_pistol() {
	//Fire The Bullets
	if(ammo_current[current_weapon_slot] >= 3){
		fire_bullet(secondary);
		fire_bullet(secondary);
		fire_bullet(secondary);
		ammo_current[current_weapon_slot] -= 3;
	}

	else if(ammo_current[current_weapon_slot] == 2){
		fire_bullet(secondary);
		fire_bullet(secondary);
		ammo_current[current_weapon_slot] -= 2;
	} 

	else {
		fire_bullet(secondary);
		ammo_current[current_weapon_slot]--;
	}



}
