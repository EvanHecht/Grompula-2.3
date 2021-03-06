//Create The Database
global.weapon_database = ds_map_create();
global.weapon_spritebase = ds_map_create();
global.weapon_scriptbase = ds_map_create();
global.weapon_list = ds_list_create();

//General Weapon Macros
#macro primary 1
#macro secondary 2
#macro semi_auto 3
#macro full_auto 4

#region Weapon ID Macros

#macro no_weapon 0
#macro pistol 1
#macro SMG 2
#macro double_barrel 3
#macro burst_rifle 4

#endregion

#region Weapon Stat Macros

//Generic
#macro weapon_name 0
#macro reload_speed 1
#macro ready_speed 2
#macro ammo_capacity 3
#macro body_distance 4
#macro muzzle_angle_offset 5
#macro muzzle_distance_offset 6 
#macro casing_angle_offset 7
#macro casing_distance_offset 8
#macro weapon_xscale 9
#macro weapon_yscale 10

//Primary
#macro primary_fire_rate 11
#macro primary_shot_speed 12
#macro primary_spread 13
#macro primary_damage 14
#macro primary_range 15
#macro primary_penetration 16
#macro primary_firing_mode 17

//Secondary
#macro secondary_fire_rate 18
#macro secondary_shot_speed 19
#macro secondary_spread 20
#macro secondary_damage 21
#macro secondary_range 22
#macro secondary_penetration 23
#macro secondary_firing_mode 24

#endregion

#region Weapon Sprite Macros

#macro weapon_sprite_model 100
#macro weapon_sprite_idle 101
#macro weapon_sprite_primary_fire 102
#macro weapon_sprite_primary_bullet 103
#macro weapon_sprite_secondary_fire 104
#macro weapon_sprite_secondary_bullet 105
#macro weapon_sprite_ready 106
#macro weapon_sprite_reload 107
#macro weapon_sprite_bullet_casing 108
#macro weapon_sprite_muzzle_flash 109

#endregion

#region Weapon Script Macros

#macro weapon_script_primary_fire 200
#macro weapon_script_secondary_fire 201
#macro weapon_script_primary_bullet 202
#macro weapon_script_secondary_bullet 203
#macro weapon_script_primary_firing 204
#macro weapon_script_secondary_firing 205
#macro weapon_script_reload 206
#macro weapon_script_constant_behavior 207

#endregion

#region <Pistol>

//[STATS]
pistol_stats = ds_map_create();

//Generic Stats
ds_map_add(pistol_stats, weapon_name, "Pistol");
ds_map_add(pistol_stats, reload_speed, 100);
ds_map_add(pistol_stats, ready_speed, 60);
ds_map_add(pistol_stats, ammo_capacity, 12);
ds_map_add(pistol_stats, body_distance, 30);
ds_map_add(pistol_stats, muzzle_angle_offset, 13);
ds_map_add(pistol_stats, muzzle_distance_offset, 60);
ds_map_add(pistol_stats, casing_angle_offset, 52);
ds_map_add(pistol_stats, casing_distance_offset, 18);
ds_map_add(pistol_stats, weapon_xscale, 1);
ds_map_add(pistol_stats, weapon_yscale, 1);

//Primary Stats
ds_map_add(pistol_stats, primary_fire_rate, 15);
ds_map_add(pistol_stats, primary_shot_speed, 40);
ds_map_add(pistol_stats, primary_spread, 7);
ds_map_add(pistol_stats, primary_damage, 1);
ds_map_add(pistol_stats, primary_range, 1000);
ds_map_add(pistol_stats, primary_penetration, 1);
ds_map_add(pistol_stats, primary_firing_mode, semi_auto);

//Secondary Stats
ds_map_add(pistol_stats, secondary_fire_rate, 40);
ds_map_add(pistol_stats, secondary_shot_speed, 40);
ds_map_add(pistol_stats, secondary_spread, 7);
ds_map_add(pistol_stats, secondary_damage, 1);
ds_map_add(pistol_stats, secondary_range, 700);
ds_map_add(pistol_stats, secondary_penetration, 1);
ds_map_add(pistol_stats, secondary_firing_mode, semi_auto);

//[SPRITES]
pistol_sprites = ds_map_create();
ds_map_add(pistol_sprites, weapon_sprite_model, spr_pistol_model);
ds_map_add(pistol_sprites, weapon_sprite_idle, spr_pistol_idle);
ds_map_add(pistol_sprites, weapon_sprite_primary_fire, spr_pistol_fire);
ds_map_add(pistol_sprites, weapon_sprite_secondary_fire, spr_pistol_fire);
ds_map_add(pistol_sprites, weapon_sprite_ready, spr_pistol_ready);
ds_map_add(pistol_sprites, weapon_sprite_reload, spr_pistol_reload);
ds_map_add(pistol_sprites, weapon_sprite_primary_bullet, spr_pistol_bullet);
ds_map_add(pistol_sprites, weapon_sprite_secondary_bullet, spr_pistol_bullet);
ds_map_add(pistol_sprites, weapon_sprite_muzzle_flash, spr_pistol_muzzle_flash);
ds_map_add(pistol_sprites, weapon_sprite_bullet_casing, spr_pistol_bullet_casing);

//[SCRIPTS]
pistol_scripts = ds_map_create();
ds_map_add(pistol_scripts, weapon_script_primary_fire, primary_fire_pistol);
ds_map_add(pistol_scripts, weapon_script_secondary_fire, secondary_fire_pistol);
ds_map_add(pistol_scripts, weapon_script_primary_bullet, primary_bullet_pistol);
ds_map_add(pistol_scripts, weapon_script_secondary_bullet, secondary_bullet_pistol);
ds_map_add(pistol_scripts, weapon_script_primary_firing, primary_firing_pistol);
ds_map_add(pistol_scripts, weapon_script_secondary_firing, secondary_firing_pistol);
ds_map_add(pistol_scripts, weapon_script_reload, reload_pistol());
ds_map_add(pistol_scripts, weapon_script_constant_behavior, constant_behavior_pistol());

//Add this weapon to the databases
ds_map_add(global.weapon_database, pistol, pistol_stats); 
ds_map_add(global.weapon_spritebase, pistol, pistol_sprites);
ds_map_add(global.weapon_scriptbase, pistol, pistol_scripts);
ds_list_add(global.weapon_list, pistol);

#endregion

#region <SMG>

//[STATS]
SMG_stats = ds_map_create();

//Generic Stats
ds_map_add(SMG_stats, weapon_name, "SMG");
ds_map_add(SMG_stats, reload_speed, 100);
ds_map_add(SMG_stats, ready_speed, 50);
ds_map_add(SMG_stats, ammo_capacity, 25);
ds_map_add(SMG_stats, body_distance, 50);
ds_map_add(SMG_stats, muzzle_angle_offset, 14);
ds_map_add(SMG_stats, muzzle_distance_offset, 76);
ds_map_add(SMG_stats, casing_angle_offset, 90);
ds_map_add(SMG_stats, casing_distance_offset, 23);
ds_map_add(SMG_stats, weapon_xscale, 1);
ds_map_add(SMG_stats, weapon_yscale, 1);

//Primary Stats
ds_map_add(SMG_stats, primary_fire_rate, 12);
ds_map_add(SMG_stats, primary_shot_speed, 45);
ds_map_add(SMG_stats, primary_spread, 7);
ds_map_add(SMG_stats, primary_damage, .75);
ds_map_add(SMG_stats, primary_range, 1000);
ds_map_add(SMG_stats, primary_penetration, 1);
ds_map_add(SMG_stats, primary_firing_mode, full_auto);

//Secondary Stats
ds_map_add(SMG_stats, secondary_fire_rate, 5);
ds_map_add(SMG_stats, secondary_shot_speed, 40);
ds_map_add(SMG_stats, secondary_spread, 40);
ds_map_add(SMG_stats, secondary_damage, .75);
ds_map_add(SMG_stats, secondary_range, 350);
ds_map_add(SMG_stats, secondary_penetration, 1);
ds_map_add(SMG_stats, secondary_firing_mode, full_auto);

//[SPRITES]
SMG_sprites = ds_map_create();
ds_map_add(SMG_sprites, weapon_sprite_model, spr_SMG_model);
ds_map_add(SMG_sprites, weapon_sprite_idle, spr_SMG_idle);
ds_map_add(SMG_sprites, weapon_sprite_primary_fire, spr_SMG_fire);
ds_map_add(SMG_sprites, weapon_sprite_secondary_fire, spr_SMG_fire);
ds_map_add(SMG_sprites, weapon_sprite_ready, spr_SMG_ready);
ds_map_add(SMG_sprites, weapon_sprite_reload, spr_SMG_reload);
ds_map_add(SMG_sprites, weapon_sprite_primary_bullet, spr_SMG_bullet);
ds_map_add(SMG_sprites, weapon_sprite_secondary_bullet, spr_SMG_bullet);
ds_map_add(SMG_sprites, weapon_sprite_muzzle_flash, spr_SMG_muzzle_flash);
ds_map_add(SMG_sprites, weapon_sprite_bullet_casing, spr_SMG_bullet_casing);

//[SCRIPTS]
SMG_scripts = ds_map_create();
ds_map_add(SMG_scripts, weapon_script_primary_fire, primary_fire_SMG);
ds_map_add(SMG_scripts, weapon_script_secondary_fire, secondary_fire_SMG);
ds_map_add(SMG_scripts, weapon_script_primary_bullet, primary_bullet_SMG);
ds_map_add(SMG_scripts, weapon_script_secondary_bullet, secondary_bullet_SMG);
ds_map_add(SMG_scripts, weapon_script_primary_firing, primary_firing_SMG);
ds_map_add(SMG_scripts, weapon_script_secondary_firing, secondary_firing_SMG);
ds_map_add(SMG_scripts, weapon_script_reload, reload_SMG());
ds_map_add(SMG_scripts, weapon_script_constant_behavior, constant_behavior_SMG());

//Add this weapon to the databases
ds_map_add(global.weapon_database, SMG, SMG_stats); 
ds_map_add(global.weapon_spritebase, SMG, SMG_sprites);
ds_map_add(global.weapon_scriptbase, SMG, SMG_scripts);
ds_list_add(global.weapon_list, SMG);

#endregion

#region <Double Barrel>

//[STATS]
double_barrel_stats = ds_map_create();

//Generic Stats
ds_map_add(double_barrel_stats, weapon_name, "Double Barrel");
ds_map_add(double_barrel_stats, reload_speed, 100);
ds_map_add(double_barrel_stats, ready_speed, 50);
ds_map_add(double_barrel_stats, ammo_capacity, 2);
ds_map_add(double_barrel_stats, body_distance, 20);
ds_map_add(double_barrel_stats, muzzle_angle_offset, 3.2);
ds_map_add(double_barrel_stats, muzzle_distance_offset, 124);
ds_map_add(double_barrel_stats, casing_angle_offset, 31);
ds_map_add(double_barrel_stats, casing_distance_offset, 17);
ds_map_add(double_barrel_stats, weapon_xscale, 1);
ds_map_add(double_barrel_stats, weapon_yscale, 1);



//Primary Stats
ds_map_add(double_barrel_stats, primary_fire_rate, 25);
ds_map_add(double_barrel_stats, primary_shot_speed, 45);
ds_map_add(double_barrel_stats, primary_spread, 12);
ds_map_add(double_barrel_stats, primary_damage, .75);
ds_map_add(double_barrel_stats, primary_range, 400);
ds_map_add(double_barrel_stats, primary_penetration, 1);
ds_map_add(double_barrel_stats, primary_firing_mode, semi_auto);

//Secondary Stats
ds_map_add(double_barrel_stats, secondary_fire_rate, 25);
ds_map_add(double_barrel_stats, secondary_shot_speed, 45);
ds_map_add(double_barrel_stats, secondary_spread, 24);
ds_map_add(double_barrel_stats, secondary_damage, .75);
ds_map_add(double_barrel_stats, secondary_range, 400);
ds_map_add(double_barrel_stats, secondary_penetration, 1);
ds_map_add(double_barrel_stats, secondary_firing_mode, full_auto);

//[SPRITES]
double_barrel_sprites = ds_map_create();
ds_map_add(double_barrel_sprites, weapon_sprite_model, spr_double_barrel_model);
ds_map_add(double_barrel_sprites, weapon_sprite_idle, spr_double_barrel_idle);
ds_map_add(double_barrel_sprites, weapon_sprite_primary_fire, spr_double_barrel_fire);
ds_map_add(double_barrel_sprites, weapon_sprite_secondary_fire, spr_double_barrel_fire);
ds_map_add(double_barrel_sprites, weapon_sprite_ready, spr_double_barrel_ready);
ds_map_add(double_barrel_sprites, weapon_sprite_reload, spr_double_barrel_reload);
ds_map_add(double_barrel_sprites, weapon_sprite_primary_bullet, spr_double_barrel_bullet);
ds_map_add(double_barrel_sprites, weapon_sprite_secondary_bullet, spr_double_barrel_bullet);
ds_map_add(double_barrel_sprites, weapon_sprite_muzzle_flash, spr_double_barrel_muzzle_flash);
ds_map_add(double_barrel_sprites, weapon_sprite_bullet_casing, spr_double_barrel_bullet_casing);


//[SCRIPTS]
double_barrel_scripts = ds_map_create();
ds_map_add(double_barrel_scripts, weapon_script_primary_fire, primary_fire_double_barrel);
ds_map_add(double_barrel_scripts, weapon_script_secondary_fire, secondary_fire_double_barrel);
ds_map_add(double_barrel_scripts, weapon_script_primary_bullet, primary_bullet_double_barrel);
ds_map_add(double_barrel_scripts, weapon_script_secondary_bullet, secondary_bullet_double_barrel);
ds_map_add(double_barrel_scripts, weapon_script_primary_firing, primary_firing_double_barrel);
ds_map_add(double_barrel_scripts, weapon_script_secondary_firing, secondary_firing_double_barrel);
ds_map_add(double_barrel_scripts, weapon_script_reload, reload_double_barrel);
ds_map_add(double_barrel_scripts, weapon_script_constant_behavior, constant_behavior_double_barrel());

//Add this weapon to the databases
ds_map_add(global.weapon_database, double_barrel, double_barrel_stats); 
ds_map_add(global.weapon_spritebase, double_barrel, double_barrel_sprites);
ds_map_add(global.weapon_scriptbase, double_barrel, double_barrel_scripts);
ds_list_add(global.weapon_list, double_barrel);

#endregion

#region <Burst Rifle>

//[STATS]
burst_rifle_stats = ds_map_create();

//Generic Stats
ds_map_add(burst_rifle_stats, weapon_name, "Burst Rifle");
ds_map_add(burst_rifle_stats, reload_speed, 120);
ds_map_add(burst_rifle_stats, ready_speed, 60);
ds_map_add(burst_rifle_stats, ammo_capacity, 30);
ds_map_add(burst_rifle_stats, body_distance, 35);
ds_map_add(burst_rifle_stats, muzzle_angle_offset, 10.008);
ds_map_add(burst_rifle_stats, muzzle_distance_offset, 86.5);
ds_map_add(burst_rifle_stats, casing_angle_offset, 49);
ds_map_add(burst_rifle_stats, casing_distance_offset, 20);
ds_map_add(burst_rifle_stats, weapon_xscale, .75);
ds_map_add(burst_rifle_stats, weapon_yscale, .75);


//Primary Stats
ds_map_add(burst_rifle_stats, primary_fire_rate, 35);
ds_map_add(burst_rifle_stats, primary_shot_speed, 35);
ds_map_add(burst_rifle_stats, primary_spread, 1);
ds_map_add(burst_rifle_stats, primary_damage, 1.7);
ds_map_add(burst_rifle_stats, primary_range, 1000);
ds_map_add(burst_rifle_stats, primary_penetration, 1);
ds_map_add(burst_rifle_stats, primary_firing_mode, semi_auto);

//Secondary Stats
ds_map_add(burst_rifle_stats, secondary_fire_rate, 7);
ds_map_add(burst_rifle_stats, secondary_shot_speed, 40);
ds_map_add(burst_rifle_stats, secondary_spread, 25);
ds_map_add(burst_rifle_stats, secondary_damage, .75);
ds_map_add(burst_rifle_stats, secondary_range, 400);
ds_map_add(burst_rifle_stats, secondary_penetration, 1);
ds_map_add(burst_rifle_stats, secondary_firing_mode, full_auto);


//[SPRITES]
burst_rifle_sprites = ds_map_create();
ds_map_add(burst_rifle_sprites, weapon_sprite_model, spr_burst_rifle_model);
ds_map_add(burst_rifle_sprites, weapon_sprite_idle, spr_burst_rifle_idle);
ds_map_add(burst_rifle_sprites, weapon_sprite_primary_fire, spr_burst_rifle_fire);
ds_map_add(burst_rifle_sprites, weapon_sprite_secondary_fire, spr_burst_rifle_fire);
ds_map_add(burst_rifle_sprites, weapon_sprite_ready, spr_burst_rifle_ready);
ds_map_add(burst_rifle_sprites, weapon_sprite_reload, spr_burst_rifle_reload);
ds_map_add(burst_rifle_sprites, weapon_sprite_primary_bullet, spr_burst_rifle_bullet);
ds_map_add(burst_rifle_sprites, weapon_sprite_secondary_bullet, spr_burst_rifle_bullet);
ds_map_add(burst_rifle_sprites, weapon_sprite_muzzle_flash, spr_burst_rifle_muzzle_flash);
ds_map_add(burst_rifle_sprites, weapon_sprite_bullet_casing, spr_burst_rifle_bullet_casing);

//[SCRIPTS]
burst_rifle_scripts = ds_map_create();
ds_map_add(burst_rifle_scripts, weapon_script_primary_fire, primary_fire_burst_rifle);
ds_map_add(burst_rifle_scripts, weapon_script_secondary_fire, secondary_fire_burst_rifle);
ds_map_add(burst_rifle_scripts, weapon_script_primary_bullet, primary_bullet_burst_rifle);
ds_map_add(burst_rifle_scripts, weapon_script_secondary_bullet, secondary_bullet_burst_rifle);
ds_map_add(burst_rifle_scripts, weapon_script_primary_firing, primary_firing_burst_rifle);
ds_map_add(burst_rifle_scripts, weapon_script_secondary_firing, secondary_firing_burst_rifle);
ds_map_add(burst_rifle_scripts, weapon_script_reload, reload_burst_rifle());
ds_map_add(burst_rifle_scripts, weapon_script_constant_behavior, constant_behavior_burst_rifle());

//Add this weapon to the databases
ds_map_add(global.weapon_database, burst_rifle, burst_rifle_stats); 
ds_map_add(global.weapon_spritebase, burst_rifle, burst_rifle_sprites);
ds_map_add(global.weapon_scriptbase, burst_rifle, burst_rifle_scripts);
ds_list_add(global.weapon_list, burst_rifle);

#endregion



