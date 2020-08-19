#region Weapon Rotation & Positoning

//Set the correct image angle
image_angle = angle_approach(image_angle, creator.aim_angle, creator.aiming_speed);
var angle_diff = abs(angle_difference(image_angle, 0));

if(angle_diff < 90) image_yscale = abs(image_yscale);
else if(angle_diff > 90) image_yscale = -abs(image_yscale);



//Keep gun on center of player.
x = creator.center_x + lengthdir_x(get_weapon_stat(weapon_slot[current_weapon_slot], body_distance), image_angle);
y = creator.center_y + lengthdir_y(get_weapon_stat(weapon_slot[current_weapon_slot], body_distance), image_angle);



#endregion



switch(weapon_state){
	
	#region "entry" State
	case "entry":
		
		set_sprite(get_weapon_sprite(weapon_slot[current_weapon_slot], weapon_sprite_idle));
		
		//Decide Which State to go to
		if(reloading[current_weapon_slot]){
			weapon_state = "reloading"	
		} else {
			weapon_state = "readying";
		}
		
	break;
	
	
	#endregion
	
	#region "readying" State
	
	case "readying":
	
		//Set sprite to readying sprite
		set_sprite(get_weapon_sprite(weapon_slot[current_weapon_slot], weapon_sprite_ready));
		
		var animation_speed = sprite_get_number(sprite_index) / get_weapon_stat(weapon_slot[current_weapon_slot], ready_speed);
		image_index = approach(image_index, sprite_get_number(sprite_index) - 1, animation_speed);
		
		if(animation_finished()){
			
			//Check if out of ammo
			if(ammo_current[current_weapon_slot] == 0) weapon_state = "reloading";
			else weapon_state = "idle";
		}
		
		
	break;
	#endregion
	
	#region "idle" State
	case "idle":
	
		//Dev guns thing
		if(keyboard_check_pressed(vk_left)) weapon_slot[current_weapon_slot] = double_barrel;
		
		
		//Set sprite to idle sprite
		set_sprite(get_weapon_sprite(weapon_slot[current_weapon_slot], weapon_sprite_idle));
		
		
		//Primary Fire
		if(o_InputController.fire_pressed[creator.player] || (o_InputController.fire[creator.player] && get_weapon_stat(weapon_slot[current_weapon_slot], primary_firing_mode) == full_auto)){
			o_GameController.create_arge[0] = id;
			muzzle_flash = instance_create_depth(x, y, depth - 1, o_MuzzleFlash);
			script_execute(get_weapon_script(weapon_slot[current_weapon_slot], weapon_script_primary_fire));
			last_fire_type = primary;
			weapon_state = "firing";
			
		}
	
		//Secondary Fire
		else if(o_InputController.secondary_fire_pressed[creator.player] || (o_InputController.secondary_fire[creator.player] && get_weapon_stat(weapon_slot[current_weapon_slot], secondary_firing_mode) == full_auto)){
			o_GameController.create_arge[0] = id;
			muzzle_flash = instance_create_depth(x, y, depth - 1, o_MuzzleFlash);
			script_execute(get_weapon_script(weapon_slot[current_weapon_slot], weapon_script_secondary_fire));
			last_fire_type = secondary;
			weapon_state = "firing";
		}
		
		//Switch Weapon
		if(o_InputController.switch_weapons[creator.player]){
			if(current_weapon_slot == 1) current_weapon_slot = 2;
			else current_weapon_slot = 1;
			weapon_state = "entry";
		}
	
		//Reloading
		if(o_InputController.reload[creator.player] && ammo_current[current_weapon_slot] < get_weapon_stat(weapon_slot[current_weapon_slot], ammo_capacity)){
			weapon_state = "reloading";	
			reloading[current_weapon_slot] = true;
		}
		
		
	break;
	#endregion	
	
	#region "firing" State
	case "firing":
		
		//Set to firing sprite
		set_sprite(get_weapon_sprite(weapon_slot[current_weapon_slot], weapon_sprite_primary_fire));
		
		//Determine Fire Rate Reference
		var fire_rate_reference;
		if(last_fire_type == primary) fire_rate_reference = get_weapon_stat(weapon_slot[current_weapon_slot], primary_fire_rate);
		else fire_rate_reference = get_weapon_stat(weapon_slot[current_weapon_slot], secondary_fire_rate);
		
		//Play animation
		var animation_speed = sprite_get_number(sprite_index) / fire_rate_reference;
		animation_speed += (animation_speed * creator.fire_rate);
		image_index = approach(image_index, sprite_get_number(sprite_index) - 1, animation_speed);
		
		
		//Firing Script
		var firing_script;
		if(last_fire_type == primary) firing_script = get_weapon_script(weapon_slot[current_weapon_slot], weapon_script_primary_firing);
		else if(last_fire_type == secondary) firing_script = get_weapon_script(weapon_slot[current_weapon_slot], weapon_script_secondary_firing);
		if(!is_undefined(firing_script) && firing_script != -1) script_execute(firing_script); 
		
		
		//On animation finished
		if(animation_finished()){
			
			//If ammo is remaining
			if(ammo_current[current_weapon_slot] > 0){
				weapon_state = "idle";	
			}
			
			//If out of ammo
			else {
				reloading[current_weapon_slot] = true;
				weapon_state = "reloading";
			}
				
		}
		
	break;
	#endregion
	
	#region "reloading" State
	case "reloading":
		
		//Set to reloding sprite
		set_sprite(get_weapon_sprite(weapon_slot[current_weapon_slot], weapon_sprite_reload));
		
		//Play animation
		var animation_speed = (sprite_get_number(sprite_index) / get_weapon_stat(weapon_slot[current_weapon_slot], reload_speed));
		animation_speed += (animation_speed * creator.reloading_speed);
		image_index = approach(image_index, sprite_get_number(sprite_index) - 1, animation_speed);
		
		//On reload finished
		if(animation_finished()){
			ammo_current[current_weapon_slot] = get_weapon_stat(weapon_slot[current_weapon_slot], ammo_capacity);
			reloading[current_weapon_slot] = false;
			weapon_state = "idle";
		}
		
		//Switch Weapon
		if(o_InputController.switch_weapons[creator.player]){
			if(current_weapon_slot == 1) current_weapon_slot = 2;
			else current_weapon_slot = 1;
			weapon_state = "entry";
		}
		
		//Reloading Script
		var reload_script = get_weapon_script(weapon_slot[current_weapon_slot], weapon_script_reload);
		if(!is_undefined(reload_script) && reload_script != -1) script_execute(reload_script); 
	
	
	break;
	
	#endregion
	
	#region "rolling" State
	case "rolling":
	
		image_alpha = 0;
		if(creator.state != "rolling"){
			image_alpha = 1;
			weapon_state = "readying";
		}
		
	break;
	#endregion
	
}

//Constant Behviour Scripts
var behavior_script = get_weapon_script(weapon_slot[current_weapon_slot], weapon_script_constant_behavior);
if(!is_undefined(behavior_script) && behavior_script != -1) script_execute(behavior_script); 


//Update Depth
depth = creator.depth - 1;







