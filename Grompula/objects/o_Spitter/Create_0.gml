event_inherited();

//Spitter Stats
movement_speed = 2 * (1 + (o_WaveController.wave * .332));
current_movement_speed = movement_speed;

falling_speed = 10;
current_falling_speed = falling_speed;
falling_acceleration = .1;
current_falling_acceleration = falling_acceleration;

base_hp = 10;
hp = base_hp;

attack_range = 900;
sentry_range = 500;

//Temp
attack_timer = 60;

debug = false;

//Functional Variables
state = "entry";
current_target = -1;
aggro_range = 350;
