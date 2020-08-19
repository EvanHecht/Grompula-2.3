//Create the grid
cell_size = 32;
room_grid = mp_grid_create(0, 0, room_width/cell_size, room_height/cell_size, cell_size, cell_size);

//Pathfinding Obstacles
mp_grid_add_instances(room_grid, o_Collision, false);