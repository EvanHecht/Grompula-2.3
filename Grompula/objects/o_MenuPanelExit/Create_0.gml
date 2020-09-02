//Inherit Parent Variables
event_inherited();



//Change what needs to be changed
panel_title = "Exit Game";
panel_description = "Closes the game.";
panel_graphic = spr_main_menu_exit_graphic;
panel_graphic_animation_speed = .1;
panel_graphic_draw_y = y + 200;
panel_graphic_xscale = .5;
panel_graphic_yscale = .5;


//Panel Description Location Must Be different for smaller panels
panel_description_draw_x = x + 32;
panel_description_draw_y = y + 325;