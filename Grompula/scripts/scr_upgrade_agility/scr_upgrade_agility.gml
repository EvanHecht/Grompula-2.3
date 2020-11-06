/// @description scr_upgrade_agility(target_player)
/// @param target_player
function scr_upgrade_agility(target_player) {

	//Calculate the amount the movment speed should increase
	var increase_factor = .25;
	var increase_amount = get_player_stat_base_value("movement speed", target_player.player) * increase_factor;

	//Increase the target player's movement speed
	modify_player_stat("movement speed", target_player.player, increase_amount);

}
