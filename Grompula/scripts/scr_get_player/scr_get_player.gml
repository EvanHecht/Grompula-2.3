function scr_get_player(argument0) {
	//The player number to get 1-4
	var desired_player_number = argument0;

	//Loop through all players and return the object with the desired player number
	for(var i = 0; i < instance_number(o_Player); i++){
	
		var current_object = instance_find(o_Player, i);
		if(current_object.player == desired_player_number) return current_object;
	
	}

	//If that player doesnt exist, return "noone"
	return noone;


}
