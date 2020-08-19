// --[UPGRADES]--
upgrade_list = ds_list_create();
tier_1_upgrade_list = ds_list_create();

var upgrade_title;
var upgrade_description;
var upgrade_script;
var upgrade_definition;

#region Tier 1 Upgrades

//Dexterity - Increase reload speed by 20%
upgrade_title = "Dexterity";
upgrade_description = "Increase reload speed by 25%";
upgrade_script = scr_upgrade_dexterity;
upgrade_definition = scr_upgrade_define(upgrade_title, upgrade_description, upgrade_script);
ds_list_add(tier_1_upgrade_list, upgrade_definition);

//Agility - Increase movement speed by 20%
upgrade_title = "Agility";
upgrade_description = "Increase movement speed by 25%";
upgrade_script = scr_upgrade_agility;
upgrade_definition = scr_upgrade_define(upgrade_title, upgrade_description, upgrade_script);
ds_list_add(tier_1_upgrade_list, upgrade_definition);


//Trigger Finger - Increase fire rate by 20%
upgrade_title = "Trigger Finger";
upgrade_description = "Increase fire rate by 25%";
upgrade_script = scr_upgrade_trigger_finger;
upgrade_definition = scr_upgrade_define(upgrade_title, upgrade_description, upgrade_script);
ds_list_add(tier_1_upgrade_list, upgrade_definition);

//Add all tier 1 upgrades to upgrade list
ds_list_add_list(upgrade_list, tier_1_upgrade_list);

#endregion

//Functional Variables
state = "inactive"
current_panel_selection = 1;
current_player_selecting = 1;
initialized_upgrade_for_player = false;

#region Paramaters for the upgrade selection

//Drawing Specifications
panel_vertical_margin = display_get_gui_height()/4; //Distance from top/bottom of screen
panel_height = display_get_gui_height() - (panel_vertical_margin * 2);
panel_width = panel_height;
panel_spacing = panel_width/3;
panel_move_speed = .25;
panel_actual_draw_x = (display_get_gui_width()/2) - (panel_width/2) - ((current_panel_selection - 1) * (panel_width + panel_spacing));
panel_actual_draw_y = panel_vertical_margin;

banner_draw_x = display_get_gui_width()/2;
banner_draw_y = 200;


//This list holds the upgrades currently being offered
current_upgrade_offer_list = ds_list_create();



#endregion

