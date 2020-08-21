event_inherited();

//Grompuloid Stats
movement_speed = 3 * (1 + (o_WaveController.wave * .332));
current_movement_speed = movement_speed;

falling_speed = 20;
current_falling_speed = falling_speed;
falling_acceleration = .25;
current_falling_acceleration = falling_acceleration;
landing_screen_shake = 15;

base_hp = 10;
hp = base_hp;

base_damage = 1;
damage = base_damage;


//Functional Variables
state = "entry";
current_target = -1;
aggro_range = 350;
retarget_cooldown = 180;
retarget_counter = 0;
bite_object = -1;
center_x = x;
center_y = y - 45;
attack_range = 85;
attacked = false;