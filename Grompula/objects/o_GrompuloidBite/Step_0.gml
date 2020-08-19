// Postion bite on parent Grompuloid
if(instance_exists(creator)){
	x = creator.x + bite_x;
	y = creator.y - bite_y_offset + bite_y;
}

//If the parent Grompuloid dies mid bite, destroy the bite
else {
	instance_destroy();	
}

//Dealing damage
if(image_index >= attack_frame && !attacked && place_meeting(x, y, o_PlayerHitbox)){

	var targets = ds_list_create();
	var num_of_targets = instance_place_list(x, y, o_PlayerHitbox, targets, false);
	
	//Damage all targets
	for(var i = 0; i < num_of_targets; i++){
		var target_player = ds_list_find_value(targets, i);
		scr_damage_player(creator.damage, target_player.creator, false, -1);
	}
	
	attacked = true;
	
}



//When animation is done, reset parent and destroy self
if(animation_finished()){

	creator.bite_object = -1;
	creator.attacked = false;
	instance_destroy();
	
	//Determine next state
	with(creator){
		
		//See if target is in attack range
		if(current_target != 0 && point_distance(center_x, center_y, current_target.center_x, current_target.center_y) <= attack_range){
			state = "attack";
		} else {
			state = "pursuit";	
		}
	
	}
}