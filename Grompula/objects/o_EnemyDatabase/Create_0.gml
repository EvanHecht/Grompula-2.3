//Create Database Structures
global.enemy_type_list = ds_list_create();
global.enemy_type_map = ds_map_create();
global.enemy_stat_map = ds_map_create();

#region Enemy Type Macros

	#macro Grompuloid 1
	#macro Spitter 2

#endregion

#region Boss Type Macros

	#macro Brainmonger 20

#endregion

#region Enemy Stat Macros

	#macro enemy_spawn_value 100

#endregion

#region Grompuloid

grompuloid_stats = ds_map_create();

//Add Stats
ds_map_add(grompuloid_stats, enemy_spawn_value, 1);

//Add Unit To Data Structures
ds_list_add(global.enemy_type_list, Grompuloid);
ds_map_add(global.enemy_type_map, Grompuloid, o_Grompuloid);
ds_map_add(global.enemy_stat_map, Grompuloid, grompuloid_stats);


#endregion

#region Spitter

spitter_stats = ds_map_create();

// Add stats
ds_map_add(spitter_stats, enemy_spawn_value, 2);

//Add Unit To Data Structures
//ds_list_add(global.enemy_type_list, Spitter);
ds_map_add(global.enemy_type_map, Spitter, o_Spitter);
ds_map_add(global.enemy_stat_map, Spitter, spitter_stats);

#endregion

#region Brainmonger

brainmonger_stats = ds_map_create();

// Add stats
ds_map_add(brainmonger_stats, enemy_spawn_value, 20);

//Add Unit To Data Structures
//ds_list_add(global.enemy_type_list, Brainmonger);
//ds_map_add(global.enemy_type_map, Brainmonger, o_Brainmonger);
//ds_map_add(global.enemy_stat_map, Brainmonger, brainmonger_stats);

#endregion

