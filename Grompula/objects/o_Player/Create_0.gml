//Functional Variables
player = o_GameController.create_args[0];
direction_facing = 1; // -1 = left | 1 = right
direction_moving_horizontal = 1; // -1 = left | 1 = right
direction_moving_vertical = 1;
aim_angle = 0;
center_x = x;
center_y = y - 45;
dead = false;
state = "idle";
image_speed = 0;
depth = -y;
soul_count = 100;
environmental_damage_timer = 0;
invincible = false;
invinciblility_flashing = false;

//Create hitbox
o_GameController.create_args[0] = id;
player_hitbox = instance_create_depth(x, y, depth - 1, o_PlayerHitbox);


//Create Player Weapon
o_GameController.create_args[0] = id;
player_weapon = instance_create_depth(x, y, depth - 1, o_PlayerWeapon);


//Initialize Stats
hp = get_player_stat("hp", player);
movement_speed = get_player_stat("movement speed", player);
aiming_speed = get_player_stat("aiming speed", player);
accuracy = get_player_stat("accuracy", player);
damage = get_player_stat("damage", player);
penetration = get_player_stat("penetration", player);
fire_rate = get_player_stat("fire rate", player);
reloading_speed = get_player_stat("reloading speed", player);
rolling_speed = get_player_stat("rolling speed", player);
iframes = 0;
upgrade_panels = 3;


//Status effects
slow_timer = 0;
stun_timer = 0;


