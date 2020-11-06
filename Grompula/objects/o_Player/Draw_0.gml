//Set Player Shader Color
shader_set_safe(shdr_player);
var myColor = o_GameController.player_color[player];
var in_value = shader_get_uniform(shdr_player, "in_Colour");
show_debug_message("RGB: " + string(color_get_red(myColor)) + " " + string(color_get_green(myColor)) + " " + string(color_get_blue(myColor)));
shader_set_uniform_f(in_value, color_get_red(myColor), color_get_green(myColor), color_get_blue(myColor), 0.0);

//show_debug_message(is_numeric(color_get_green(myColor)));
draw_self();
shader_reset();

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


