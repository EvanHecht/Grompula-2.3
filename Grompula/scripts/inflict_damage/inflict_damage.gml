///@description inflict_damage(damage_value, target)
///@param damage_value
///@param target
function inflict_damage(argument0, argument1) {

	var damage_value = argument0;
	var target = argument1;
	show_debug_message("bruv")

	if(instance_exists(target)){
		target.hp -= damage_value;
		
		//Trigger hit flash & blood
		if(object_get_parent(target.object_index) == o_Enemy){
			
			//Hit flash
			target.is_hit = true;
			target.hit_flash_timer = target.hit_flash_duration;
			
			//Blood
			var number_of_blood = irandom_range(3, 6);
			for(var i = 0; i < number_of_blood; i++){
				instance_create_depth(target.center_x, target.center_y, -target.center_y - 1, o_EnemyBlood);
			}
			
		}
		
	}


}
