if (GamePause)
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle( 0, 0, room_width, room_height, 0);
	draw_set_halign(fa_center)
	
	draw_set_font(Font1);
	draw_set_color(#a7d6ff);
	draw_set_halign(fa_center);
	draw_text(room_width/10, room_height/5, "Game Paused");
	
	draw_set_font(Font1);
	draw_set_halign(fa_center);
	draw_set_color(c_gray);
	draw_text(room_width/4, room_height/3.4, "(Press echap to resume)");
	
	if !instance_exists(ObjButtonResume)
	{
		instance_create_depth( 50, 280, -100, ObjButtonResume);
		instance_create_depth( 150, 450, -100, ObjBtnQuit);
	}
}

if (!GamePause)
{
	instance_destroy(ObjButtonResume);
	instance_destroy(ObjBtnQuit);
}
