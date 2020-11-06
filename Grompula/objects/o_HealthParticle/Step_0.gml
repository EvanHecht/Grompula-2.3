//Tick down lifetime
lifetime--;
if(lifetime <= 0){
	image_alpha -= fade_speed;	
}

//Destroy when fully faded
if(image_alpha <= 0) instance_destroy();