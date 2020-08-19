//Draw Shadow
if(state != "aquiring"){
	var shadow_width = 64;
	var shadow_height = 10;
	var shadow_scale = 1 - ((y - starting_y)/46);
	draw_set_alpha(.5);
	draw_ellipse_color(shadow_x - ((shadow_width/2) * shadow_scale), shadow_y - ((shadow_height/2) * shadow_scale), shadow_x + ((shadow_width/2) * shadow_scale), shadow_y + ((shadow_height/2) * shadow_scale), c_gray, c_gray, false);
	draw_set_alpha(1);
}

//Draw UI When player is close
if(player_in_range){
	ui_alpha = approach(ui_alpha, 1, ui_fade_speed);
} else {
	ui_alpha = approach(ui_alpha, 0, ui_fade_speed);
}

//Draw UI
if(ui_alpha > 0 && state == "floating"){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(ui_alpha);
	draw_text_outlined(ui_draw_x, ui_draw_y, "Pick up " + pickup_weapon_name, c_white, c_black);
	draw_set_alpha(1);
}


//Draw Self
draw_self();