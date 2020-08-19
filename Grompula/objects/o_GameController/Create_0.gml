//Useful Macros
#macro largest_possible_value 9223372036854775807

display_set_gui_size(display_get_width(), display_get_height());

//Randomize Variables
randomize();

//Number of Players
max_number_of_players = 4;
current_number_of_players = 2;

create_args[0] = 0;
create_args[1] = 0;
create_args[2] = 0;

//Dev controls
dev_controls_enabled = true;

//Map List
global.map_list = ds_list_create();
ds_list_add(global.map_list, room_Island_Map);
ds_list_add(global.map_list, room_Lava_Map);

//Global Game Variables
global.enemy_spawn_y = -200;

//Create Persistant Game Objects
instance_create_depth(0, 0, 0, o_InputController);
instance_create_depth(0, 0, 0, o_WeaponDatabase);
instance_create_depth(0, 0, 0, o_EnemyDatabase);


//Which room to go to when the game starts
//var start_room = room_Island_Map
//room_goto(start_room);