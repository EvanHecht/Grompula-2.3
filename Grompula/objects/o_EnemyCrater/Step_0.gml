//Stop the crater at the final frame
if(animation_finished()){
	image_speed = 0;
	image_index = image_number - 1;
}

//Decrement the crater lifetime
crater_lifetime = approach(crater_lifetime, 0, 1);
if(crater_lifetime == 0){
	image_alpha = approach(image_alpha, 0, crater_fade_speed);
	if(image_alpha == 0) instance_destroy();
}