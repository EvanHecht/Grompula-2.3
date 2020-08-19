///@description set_weapon(player_obj, weapon, weapon_slot("current"or"backup"))
///@param player_obj The id of the player to modify
///@param weapon the weapon to switch it to
///@param weapon_slot("current"or"backup")
function set_weapon(argument0, argument1, argument2) {

	/* NOTE
	"current" will set the weapon to the slot the player is currently using.
	"backup" will set the weapon to the slot the player isnt currently using.
	*/

	var player = argument0;
	var weapon = argument1;
	var weapon_slot = argument2;

	//Error check
	if(weapon_slot != "current" && weapon_slot != "backup"){
		show_error("Invalid Weapon slot", true);	
		return;
	}

	//Determine the correct weapon slot
	var current_weapon_slot = player.player_weapon.current_weapon_slot;
	if(weapon_slot == "current") weapon_slot = current_weapon_slot;
	else{
	
		if(current_weapon_slot == 1) weapon_slot = 2;
		else weapon_slot = 1;
	}

	//Set Weapon and stats accordingly
	var player_weapon = player.player_weapon;
	player_weapon.weapon_slot[weapon_slot] = weapon;
	var ammo = get_weapon_stat(weapon, ammo_capacity);
	player_weapon.ammo_current[weapon_slot] = ammo;
	player_weapon.ammo_max[weapon_slot] = ammo;
	player_weapon.weapon_state = "readying";




}
