//Initialize the draw variables


//Draw the hud bitch
for(var i = 1; i <= o_GameController.current_number_of_players; i++){
	
	var draw_x = player_draw_x[i];
	var draw_y = player_draw_y[i];
	var current_draw_direction = draw_direction[i]
	
	//Get the current player being drawn
	var current_player = scr_get_player(i);
	
	//Draw the player portrait
	draw_sprite_ext(spr_player_picture, 0, draw_x, draw_y, player_portrait_xscale * current_draw_direction, player_portrait_yscale, 0, c_white, HUD_alpha);
	
	//Set the draw coordinates to allign with the desired healthbar location
	draw_x = player_draw_x[i] + (healthbar_container_x_offset * current_draw_direction);
	draw_y = player_draw_y[i] + healthbar_container_y_offset;
	
	//Draw the healthbar
	var actual_health_percentage = (current_player.hp/current_player.stat_hp);
	var delayed_health_percentage = max((healthbar_delayed_value[i - 1]/current_player.stat_hp) - .01, 0);
	draw_set_alpha(HUD_alpha);
	draw_sprite_ext(spr_healthbar_container_background, 0, draw_x, draw_y, current_draw_direction, 1, 0, c_white, HUD_alpha);
	draw_x = player_draw_x[i] + (healthbar_x_offset * current_draw_direction);
	draw_y = player_draw_y[i] + healthbar_y_offset;
	draw_set_color(healthbar_delayed_color);
	draw_rectangle(draw_x, draw_y, draw_x + ((healthbar_length * current_draw_direction) * delayed_health_percentage), draw_y + healthbar_height + 1, false); //Delayed bar
	draw_sprite_ext(spr_healthbar, 0, draw_x, draw_y, (healthbar_length * actual_health_percentage) * current_draw_direction, 1, 0, c_white, HUD_alpha);
	draw_x = player_draw_x[i] + (healthbar_container_x_offset * current_draw_direction);
	draw_y = player_draw_y[i] + healthbar_container_y_offset;
	draw_sprite_ext(spr_healthbar_container, 0, draw_x, draw_y, current_draw_direction, 1, 0, c_white, HUD_alpha); //Healthbar container

	//Set the draw coordinates to allign with the desired ammo symbol location
	draw_x = player_draw_x[i] + (ammo_display_symbol_x_offset * current_draw_direction);
	draw_y = player_draw_y[i] + ammo_display_symbol_y_offset;
	
	//Draw the ammo symbol
	draw_sprite_ext(spr_ammo_symbol, 0, draw_x, draw_y, ammo_display_symbol_x_scale, ammo_display_symbol_y_scale, 0, c_white, HUD_alpha);

	//Set the draw coordinates to allign with the desired ammo display location
	draw_x = player_draw_x[i] + (ammo_display_x_offset * current_draw_direction);
	draw_y = player_draw_y[i] + ammo_display_y_offset;
	
	//Draw the Ammo Display
	if(current_draw_direction == 1) draw_set_halign(fa_left);
	else if(current_draw_direction == -1) draw_set_halign(fa_right);
	var player_weapon = current_player.player_weapon;
	var current_ammo = player_weapon.ammo_current[player_weapon.current_weapon_slot];
	var current_capacity = player_weapon.ammo_max[player_weapon.current_weapon_slot];
	draw_set_font(fnt_player_hud);
	draw_text_outlined(draw_x, draw_y, string(current_ammo) + " / " + string(current_capacity), ammo_display_color, c_black);
	
	//Set the draw coordinates to allign with the desired ammo symbol display location
	draw_x = player_draw_x[i] + (soul_display_symbol_x_offset * current_draw_direction);
	draw_y = player_draw_y[i] + soul_display_symbol_y_offset;
	
	//Draw the soul symbol
	draw_sprite_ext(spr_soul_symbol, 0, draw_x, draw_y, soul_display_symbol_x_scale, soul_display_symbol_y_scale, 0, c_white, HUD_alpha);

	//Set the draw coordinates to allign with the desired soul display location
	draw_x = player_draw_x[i] + (soul_display_x_offset * current_draw_direction);
	draw_y = player_draw_y[i] + soul_display_y_offset;
	
	//Draw the soul Display
	if(current_draw_direction == 1) draw_set_halign(fa_left);
	else if(current_draw_direction == -1) draw_set_halign(fa_right);
	var number_of_souls = current_player.soul_count;
	draw_set_font(fnt_player_hud);
	draw_text_outlined(draw_x, draw_y, string(number_of_souls), soul_display_color, c_black);

}