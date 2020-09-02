//Draw all of the falling grompuloids
for(var i = 0; i < ds_list_size(falling_grompuloid_list); i++){

	//cfg = current_falling_grompulod
	var cfg = ds_list_find_value(falling_grompuloid_list, i);
	draw_sprite_ext(cfg.sprite, cfg.sprite_frame, cfg.falling_x, cfg.falling_y, cfg.xscale, cfg.yscale, cfg.falling_direction - 90, c_white, 1);

}