//Draw the transition rectangle
if(transitioning){

	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(rectangle_start_x, 0, rectangle_end_x, display_get_gui_height(), false);
	
}