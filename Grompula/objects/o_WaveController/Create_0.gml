//Game Variables
wave = 0;
wave_intermission_duration = 300;
wave_intermission_counter = wave_intermission_duration;
wave_spawn_speed = 1;

subwave_counter = 0;
subwave_interval = 1000;

game_start_delay = 500;
game_start_delay_counter = game_start_delay;

state = "game start";

did_upgrades = false;

//GUI Variables
wave_display_x = display_get_gui_width()/2;
wave_display_y = 100;



//Wave Values
current_wave_value = 0;
wave_value[1] = 10;
wave_value[2] = 15;
wave_value[3] = 21;
wave_value[4] = 28;
wave_value[5] = 39;
wave_value[6] = 49;
wave_value[7] = 60;
wave_value[8] = 72;
wave_value[9] = 84;
wave_value[10] = 100;
wave_value[11] = 110;
wave_value[12] = 120;
wave_value[13] = 130;
wave_value[14] = 140;
wave_value[15] = 150;
wave_value[16] = 160;
wave_value[17] = 170;
wave_value[18] = 180;
wave_value[19] = 190;
wave_value[20] = 250;

