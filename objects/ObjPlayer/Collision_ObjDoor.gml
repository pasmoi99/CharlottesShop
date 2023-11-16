if (ObjDoor.is_open == false)
{
	CollisionDoor();
}

else
{
	if (ObjDoor.image_alpha > 0.7)
	{
		ObjDoor.image_alpha -= 0.025;
	}
}