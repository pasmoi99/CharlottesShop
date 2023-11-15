//draw_self();
//draw_sprite_ext(controllerCursor_spr, 0, x, y, 1, 1, angleCursor, c_white, 1);


//DEBUG
if debug
{
	draw_text(20,20, "portNum : "+string(portNum));
	draw_text(20,40, "haxis : "+string(haxis));
	draw_text(20,60, "vaxis : "+string(vaxis));
	draw_text(20,80, "haxis : "+string(hcursor));
	draw_text(20,100, "vaxis : "+string(vcursor));
	draw_text(20,120, "bttu : "+string(bttu));
	draw_text(20,140, "bttd : "+string(bttd));
	draw_text(20,160, "bttl : "+string(bttl));
	draw_text(20,180, "bttr : "+string(bttr));
	draw_text(20,200, "shoulderl : "+string(shoulderl));
	draw_text(20,220, "shoulderlb : "+string(shoulderlb));
	draw_text(20,240, "shoulderr : "+string(shoulderr));
	draw_text(20,260, "shoulderrb : "+string(shoulderrb));
	draw_text(20,280, "select : "+string(select));
	draw_text(20,300, "start : "+string(start));
	draw_text(20,320, "stickl : "+string(stickl));
	draw_text(20,340, "stickr : "+string(stickr));
}
