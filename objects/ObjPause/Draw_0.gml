if (GamePause)
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle( view_xport[0], view_yport[0], view_xport[0]+view_wport[0], view_yport[0]+view_hport[0], 0);
	draw_set_halign(fa_center);
	
	/*draw_set_font(Font1);
	draw_set_color(#a7d6ff);
	draw_set_halign(fa_center);
	draw_text( (view_xport[0]+view_wport[0])/2, (view_yport[0]+view_hport[0])/6, "Game Paused");
	
	draw_set_font(Font1);
	draw_set_halign(fa_center);
	draw_set_color(c_gray);
	draw_text((view_xport[0]+view_wport[0])/2, (view_yport[0]+view_hport[0])/2, "(Press escape to resume)");*/
	
	//if !instance_exists(ObjButtonResume)
	//{
	//	instance_create_depth( view_xport[0]+view_wport[0]/2, view_yport[0]+view_hport[0]/2 , -100, ObjButtonResume);
	
	//	instance_create_depth( xport+wport/2, yport+hport/2, -100, ObjBtnQuit);
	
	//}
}

//(view_xport[0]+view_wport[0])/2, (view_yport[0]+view_hport[0])/3
//(view_xport[0]+view_wport[0])/2, (view_yport[0]+view_hport[0])/0.33


if (!GamePause)
{
	draw_set_alpha(1);
}
