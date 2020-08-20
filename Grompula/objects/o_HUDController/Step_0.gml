//Healthbar Delayed display
for(var i = 1; i <= o_GameController.current_number_of_players; i++){
		
	var current_player = scr_get_player(i);
	healthbar_delayed_value[i - 1] = approach(healthbar_delayed_value[i - 1], current_player.hp, healthbar_delayed_speed);
		
}