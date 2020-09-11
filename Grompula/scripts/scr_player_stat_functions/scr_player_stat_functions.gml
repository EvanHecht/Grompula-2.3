///@description Initializes all of the player stat grids with the correct values, should be run on game start
function player_stat_setup(){
	
	//Define the global player stat grid
	global.player_stat_grid = ds_grid_create(5, 1);
	
	//Define all of the individual player sub-grids
	ds_grid_set(global.player_stat_grid, 1, 0, ds_grid_create(5, 1));
	ds_grid_set(global.player_stat_grid, 2, 0, ds_grid_create(5, 1));
	ds_grid_set(global.player_stat_grid, 3, 0, ds_grid_create(5, 1));
	ds_grid_set(global.player_stat_grid, 4, 0, ds_grid_create(5, 1));
	
	//Populate the player sub-grids with lists to hold the stat data
	for(var i = 1; i <= 4; i++){
		
		//Retrieve the current grid to populate
		var current_grid = ds_grid_get(global.player_stat_grid, i, 0);
		
		for(var j = 0; j < 5; j++){
			
			//Populate all indicies of the grid with lists
			ds_grid_set(current_grid, j, 0, ds_list_create());
			
		}
			
	}
	
	//Function used to define a player stat
	function player_stat_define(stat_name, player, initial_value, min_value, max_value){
		
		//Get the current grid to add to
		var player_grid = ds_grid_get(global.player_stat_grid, player, 0);
		
		//Set the name of the stat (X = 0)
		ds_list_add(ds_grid_get(player_grid, 0, 0), stat_name);
		
		//Set the initial value of the stat (X = 1)
		ds_list_add(ds_grid_get(player_grid, 1, 0), initial_value);
		
		//Set the min of the stat (X = 2)
		ds_list_add(ds_grid_get(player_grid, 2, 0), min_value);
		
		//Set the max of the stat (X = 3)
		ds_list_add(ds_grid_get(player_grid, 3, 0), max_value);
		
		//This cell is used to track the current value (X = 4)
		ds_list_add(ds_grid_get(player_grid, 4, 0), initial_value);
		
	}
	
	//Add all stats to the stat grids
	for(var i = 1; i <= 4; i++){
		
		//Define all of the i ststs
		player_stat_define("hp", i, 5, 1, 99999); //HP
		player_stat_define("movement speed", i, 5, .1, 100); //Movement Speed
		player_stat_define("aiming speed", i, 20, 1, 359); //Aiming Speed
		player_stat_define("accuracy", i, 0, -1, 1); //Accuracy
		player_stat_define("damage", i, 1, .01, 99999); //Damage
		player_stat_define("penetration", i, 0, 0, 99999); //Penetration
		player_stat_define("fire rate", i, 1, .01, 99999); //Fire Rate
		player_stat_define("reload speed", i, 1, .01, 99999); //Reload Speed
		player_stat_define("rolling speed", i, 20, .1, 100); //Rolling Speed
		player_stat_define("iframes", i, 120, 0, 99999); //Iframes
		
	}
	
	/*
	
									     [GLOBAL STAT GRID]
	-------------------------------------------------------------------------------------------
	|empty| player 1 stat grid | player 2 stat grid | player 3 stat grid | player 4 stat grid |
	-------------------------------------------------------------------------------------------
	
										 [PLAYER STAT GRID]
		 	------------------------------------------------------------------------------
			|Stat Name List| Initial Value List| Minimum Value List | Maximum Value List |
			------------------------------------------------------------------------------

	*/
	
	
}

///@description Returns the current value of the desired stat
function get_player_stat(stat_name, player){
	
	var index = ds_list_find_index(ds_grid_get(ds_grid_get(global.player_stat_grid, player, 0), 0, 0), stat_name);
	return ds_list_find_value(ds_grid_get(ds_grid_get(global.player_stat_grid, player, 0), 4, 0), index);
	
}