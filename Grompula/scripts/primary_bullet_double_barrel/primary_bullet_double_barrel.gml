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
