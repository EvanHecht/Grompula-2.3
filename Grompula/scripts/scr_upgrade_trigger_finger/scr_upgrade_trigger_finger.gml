/// @description scr_upgrade_trigger_finger(target_player)
/// @param target_player
function scr_upgrade_trigger_finger(target_player) {

	//Determine how much to increase fire rate by
	var increase_factor = .25;
	var increase_amount = get_player_stat_base_value("fire rate", target_player.player) * increase_factor;


	//Increase target player's fire rate
	modify_player_stat("fire rate", target_player.player, increase_amount);

}
