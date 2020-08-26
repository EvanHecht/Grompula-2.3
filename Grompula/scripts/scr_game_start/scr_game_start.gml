/**
This script is called on the start of the game.
*/
function scr_game_setup(){

	#region Setup Global Macros
	
	//Misc Macros
	#macro largest_possible_value 9223372036854775807
	
	//Player Colors
	#macro player_color_1 make_color_rgb(0, 174, 240)
	#macro player_color_2 c_yellow
	#macro player_color_3 c_fuchsia
	#macro player_color_4 c_red
	
	#endregion

	#region Create Initial Game Objects
	
	//Game Controller
	instance_create_depth(0, 0, 0, o_GameController);
	
	//Weapon Database
	instance_create_depth(0, 0, 0, o_WeaponDatabase);
	
	
	
	#endregion
}