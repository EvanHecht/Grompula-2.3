//Populate the map list
map_data = function(_map_name, _map_room) constructor {
	map_name = _map_name;
	map_room = _map_room;
}

map_selection_index = 0;
map_list = ds_list_create();
ds_list_add(map_list, new map_data("Crystal Isle", room_Crystal_Island));
ds_list_add(map_list, new map_data("Crystal Isle 2", room_Crystal_Island));
ds_list_add(map_list, new map_data("Crystal Isle 3", room_Crystal_Island));

//selected_map_data = ds_list_find_value(map_list, map_selection_index);
//selected_map_name = selected_map_data.map_name;