function scr_upgrade_define(argument0, argument1, argument2) {
	//Get the data corresponding to upgrade being created
	var upgrade_name = argument0;
	var upgrade_description = argument1;
	var upgrade_script = argument2;

	//Assign said data to the creation arguments
	o_GameController.create_args[0] = upgrade_name;
	o_GameController.create_args[1] = upgrade_description;
	o_GameController.create_args[2] = upgrade_script;

	//Create and return the data
	return instance_create_depth(0, 0, 0, o_UpgradeDefinition);


}
