/// @description scr_upgrade_dexterity(target_player)
/// @param target_player
function scr_upgrade_dexterity(target_player) {

	//Determine how much to increase reload speed by
	var increase_factor = .25;
	var increase_amount = get_player_stat_base_value("reloading speed", target_player.player) * increase_factor;


	//Increase target player's reload speed
	modify_player_stat("reloading speed", target_player.player, increase_amount);

}
