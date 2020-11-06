// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clicked(){

	return place_meeting(x, y, o_Cursor) && (o_InputController.select_pressed[1] || mouse_check_button_pressed(mb_left));

}

/// shader_set_uniform_color(uniform,color,alpha)
//
//  Sets a vec4 shader uniform with a color and alpha value.
//
//      uniform     shader uniform handle, integer
//      color       standard GM color value, integer
//      alpha       alpha in [0,1] range, real
//
/// GMLscripts.com/license
function set_uniform(uniform, color, alpha){
    shader_set_uniform_f(uniform, 
                         color_get_red(color) / 255, 
                         color_get_green(color) / 255,
                         color_get_blue(color) / 255,
                         alpha);
    return 0;
}