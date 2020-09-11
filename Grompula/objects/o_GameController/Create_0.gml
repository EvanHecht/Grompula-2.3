#region Macros


//Player Colors


#endregion

display_set_gui_size(display_get_width(), display_get_height());

//Randomize Variables
randomize();

//Number of Players
current_number_of_players = 2;

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


//Which room to go to when the game starts
var start_room = room_Main_Menu;
room_goto(start_room);