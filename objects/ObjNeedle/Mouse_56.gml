if controller_obj.portNum == 29
{
	if (ObjPlayer.can_needle == true)
	{
		ObjPlayer.can_needle = false;
		ObjPlayer.alarm[4] = ObjPlayer.needle_cd;
		PlayerAttack()
	}
}
