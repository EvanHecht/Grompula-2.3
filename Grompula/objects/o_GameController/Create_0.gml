#region Macros


//Player Colors


#endregion

display_set_gui_size(display_get_width(), display_get_height());

//Randomize Variables
randomize();

//Number of Players
max_number_of_players = 4;
current_number_of_players = 1;

//Player colors
player_color[1] = c_aqua;
player_color[2] = c_white;
player_color[3] = c_white;
player_color[4] = c_white;

//Creation arguments
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