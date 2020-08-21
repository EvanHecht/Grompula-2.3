//Move
x += lengthdir_x(blood_speed, blood_angle);
y += lengthdir_y(blood_speed, blood_angle);
var distance_percentage = 1 - point_distance(x, y, start_x, start_y)/blood_distance;
image_xscale = max(0, distance_percentage); 
image_yscale = max(0, distance_percentage);

if(image_xscale == 0){
	instance_destroy();
}