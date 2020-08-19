//During the round, display the wave counter
if(state == "wave"){
	draw_set_font(fnt_wave_display);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outlined(wave_display_x, wave_display_y, "Wave " + string(wave), c_white, c_black);
}

//Between Rounds, display wave approaching
else if(state == "wave end"){
	draw_set_font(fnt_wave_display);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outlined(wave_display_x, wave_display_y, "Wave " + string(wave + 1) + " Approaching...", c_white, c_black);
}
