//Functional Variables
creator = o_GameController.create_args[0];
weapon_state = "readying";
image_speed = 0;
last_fire_type = primary;
depth = creator.depth - 1;

//weapon slots
weapon_slot[1] = pistol;
weapon_slot[2] = SMG;
current_weapon_slot = 1;

//Ammunition Variables
ammo_max[1] = get_weapon_stat(weapon_slot[1], ammo_capacity);
ammo_current[1] = ammo_max[1];
ammo_max[2] = get_weapon_stat(weapon_slot[2], ammo_capacity);
ammo_current[2] = ammo_max[2];
reloading[1] = false;
reloading[2] = false;

//Weapon Specific Variables
double_barrel_shells_ejected = false;
