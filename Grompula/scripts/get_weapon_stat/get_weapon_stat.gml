///@description get_weapon_stat(weapon_type, fire_type)
///@param weapon_type
///@param fire_type
function get_weapon_stat(argument0, argument1) {

	//Get Arguments
	var weapon = argument0;
	var stat = argument1;

	//Get weapon stat map
	var stat_map = ds_map_find_value(global.weapon_database, weapon);

	//Return the stat
	return ds_map_find_value(stat_map, stat);


}
