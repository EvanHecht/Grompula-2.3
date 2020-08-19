/// @description scr_upgrade_dexterity(target_player)
/// @param target_player
function scr_upgrade_dexterity(argument0) {

	//Retrieve the player to apply the upgrade to
	var target_player = argument0;

	//Determine how much to increase reload speed by
	var increase_factor = .25;

	//Increase target player's reload speed
	target_player.stat_reloading_speed += increase_factor;


}
