draw_self()

#region Debug Info

// Turn off debug info by switching to false
if(false) {
	
// Set canvas/font
draw_set_colour(c_white);
draw_rectangle(x-60, y-200, x+60, y-120, false);
draw_set_colour(c_black);
draw_set_font(fnt_Debug);

// HP
draw_text(x-55, y-195, "HP: " + string(hp));

// Souls
draw_text(x-55, y-180, "Souls: " + "null");

// Weapon
draw_text(x-55, y-155, "Current: " + get_weapon_stat(player_weapon.weapon_slot[player_weapon.current_weapon_slot], weapon_name))

// Ammo
draw_text(x-55, y-135, "Ammo: " + string(player_weapon.ammo_current[player_weapon.current_weapon_slot]) + "/" + string(player_weapon.ammo_max[player_weapon.current_weapon_slot]));

}
#endregion


