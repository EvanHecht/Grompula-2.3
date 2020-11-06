depth = -9999
active = true;
cursor_move_speed = 10;

mouse_previous_x = mouse_x;
mouse_previous_y = mouse_y;

function mouse_moving(prev_x, prev_y){
	
	return prev_x != mouse_x || prev_y != mouse_y;

}