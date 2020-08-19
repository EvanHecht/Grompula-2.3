/// @description scr_upgrade_agility(target_player)
/// @param target_player
function scr_upgrade_agility(argument0) {

	//Retrieve the player to apply the upgrade to
	var target_player = argument0;

	//Calculate the amount the movment speed should increase
	var increase_factor = .25;
	var movement_speed_increase_amount = target_player.stat_movement_speed * increase_factor;

	//Increase the target player's movement speed
	target_player.stat_movement_speed += movement_speed_increase_amount;



}
