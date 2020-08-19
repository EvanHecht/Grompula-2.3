

switch(state){
	
	#region Spawn state
	case "spawn":
	
		set_sprite(spr_glyph_spawn);
		if(animation_finished()){
			state = "active";	
		}
	
	break;
	#endregion
	
	#region Active State
	case "active":
		
		//Set the sprite
		set_sprite(spr_glyph);
		
		//Set depth
		depth = -y;
	
		//Check if players are close enough to interact
		player_in_range = false;
		for(var i = 1; i <= o_GameController.current_number_of_players; i++){
	
			var current_player = scr_get_player(i);
	
			//If a player is close enough
			if(point_distance(x, y, current_player.x, current_player.y) <= interaction_range){
		
				//Indicate that the player is in range
				player_in_range = true;
		
				//Player purchasing
				if(!purchased && o_InputController.select[i] && current_player.soul_count >= cost){
					current_player.soul_count -= cost;
					purchasing_player = current_player;
					purchased = true;
					state = "purchased";
				}
		
			}

		}
	
	break;
	#endregion
	
	#region Purchased
	case "purchased":
	
	//Switch to new sprite
	image_speed = 0;
	if(!shifted){
		shifted = true;	
		y -= 67;
	}
	set_sprite(spr_glyph_purchased);
	
	switch(glyph_type){
	
		//Weapon Glyph
		case 1:
			
			//Determine which gun to spawn
			var gun_to_drop = ds_list_find_value(global.weapon_list, irandom(ds_list_size(global.weapon_list) - 1));
			
			//Create the gun object
			o_GameController.create_args[0] = gun_to_drop;
			instance_create_depth(x, y, -y, o_WeaponPickup);
		
		break;
	
		//Health Glyph
		case 2:
		
			var heal_amount = 3;
		
			//Heal Player
			purchasing_player.hp = approach(purchasing_player.hp, purchasing_player.stat_hp, heal_amount); 
		
		break;
	}
	
	//Switch state to fade
	state = "fade";
	
	break;
	#endregion
	
	#region Fade
	case "fade":
	
	//Do animation
	if(fade_phase == 1){
		image_index = approach(image_index, sprite_get_number(sprite_index) - 1, .5);
		if(image_index == sprite_get_number(sprite_index) - 1) fade_phase = 2;
	}
	
	//Grow
	else if(fade_phase == 2){
		
		image_xscale = approach(image_xscale, 1.25, .01);
		image_yscale = approach(image_yscale, 1.25, .01);
		image_angle += 5;
		
		if(image_xscale == 1.25){
			fade_phase = 3;	
		}
	}
	
	//Spin Out
	else if(fade_phase == 3){
		
		image_xscale = approach(image_xscale, 0, .07);
		image_yscale = approach(image_yscale, 0, .07);
		image_angle -= 20;
		
		if(image_xscale == 0){
			instance_destroy();
		}
	}





	break;
	#endregion
	
}