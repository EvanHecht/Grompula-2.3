//Draw the upgrade GUI depending on the number of players
if(state == "active"){

	//Draw Banner
	draw_set_font(fnt_upgrade_banner);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outlined(banner_draw_x, banner_draw_y, "PLAYER " + string(current_player_selecting) + " CHOOSE UPGRADE", c_white, c_black);

	//Retrieve info from the player who is currently selecting
	var current_player = scr_get_player(current_player_selecting);
	var number_of_panels = current_player.stat_upgrade_panels;
		
	
	//Determine Drawing Coordinates
	var desired_panel_draw_x = (display_get_gui_width()/2) - (panel_width/2) - ((current_panel_selection - 1) * (panel_width + panel_spacing));
	var desired_panel_draw_y = panel_vertical_margin;
	
	panel_actual_draw_x = smooth_approach(panel_actual_draw_x, desired_panel_draw_x, panel_move_speed);
	panel_actual_draw_y = smooth_approach(panel_actual_draw_y, desired_panel_draw_y, panel_move_speed);
	var initial_draw_x = panel_actual_draw_x;
	var initial_draw_y = panel_actual_draw_y;
	
	var title_draw_x = panel_actual_draw_x + (panel_width/2);
	var title_draw_y = panel_actual_draw_y + 48;
	var description_draw_x = panel_actual_draw_x + (panel_width/2);
	var description_draw_y = panel_actual_draw_y + panel_height - 175;
	
	//Draw Panels
	for(var i = 1; i <= number_of_panels; i++){
		
		//Retrieve upgrade to draw
		var upgrade_to_draw = ds_list_find_value(current_upgrade_offer_list, i - 1);
		
		//Draw Panel Box
		draw_set_color(c_red);
		var panel_scale = (panel_width/sprite_get_width(spr_upgrade_panel));
		draw_sprite_ext(spr_upgrade_panel, 0, panel_actual_draw_x, panel_actual_draw_y, panel_scale, panel_scale, 0, c_white, 1);
	
		
		//Draw upgrade title
		draw_set_font(fnt_upgrade_title);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		var upgrade_title = upgrade_to_draw.title;
		draw_text_outlined(title_draw_x, title_draw_y, upgrade_title, c_white, c_black);
		
		//Draw upgrade description
		draw_set_color(c_gray);
		draw_set_font(fnt_upgrade_description);
		var upgrade_description = upgrade_to_draw.description;
		draw_text_ext(description_draw_x, description_draw_y, upgrade_description, 20, panel_width - 10);
		
		//Increment draw coordinates
		panel_actual_draw_x += (panel_width + panel_spacing); 
	
		title_draw_x = panel_actual_draw_x + (panel_width/2);
		title_draw_y = panel_actual_draw_y + 48;
		description_draw_x = panel_actual_draw_x + (panel_width/2);
		description_draw_y = panel_actual_draw_y + panel_height - 175;
	
		
	}
	
	panel_actual_draw_x = initial_draw_x;
	panel_actual_draw_y = initial_draw_y;
	
}
