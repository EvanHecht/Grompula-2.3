//The type of gun this pickup grants
pickup_weapon_type = o_GameController.create_args[0];
pickup_weapon_name = get_weapon_stat(pickup_weapon_type, weapon_name);

//Set the sprite according to gun
var gun_sprite = get_weapon_sprite(pickup_weapon_type, weapon_sprite_model);
set_sprite(gun_sprite);

//Reduce the size of the weapon because it looks better
image_xscale = .75;
image_yscale = .75;

//Floating variables
float_direction = 1; //1 = down, 2 = up
float_speed = .5;
float_distance = 16;
starting_x = x;
starting_y = y;
shadow_x = starting_x;
shadow_y = starting_y + 45;

//Interacting variables
state = "floating";
interaction_range = 100;
interacting_player = -1;
player_in_range = false;

//Aquirement variables
fly_direction = "away" //away or towards player
fly_base_speed = 30;
grow_speed = .1;
turning_point_x = 0;
turning_point_y = 0;
turning_point_distance = 300;

//UI Variables
ui_draw_x = starting_x;
ui_draw_y = starting_y - 65;
ui_alpha = 0;
ui_fade_speed = .1;

//Set depth
depth = -shadow_y;