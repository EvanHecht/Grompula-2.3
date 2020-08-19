///@description get_weapon_stat(weapon_type, sprite_type)
///@param weapon_type
///@param sprite_type
function get_weapon_sprite(argument0, argument1) {

	//Get Arguments
	var weapon = argument0;
	var sprite = argument1;

	//Get weapon stat map
	var sprite_map = ds_map_find_value(global.weapon_spritebase, weapon);

	//Return the stat
	return ds_map_find_value(sprite_map, sprite);


}
