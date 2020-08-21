//Hit flash
if(is_hit){
	shader_set_safe(shdr_white);
	draw_self();
	shader_reset();
} else {
	draw_self();	
}