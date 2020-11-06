//Glyph Variables
cost = 10;
interaction_range = 64;
player_in_range = false;
purchased = false;
closest_player = -1;
purchasing_player = -1;
state = "spawn";

//Ui Variables
ui_draw_x = x;
ui_draw_y = y - 150;
ui_alpha = 0;
ui_fade_speed = .1;
shifted = false;
fade_phase = 1;
ui_message = "";



/* 
	Glyph Type
	1 = Weapon 
	2 = HP
*/
glyph_type = irandom_range(1, 2);

//Set depth
depth = -y;

//Set the sprite to the creation sprite
set_sprite(spr_glyph_spawn);