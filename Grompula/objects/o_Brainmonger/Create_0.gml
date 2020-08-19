event_inherited();

//Brainmonger Stats

falling_speed = 10;
current_falling_speed = falling_speed;
falling_acceleration = .1;
current_falling_acceleration = falling_acceleration;

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