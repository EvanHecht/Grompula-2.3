/// @description spawn_enemy(enemy_type (macro), spawner_id)
/// @param enemy_type
/// @param spawner_id
function spawn_enemy(argument0, argument1) {


	//Get arguments
	var enemy_type = argument0;
	var spawner = argument1;

	var enemy_object = ds_map_find_value(global.enemy_type_map, enemy_type);

	o_GameController.create_args[0] = spawner;
	instance_create_depth(spawner.x + 32, global.enemy_spawn_y, -global.enemy_spawn_y, enemy_object);



}
