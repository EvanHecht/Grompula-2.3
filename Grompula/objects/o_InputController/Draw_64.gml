if(debug){

if(keyboard_check(vk_anykey)){
	last_key_pressed = keycode_to_keyname(keyboard_lastkey);
}

draw_set_color(c_white);
draw_text(100, 100, string(last_key_pressed));

if(keyboard_check(32)){
	draw_rectangle(200, 200, 300, 300, false);
}

}