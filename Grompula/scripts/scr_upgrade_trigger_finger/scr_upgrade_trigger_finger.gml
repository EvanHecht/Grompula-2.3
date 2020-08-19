/// @description scr_upgrade_trigger_finger(target_player)
/// @param target_player
function scr_upgrade_trigger_finger(argument0) {

	//Retrieve the player to apply the upgrade to
	var target_player = argument0;

	//Calculate the amount the movment speed should increase
	var increase_factor = .25;

	//Increase the target player's movement speed
	target_player.stat_fire_rate += increase_factor;



}
