

cost = 10;
interaction_range = 64;
player_in_range = false;
purchased = false;
purchasing_player = -1;

//Ui Variables
ui_draw_x = x;
ui_draw_y = y - 150;
ui_alpha = 0;
ui_fade_speed = .1;

state = "spawn";
shifted = false;
fade_phase = 1;

/* 
	Glyph Type
	1 = Weapon 
	2 = HP
*/
glyph_type = 1//irandom_range(1, 2);

//Set depth
depth = -y;