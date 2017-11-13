x = obj_player.x+5;
y = obj_player.y+5;

image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay -= 1;
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left) && (firingdelay < 0)) {
	firingdelay = 7;
	recoil = 5;
	audio_play_sound(sfx_shotgunBlast, 0, 0);
	with (instance_create_layer(x, y, "Bullets", obj_bullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-2, 2);
		image_angle = direction;		
	}
	with (instance_create_layer(x, y, "Bullets", obj_bullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-7, 7);
		image_angle = direction;		
	}
	with (instance_create_layer(x, y, "Bullets", obj_bullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-7, 7);
		image_angle = direction;		
	}
}

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

if ((image_angle > 90) && (image_angle < 270)) {
	image_yscale = -1;	
}
else { image_yscale = 1; }