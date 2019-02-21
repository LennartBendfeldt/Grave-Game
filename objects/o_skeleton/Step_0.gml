//Movement

switch(state){
	
	case "move":
	
		#region Move State
		if(keyboard_check(vk_right)) and not place_meeting(x + 4, y, o_wall){
	
			sprite_index = s_skeleton_run;
			x = x + 1.5;
			image_xscale = 1;
			image_speed = 0.6;
		}

		if(keyboard_check(vk_left)) and not place_meeting(x - 4, y, o_wall){

			sprite_index = s_skeleton_run;
			x = x - 1.5;
			image_xscale = -1;
			image_speed = 0.6;
		}

		if not (keyboard_check(vk_right)) 
		and not (keyboard_check(vk_left)){

			sprite_index = s_skeleton_idle;
			image_speed = 0.4;
		}

		if(keyboard_check_pressed(vk_space) and not(place_meeting(x + 4, y, o_wall) or place_meeting(x - 4, y, o_wall))){
		
			image_index = 0;
			state = "roll";
		}
		
		#endregion
		break;
		
	case "roll":
	
		#region Roll State
	
		sprite_index = s_skeleton_roll;
		image_speed = 0.6;
	
		if(image_xscale == 1) and not(place_meeting(x + 4, y, o_wall)){
	
			x += 1.8;
		}
	
		if(image_xscale == -1) and not(place_meeting(x - 4, y, o_wall)){
	
			x -= 1.8;
		}
		#endregion
		break;
}