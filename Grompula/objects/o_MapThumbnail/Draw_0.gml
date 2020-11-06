draw_self();

//Draw title text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_outlined(x, y + map_title_offset, map_title, c_white, c_black);