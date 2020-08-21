creator = o_GameController.create_args[0]
bite_y_offset = creator.sprite_height/2 - 15; // Puts y in center of Grompuloid

bite_x = lengthdir_x(30, point_direction(x,y,creator.current_target.x,creator.current_target.y))
bite_y = lengthdir_y(20, point_direction(x,y,creator.current_target.x,creator.current_target.y))

x = creator.x + bite_x;
y = creator.y - bite_y_offset + bite_y;
image_xscale = creator.image_xscale;

attacked = false;
attack_frame = 6
