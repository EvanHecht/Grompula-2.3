
//Assign Depth
depth = -y;

#region Stats
player_stat_grid = ds_grid_create(4, 10);

//Hp
stat_hp = 5;
hp = stat_hp;
max_hp = 9999;
min_hp = 1;

//Movement Speed
stat_movement_speed = 5;
movement_speed = stat_movement_speed;
movement_speed_max = 100;
movement_speed_min = 0;

//Aiming Speed
stat_aiming_speed = 20;
aiming_speed = stat_aiming_speed;
aiming_speed_max = 359;
aiming_speed_min = 1;

//Accuracy
stat_accuracy = 0;
accuracy = stat_accuracy;
accuracy_max = 1;
accuracy_min = -1;

//Damage
stat_damage = 1;
damage = stat_damage;
damage_max = 99999;
damage_min = .01;

//Penetration
stat_penetration = 0;
penetration = 0;
penetration_max = 99999;
penetration_min = .01;

//Fire rate
stat_fire_rate = 0;
fire_rate = stat_fire_rate;
fire_rate_max = 10;
fire_rate_min = .1;

//Reload Speed
stat_reloading_speed = 0;
reloading_speed = stat_reloading_speed;
reloading_speed_max = 10;
reloading_speed_min = .1;

//Rolling Speed
stat_rolling_speed = 20;
rolling_speed = stat_rolling_speed;
rolling_speed_max = 100;
rolling_speed_min = 0;

//Upgrade Panels
stat_upgrade_panels = 3;

//iframes
stat_iframes = 120;
iframes = 0;



#endregion


#region Status Effects

//Slows
status_effect_slow_percentage = 0;
status_effect_slow_duration = 0;

#endregion

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
hp = 5;
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
