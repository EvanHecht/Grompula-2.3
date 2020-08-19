boss_spawner_list = instance_list_random(o_Spawner);
spawn_boss_location = ds_list_find_value(boss_spawner_list, irandom_range(0, ds_list_size(boss_spawner_list) - 1));
spawn_enemy(Brainmonger, spawn_boss_location)
instance_destroy()

