#region Set up room when match starts

//Check if room is a playable map
if(ds_list_find_index(global.map_list, room) != -1){
	
	//Spawn Players
	with(o_PlayerSpawner){
		
		//Get the spawn Locations
		var spawn_x = x + x_spawn_offset;
		var spawn_y = y + y_spawn_offset;
		
		//Spawn the players
		if(o_GameController.current_number_of_players >= player_number){
			o_GameController.create_args[0] = player_number;
			instance_create_depth(spawn_x, spawn_y, -spawn_y, o_Player);
		}
	}
	
	//Create the camera (Players required for camera to work properly)
	instance_create_depth(room_width/2, room_height/2, 0, o_Camera);
	
	//Create the room grid
	instance_create_depth(0, 0, 0, o_RoomGrid);

	//Create the Wave Controller
	instance_create_depth(0, 0, 0, o_WaveController);

	//Create the Upgrade Controller
	instance_create_depth(0, 0, 0, o_UpgradeController);
	
	//Enable the upgrade controller
	o_UpgradeController.state = "active";
	
	//Start the hud controller
	instance_create_depth(0, 0, 0, o_HUDController);

	
}




#endregion