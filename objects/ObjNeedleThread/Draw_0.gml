/// @description Insert description here
// You can write your code in this editor
if (instance_exists(ObjPlayer))
{
	if (instance_exists(ObjNeedle))
	{
		draw_line_width_color(ObjNeedle.x,ObjNeedle.y,ObjPlayer.x,ObjPlayer.y,2,c_red,c_red);
	}

	if (instance_exists(ObjNeedleThrown))
	{
		draw_line_width_color(ObjNeedleThrown.x,ObjNeedleThrown.y,ObjPlayer.x,ObjPlayer.y,2,c_red,c_red);
	}

	if (instance_exists(ObjNeedleBack))
	{
		draw_line_width_color(ObjNeedleBack.x,ObjNeedleBack.y,ObjPlayer.x,ObjPlayer.y,2,c_red,c_red);
	}
}