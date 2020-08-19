draw_self();
if(debug) {
	
	draw_text(x, y - 100, string(hp));
	draw_circle(x,y,sentry_range,true);
	draw_circle(x,y,attack_range,true);
}