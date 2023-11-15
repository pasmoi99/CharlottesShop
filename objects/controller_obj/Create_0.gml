angleCursor = 0

debug = true

for (i = 0 ; i < 30 ; i++)
{
	portNum = i;
	if gamepad_is_connected(i)
	{
		break;
	}
}
