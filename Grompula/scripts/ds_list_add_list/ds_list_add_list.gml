/// @description ds_list_add_list(target_list, source_list)
/// @param target_list
/// @param source_list
function ds_list_add_list(argument0, argument1) {
	/*
	 * Populates the target list with all elements fromt he source list added to it
	 */
 
	var target_list = argument0;
	var source_list = argument1;

	//Loop through the source list and add all of its contents to the target list
	for(var i = 0; i < ds_list_size(source_list); i++){
	
		var current_element_to_add = ds_list_find_value(source_list, i);
		ds_list_add(target_list, current_element_to_add);
	
	}




}
