///@description fire_bullet(fire_type)
///@param fire_type
function fire_bullet(argument0) {



	//Create the bullet casing
	create_bullet_casing();

	o_GameController.create_args[0] = id; //Set the creator of the bullet
	o_GameController.create_args[1] = argument0; //Primary or secondary

	//Position to spawn the bullet at
	var spawn_x = muzzle_x;
	var spawn_y = muzzle_y;

	return instance_create_depth(spawn_x, spawn_y, depth, o_PlayerBullet); //<-- Create the bullet



}
