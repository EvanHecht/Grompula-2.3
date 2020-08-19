//Path used to pathfind
unit_path = path_add();

//Get Destination Spawner
target_spawner = o_GameController.create_args[0];

//Chance to spawn soul
soul_chance = random_range(1, 10);
