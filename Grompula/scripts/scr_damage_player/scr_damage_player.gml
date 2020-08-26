/// @description scr_damage_player(dmg, player, ignore_invincibility, on_hit_function)
/// @param dmg	amount of damage to deal to player
/// @param player	which player to deal damage to
/// @param ignore_invincibility	boolean to determine to ignore invincibility
///	@param on_hit_function	function to call when player is hit (put -1 if no function)
function scr_damage_player(argument0, argument1, argument2, argument3) {

	var dmg = argument0;
	var player = argument1;
	var ignore_invincibility = argument2;
	var on_hit_function = argument3;

	//Screen shake amount when hit
	var screen_shake_amount = 30;

	// Check that player is an actual player object, if not print error and leave script
	if(player.object_index != o_Player) {
		show_error("scr_damage_player was used on a non-player object", false);
	}


	var player_invincible = player.invincible;

	// Deal damage to the player
	if(!player_invincible || (player_invincible && ignore_invincibility == true)) {
		if(on_hit_function != -1) script_execute(on_hit_function)
		player.hp -= dmg;
		player.iframes = player.stat_iframes;
		screen_shake_add_until_limit(screen_shake_amount, screen_shake_amount, screen_shake_amount, screen_shake_amount);
	}






}
