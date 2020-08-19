/// @desc Health Bar

// Health Bar info will be moved in future once done with testing to make more dynamic
draw_sprite(spr_player_picture,0,pic_x,pic_y);
//draw_sprite(spr_player_picture,0,pic_x2,pic_y);
//draw_sprite(spr_player_picture,0,pic_x3,pic_y);
//draw_sprite(spr_player_picture,0,pic_x4,pic_y);

draw_sprite(o_PlayerWeapon.sprite_index, o_PlayerWeapon.image_index,pic_x+100,pic_y+100);

draw_text(pic_x+150,pic_y+120,string(o_PlayerWeapon.ammo_current[o_PlayerWeapon.current_weapon_slot]) + " / " + string(o_PlayerWeapon.ammo_max[o_PlayerWeapon.current_weapon_slot]));

draw_sprite(spr_healthbar_container_back,0,hb_x,hb_y);
draw_sprite_stretched(spr_healthbar,0,hb_x,hb_y+8,(o_Player.hp/5)*hb_width,hb_height);
draw_sprite(spr_healthbar_container,0,hb_x,hb_y);

if (false) {
for(i = 0; i <= display_get_gui_width(); i+=50) {
	draw_line(i,0,i,display_get_gui_height())
	draw_text(i+10,display_get_gui_height()/4,string(i))
}

for(i = 0; i <= display_get_gui_height(); i+=50) {
	draw_line(0,i,display_get_gui_width(),i)
	draw_text(display_get_gui_width()/4,i+10,string(i))
}
}
