//Set Player Shader Color
shader_set_safe(shdr_player_hand);
var myColor = o_GameController.player_color[creator.player];
var in_value = shader_get_uniform(shdr_player, "in_Colour");
show_debug_message("RGB: " + string(color_get_red(myColor)) + " " + string(color_get_green(myColor)) + " " + string(color_get_blue(myColor)));
shader_set_uniform_f(in_value, color_get_red(myColor), color_get_green(myColor), color_get_blue(myColor), 0);

draw_self();
shader_reset();