///@description inflict_damage(damage_value, target)
///@param damage_value
///@param target
function inflict_damage(argument0, argument1) {

	var damage_value = argument0;
	var target = argument1;

	if(instance_exists(target)){
		target.hp -= damage_value;
	}


}
