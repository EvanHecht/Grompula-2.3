//Path used to pathfind
unit_path = path_add();

//True if the enemy was hit recently
is_hit = false;
hit_flash_duration = 6;
hit_flash_timer = hit_flash_duration;

//Get Destination Spawner
target_spawner = o_GameController.create_args[0];

//Chance to spawn soul
soul_chance = random_range(1, 10);
