#region Normalize Player Stats

//Decrement environmental damage timer
environmental_damage_timer--;

#endregion

//Player State Machine
switch(state){
	
#region Idle State
case "idle":

	//Check if wanting to move
	var player_moving = o_InputController.move_horizontal[player] != 0 || o_InputController.move_vertical[player] != 0;
	if(player_moving){
		state = "moving";
		scr_player_movement();
	}
	
	//Aim the weapon
	scr_player_aim();
	
	//Animate the player
	set_sprite(spr_player_idle);
	image_speed = 0;
	image_xscale = abs(image_xscale) * direction_facing;
	
break;
#endregion


#region Moving State
case "moving":

	//Check if wanting to move
	var player_moving = o_InputController.move_horizontal[player] != 0 || o_InputController.move_vertical[player] != 0;
	if(!player_moving){
		state = "idle";
	} else scr_player_movement();
	
	//Check if wanting to roll
	if(o_InputController.character_action[player]){
		state = "rolling";
		player_weapon.weapon_state = "rolling";
	}
	
	//Aim the weapon
	scr_player_aim();
	
	//Animate the player
	set_sprite(spr_player_moving);
	var movement_animation_speed = movement_speed/4;
	image_speed = movement_animation_speed;
	if(direction_facing != direction_moving_horizontal) image_speed = -abs(image_speed);
	image_xscale = abs(image_xscale) * direction_facing;
	
	
break;
#endregion


#region Rolling State
case "rolling":

//Animate Player
set_sprite(spr_player_rolling);
image_speed = 1;


//Make Player Roll
if(animation_finished()){
	state = "moving";	
} else scr_player_rolling()
	


break;
#endregion

}


//iframes
if(iframes > 0){
	invincible = true;
	
	if(iframes mod 5 == 0){
		invinciblility_flashing = !invinciblility_flashing;
		if(invinciblility_flashing) image_alpha = 0;
		else image_alpha = 1;
	}
} else {
	invincible = false;	
	image_alpha = 1;
}
iframes = approach(iframes, 0, 1);



//Update Center Variables
center_x = x;
center_y = y - 45;

//Assign Depth
depth = -y;


//Death
if(hp <= 0){
	game_end();	
}
