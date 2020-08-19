///@description get_weapon_stat(weapon_type, script_type)
///@param weapon_type
///@param script_type
function get_weapon_script(argument0, argument1) {

	//Get Arguments
	var weapon = argument0;
	var script = argument1;

	//Get weapon stat map
	var script_map = ds_map_find_value(global.weapon_scriptbase, weapon);

	//Return the stat
	return ds_map_find_value(script_map, script);


}
