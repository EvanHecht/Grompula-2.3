function destroy_enemy() {
	
	//Glyph Spawning
	var spawn_glyph = percent_chance(20);	
	
	if(spawn_glyph){
		instance_create_depth(x, y, depth, o_Glyph);
	}
	
	
	//Determine whether soul is spawned
	spawn_soul();

	//Destroy enemy
	instance_destroy();


}
