function get_enemy_stat(argument0, argument1) {
	//Get Arguments
	var enemy = argument0;
	var stat = argument1;

	//Get enemy stat map
	var stat_map = ds_map_find_value(global.enemy_stat_map, enemy);

	//Return the stat
	return ds_map_find_value(stat_map, stat);


}
