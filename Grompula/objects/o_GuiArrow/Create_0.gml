dir = o_GameController.create_args[0];
scale = o_GameController.create_args[1];

image_xscale = scale;
image_yscale = abs(scale);

if(dir == "right") image_xscale = 1;
else if(dir == "left") image_xscale = -1;

activated = false;