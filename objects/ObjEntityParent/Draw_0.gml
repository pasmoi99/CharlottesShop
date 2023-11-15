if show_dash_up -- > 0
{
		//draw feedback for dash up
		gpu_set_fog(true, c_white, 0, 1);
		draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, 1);
		gpu_set_fog(false, c_white, 0, 1);
}	

else
{
	draw_sprite_ext(SprPlayer, image_index, x, y, facing, 1, 0, c_white, 1);
}


draw_text(x, y, state);
