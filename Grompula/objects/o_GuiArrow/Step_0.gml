
if(clicked()){
	image_index = 0;
	image_speed = 1;
	activated = true;
} else {
	activated = false;
}

if(animation_finished()){
	image_speed = 0;
	image_index = 0;
}