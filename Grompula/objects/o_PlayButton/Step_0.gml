//Move Right Wehen Moused Over
if(mouse_over()){
	graphic_x = approach(graphic_x, graphic_end_x, move_speed);
} else {
	graphic_x = approach(graphic_x, graphic_start_x, move_speed);	
}

if(clicked()){

	room_goto(room_Crystal_Island);

}