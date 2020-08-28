/**
This script is called on the start of the game.
*/
function scr_game_start(){

	#region Setup Global Macros
	
	//Misc Macros
	#macro largest_possible_value 9223372036854775807
	
	//Input Macros
	#macro input_type_keyboard 1
	#macro input_type_mouse 2
	#macro input_type_controller 3
	
	//Player Colors
	#macro player_color_1 make_color_rgb(0, 174, 240)
	#macro player_color_2 c_yellow
	#macro player_color_3 c_fuchsia
	#macro player_color_4 c_red
	
	#endregion
	
	#region Setup Game Config
	
	//Create Game Config File
	#macro game_config "game_config"
	ini_open(game_config);
	
	//First time setup
	global.first_time_setup = ini_read_real("configuration", "first_time_setup", true);
	if(global.first_time_setup){
		ini_write_real("configuration", "first_time_setup", false);	
	}
	
	//Close Game Config File1
	ini_close();
	#endregion
	
	#region Setup Controls Config
		
		#macro controls_config "controls_config"
		
		if(global.first_time_setup){	
			ini_open(controls_config);
			ini_write_real("Misc", "file_initialized", true); //Something must be written for the file to be created.
			ini_close();
		}
		
	
	
	#endregion
	
	

	#region Create Initial Game Objects
	
	//Game Controller
	instance_create_depth(0, 0, 0, o_GameController);
	
	//Input Controller
	instance_create_depth(0, 0, 0, o_InputController);
	
	//Weapon Database
	instance_create_depth(0, 0, 0, o_WeaponDatabase);
	
	//Enemy Databse
	instance_create_depth(0, 0, 0, o_EnemyDatabase);
	
	
	#endregion
	
	
}