display_set_gui_size(display_get_width(), display_get_height());

//Randomize Variables
randomize();

//Number of Players
current_number_of_players = 4;

//Player colors
player_color[1] = make_color_rgb(0, 174, 240);
player_color[2] = make_color_rgb(255, 255, 0);
player_color[3] = make_color_rgb(254, 26, 26);
player_color[4] = make_color_rgb(200, 83, 254);

//Creation arguments
create_args[0] = 0;
create_args[1] = 0;
create_args[2] = 0;

//Dev controls
dev_controls_enabled = true;

//Map List
global.map_list = ds_list_create();
ds_list_add(global.map_list, room_Crystal_Island);
ds_list_add(global.map_list, room_Lava_Map);

//Global Game Variables
global.enemy_spawn_y = -200;

//Which room to go to when the game starts
var start_room = room_Main_Menu;
room_goto(start_room);