//Create selectors
selector_offset = 200 * image_xscale;
o_GameController.create_args[0] = "left";
o_GameController.create_args[1] = image_xscale;
left_selector = instance_create_depth(x - selector_offset, y, depth, o_GuiArrow);
o_GameController.create_args[0] = "right";
right_selector = instance_create_depth(x + selector_offset, y, depth, o_GuiArrow);
