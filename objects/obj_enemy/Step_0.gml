if (vsp < 50) { vsp += grv; } // Fall speed limit

// Collision Checking
if (place_meeting(x, y+1, obj_walls)) { // Collision to walls below character
	vsp = key_jump * -jumpsp;
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = spr_enemyIdle;
	}
	else { 
		sprite_index = spr_enemyWalk;
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

// Animation Specifics
if (!place_meeting(x, y+1, obj_walls)) { // While mid-air
	sprite_index = spr_enemyAir;
	image_speed = 0;
	if (sign(vsp) > 0) { //If y-coordinate is increasing (falling)
		image_index = 0;
	}
	else { image_index = 1; }
}

if (hsp != 0) { image_xscale = sign(hsp); }