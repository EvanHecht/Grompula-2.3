// Health Bar Info, will be moved elsewhere to make more dynamic later
pic_width = 128;
pic_height = 128;
hb_width = 300;
hb_height = 20;

pic_offset = 100;
pic_x = pic_offset - pic_width/2;
pic_x2 = display_get_gui_width()/4 - pic_width/2 + pic_offset;
pic_x3 = display_get_gui_width()/2 - pic_width/2 + pic_offset;
pic_x4 = (display_get_gui_width() * .75) - pic_width/2 + pic_offset;

pic_y = 100 - pic_height/2;
hb_x = 160;
hb_y = 75;