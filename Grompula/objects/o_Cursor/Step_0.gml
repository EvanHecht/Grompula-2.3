//Move Cursor
if(!o_InputController.player_1_use_keyboard){
	var horizontal_movement = o_InputController.move_right[1] - o_InputController.move_left[1];
	var vertical_movement = o_InputController.move_down[1] - o_InputController.move_up[1];

	x += horizontal_movement * cursor_move_speed;
	y += vertical_movement * cursor_move_speed;
}

if(mouse_moving(mouse_previous_x, mouse_previous_y)){
	x = mouse_x;
	y = mouse_y;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

//Update mouse previous location for next frame
mouse_previous_x = mouse_x;
mouse_previous_y = mouse_y;