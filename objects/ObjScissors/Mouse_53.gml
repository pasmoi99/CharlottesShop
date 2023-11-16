/// @description Insert description here
// You can write your code in this editor
if controller_obj.portNum == 29
{
	if (ObjPlayer.can_scissor == true)
	{
		instance_create_depth(x + difx*2 , y + dify*2 ,depth, ObjArc);
		ObjPlayer.can_scissor = false;
		ObjPlayer.alarm[11] = ObjPlayer.scissor_cd;
	}
}