

//State Machine
switch(state){
	
	#region "inactve" state
	case "inactive":
	
	break;
	#endregion
	
	#region "active" state
		case "active":
		
			o_WaveController.state = "paused";
			
			//Initalize upgrade process
			if(initialized_upgrade_for_player == false){
				
				//Clear current upgrade list and add random available upgrades to be offered
				ds_list_clear(current_upgrade_offer_list);
				var number_of_upgrades_to_select = scr_get_player(current_player_selecting).stat_upgrade_panels;
				var number_of_upgrades_available = ds_list_size(upgrade_list);
				for(var i = 0; i < number_of_upgrades_to_select; i++){
						
						var valid_upgrade = false;
						while(!valid_upgrade){
						//Get upgrade to add
						var upgrade_index = irandom_range(0, number_of_upgrades_available - 1);
						var new_upgrade = ds_list_find_value(upgrade_list, upgrade_index); 
					
						//Check if upgrade was already added, and if not, add it
						if(ds_list_find_index(current_upgrade_offer_list, new_upgrade) == -1){
							ds_list_add(current_upgrade_offer_list, new_upgrade);
							valid_upgrade = true;
						}
					}
				
				}	
				
				//indicate the the upgrade offers have been updated for the next player
				initialized_upgrade_for_player = true;
				
			} else {
			
				//Switch panel selection
				var increment = o_InputController.move_horizontal_pressed[current_player_selecting];
				if(increment != 0){
					current_panel_selection += increment;
					current_panel_selection = clamp(current_panel_selection, 1, scr_get_player(current_player_selecting).stat_upgrade_panels);
				}
			
				//Select Upgrade
				if(o_InputController.select[current_player_selecting]){
				
					//Apply the chosen upgrade
					var upgrade_to_apply = ds_list_find_value(current_upgrade_offer_list, current_panel_selection - 1);
					var upgrade_script = upgrade_to_apply.script;
					var player_to_upgrade = scr_get_player(current_player_selecting);
					script_execute(upgrade_script, player_to_upgrade);
				
					//Cycle to next player
					current_panel_selection = 1;
					initialized_upgrade_for_player = false;

					//If last player, finalize. If not, switch to next player
					if(current_player_selecting == o_GameController.current_number_of_players){
						current_player_selecting = 1;
						state = "inactive";
						if(instance_exists(o_WaveController)) o_WaveController.state = "wave end";
					} else {
						current_player_selecting++;	
					}
			
				}
			
			}
			
			
		break;
	#endregion
	
}


