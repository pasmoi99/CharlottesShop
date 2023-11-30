/// @description Insert description here
// You can write your code in this editor
if controller_obj.portNum == 29
{
	if (ObjPlayer.can_scissor == true)
	{
		instance_create_depth(ObjPlayer.x + difx*arc_dist , ObjPlayer.y + dify*arc_dist ,depth, ObjArc);
		ObjPlayer.can_scissor = false;
		ObjPlayer.alarm[11] = ObjPlayer.scissor_cd;
	}
}