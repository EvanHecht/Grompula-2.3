//Draw self
draw_self();

//Draw UI When player is close
if(player_in_range && !purchased){
	ui_alpha = approach(ui_alpha, 1, ui_fade_speed);
} else {
	ui_alpha = approach(ui_alpha, 0, ui_fade_speed);
}

if(ui_alpha > 0){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(ui_alpha);
	draw_set_font(fnt_glyph);
	
	//Define Message
	if(closest_player != -1 && closest_player.player == 1 && o_InputController.player_1_use_keyboard == true){
		ui_message = "Press '" + o_InputController.select_binding[0] + "' To Purchase [10 Souls]";
	} else if(closest_player != -1){
		ui_message = "Press " + o_InputController.select_binding[closest_player.player] + " To Purchase [10 Souls]";	
	}
	
	draw_text_outlined(ui_draw_x, ui_draw_y, ui_message, c_white, c_black);
	draw_set_alpha(1);
}



//draw_text(x, y - 180, state);
//draw_text(x, y - 210, fade_phase);