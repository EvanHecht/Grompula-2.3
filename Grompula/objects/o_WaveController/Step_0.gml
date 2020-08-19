//State Machine
switch(state){
	
	#region Game Start
	case "game start":
		
		//Countdown Game Start
		game_start_delay_counter = approach(game_start_delay_counter, 0, 1);
		if(game_start_delay_counter <= 0){
			wave = 1;
			state = "wave";
			current_wave_value = wave_value[wave];
		}
		
	break;
	#endregion
	
	#region Wave
	case "wave":
	
		subwave_counter = approach(subwave_counter, 0, 1 * wave_spawn_speed);
		if(subwave_counter <= 0 || !instance_exists(o_Enemy)){
			
			//Decide how much value to spend
			var wave_spawn_percentage = random_range(.1, .20);
			var wave_value_to_spend = min(current_wave_value, round(wave_value[wave] * wave_spawn_percentage));
			current_wave_value -= wave_value_to_spend;
			
			var spawner_list = instance_list_random(o_Spawner);
			
			//Spawn The Enemies
			while(wave_value_to_spend > 0){
			
				var unit_to_spawn = ds_list_find_value(global.enemy_type_list, irandom_range(0, ds_list_size(global.enemy_type_list) - 1));
				
				//Spawn the unit
				var current_spawner = ds_list_find_value(spawner_list, irandom_range(0, ds_list_size(spawner_list) - 1));
				spawn_enemy(unit_to_spawn, current_spawner);
				
				//Subtract unit value
				wave_value_to_spend = approach(wave_value_to_spend, 0, 1);
				
			}
			
			
			ds_list_destroy(spawner_list);
			subwave_counter = subwave_interval;
		}
		
		//End of wave
		if(current_wave_value == 0 && !instance_exists(o_Enemy)) state = "wave end";
		
	
	break;
	#endregion
	
	#region "wave end" State
	case "wave end":
	
		wave_intermission_counter = approach(wave_intermission_counter, 0, 1)
	
		//Every 3rd round do upgrades
		if(wave mod 3 == 0 && !did_upgrades && wave != 0){
			o_UpgradeController.state = "active";
			did_upgrades = true;
		}
	
	
		//On New Wave Start
		if(wave_intermission_counter == 0){
			wave++;
			current_wave_value = wave_value[wave];
			subwave_counter = 120;
			wave_intermission_counter = wave_intermission_duration;
			state = "wave";	
			did_upgrades = false;
		}
		
	
	break;
	#endregion
	
	#region "paused" State
	case "paused":
	
	
	
	break;
	#endregion
	
}