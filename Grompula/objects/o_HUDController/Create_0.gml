//HUD Drawing Specifications
player_portrait_xscale = 1;
player_portrait_yscale = 1;
HUD_alpha = 1;

//Healthbar variables
healthbar_length = 294;
healthbar_height = 30;
healthbar_delayed_color = c_white;
healthbar_container_x_offset = 150;
healthbar_container_y_offset = 15;
healthbar_x_offset = 186;
healthbar_y_offset = 19;

//Ammo display variables
ammo_display_symbol_x_offset = 170;
ammo_display_symbol_y_offset = 82;
ammo_display_symbol_x_scale = .75;
ammo_display_symbol_y_scale = .75;
ammo_display_x_offset = 205;
ammo_display_y_offset = 84;
ammo_display_color = c_white;

//Soul display variables
soul_display_symbol_x_offset = 360;
soul_display_symbol_y_offset = 86;
soul_display_symbol_x_scale = .4;
soul_display_symbol_y_scale = .4;
soul_display_x_offset = 390;
soul_display_y_offset = 84;
soul_display_color = c_white;

//Player 1 HUD Specifications
player_draw_x[1] = 64;
player_draw_y[1] = 64;
draw_direction[1] = 1;  //1 = Towards the right, -1 = Towards the left

//Player 2 Hud Specifications
player_draw_x[2] = display_get_gui_width() - 64;
player_draw_y[2] = 64;
draw_direction[2] = -1;

//Player 3 Hud Specifications
player_draw_x[3] = 64;
player_draw_y[3] = 256;
draw_direction[3] = 1;

//Player 4 Hud Specifications
player_draw_x[4] = display_get_gui_width() - 64;
player_draw_y[4] = 256;
draw_direction[4] = -1;
//Healthbar delayed movement values
healthbar_delayed_value = [5, 5, 5, 5];
healthbar_delayed_speed = .01;