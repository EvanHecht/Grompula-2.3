//Draw the panel
draw_self();

//Drawing the panel title
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_panel_title);
draw_text_ext(panel_title_draw_x, panel_title_draw_y, panel_title, panel_text_separation, sprite_width - (panel_margin * 2))

//Drawing the grapic
draw_sprite_ext(panel_graphic, panel_graphic_frame, panel_graphic_draw_x, panel_graphic_draw_y, panel_graphic_xscale, panel_graphic_yscale, 0, c_white, 1);

//Drawing the description
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_panel_description);
draw_text_ext(panel_description_draw_x, panel_description_draw_y, panel_description, panel_text_separation, sprite_width - (panel_margin * 2));