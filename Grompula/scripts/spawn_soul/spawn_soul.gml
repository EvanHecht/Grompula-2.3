function spawn_soul() {
	//30% chance to spawn a soul
	if (soul_chance <= 3) {
		instance_create_depth(x, y, -y, o_Soul)
	}


}
