view_enabled = true;
view_visible[0] = true;
#macro camera view_camera[0]



//Define Aspect Ratio
aspect_ratio[1] = 16;
aspect_ratio[2] = 9;

//Camera Scale
camera_scale = 120;
camera_width = camera_scale * aspect_ratio[1];
camera_height = camera_scale * aspect_ratio[2];
camera_set_view_size(camera,camera_width, camera_height);
camera_minimum_scale = 90;
multiplayer_camera_margin = 700;
camera_zoom_speed = .05;

//Screen Shake
screen_shake_horizontal = 0;
screen_shake_vertical = 0;
screen_shake_decrement_speed = 1;

//Camera Movement
camera_pan_speed = .1;
single_player_aim_offset = 200;

//Define Camera Mode
camera_mode = "";
if(o_GameController.current_number_of_players == 1) camera_mode = "single";
else camera_mode = "multi";

//Camera Target(s)
camera_target[1] = -1;
camera_target[2] = -1;
camera_target[3] = -1;
camera_target[4] = -1;

// Cutscene camera targets
camera_cutscene_target[1] = -1

for(var i = 0; i < instance_number(o_Player); i++){
	current_target = instance_find(o_Player, i);
	camera_target[current_target.player] = current_target;
}

