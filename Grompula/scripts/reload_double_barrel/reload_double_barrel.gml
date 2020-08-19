function reload_double_barrel() {
	//The shotgun ejects its shells when opened
	if(round(image_index >= 5) && !double_barrel_shells_ejected){
		create_bullet_casing();
		create_bullet_casing();
		double_barrel_shells_ejected = true;
	}

	//Shells have not been ejected once put back in during the animation
	if(animation_finished()){
		double_barrel_shells_ejected = false;
	}




}
