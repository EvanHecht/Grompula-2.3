///@description set_shader_safe(shader)
///@param shader
function shader_set_safe(shader){

	//Make sure shader is compiled befoe using it
	if(shader_is_compiled(shader)){
		shader_set(shader);
	} else {
		show_debug_message("Attempting to use shader that is not compiled yet.");	
	}

}

