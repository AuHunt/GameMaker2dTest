// Key Checking
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"));

// Motion Setting
move = key_right - key_left; // Left = -1; Right = 1; Makes the direction
hsp = move * walksp; // Direction * Speed

if (vsp < 50) { vsp += grv; } // Fall speed limit

// Collision Checking
if (place_meeting(x, y+1, obj_walls)) { // Collision to walls below character
	vsp = key_jump * -jumpsp;
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = spr_playerIdle;
	}
	else { 
		sprite_index = spr_playerWalk;
	}
}
if (place_meeting(x + hsp, y, obj_walls)) { // Horizontal collision
	while ( !place_meeting(x + sign(hsp), y, obj_walls)) { // While not colliding with the walls
		x += sign(hsp);
	}
	hsp = 0;
}	
if (place_meeting(x, y + vsp, obj_walls)) { // Vertical collision
	while ( !place_meeting(x, y + sign(vsp), obj_walls)) { // While not colliding with the ceiling or floor
		y += sign(vsp);
	}
	vsp = 0;
}	

// Coordination Changes
x += hsp;
y += vsp;

//obj_gun.x = x+9;
//obj_gun.y = y+8;

// Animation Specifics
if (!place_meeting(x, y+1, obj_walls)) { // While mid-air
	sprite_index = spr_playerAir;
	image_speed = 0;
	if (sign(vsp) > 0) { //If y-coordinate is increasing (falling)
		image_index = 0;
	}
	else { image_index = 1; }
}

if (hsp != 0) { image_xscale = sign(hsp); }