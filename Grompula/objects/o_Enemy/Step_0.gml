//Hit flash
if(is_hit){
	hit_flash_timer = approach(hit_flash_timer, 0, 1);
	if(hit_flash_timer == 0) is_hit = false;
} else {
	hit_flash_timer = hit_flash_duration;	
}