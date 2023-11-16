if (instance_exists(ObjPlayer))
{
	x = ObjPlayer.x;
	y = ObjPlayer.y;
}

// CHECK PORTS
for (i = 0 ; i < 30 ; i++)
{
	portNum = i;
	if gamepad_is_connected(i)
	{
		break;
	}
}


// MOVEMENT INPUT
// Directional cross
haxis = gamepad_button_check(portNum, gp_padr) - gamepad_button_check(portNum, gp_padl);
vaxis = gamepad_button_check(portNum, gp_padd) - gamepad_button_check(portNum, gp_padu);


if (haxis == 0) && (vaxis == 0)
{
	// Left axis
	haxis = gamepad_axis_value(portNum, gp_axislh);
	vaxis = gamepad_axis_value(portNum, gp_axislv);
}

// CURSOR INPUT
// Right axis
hcursor = gamepad_axis_value(portNum, gp_axisrh);
vcursor = gamepad_axis_value(portNum, gp_axisrv);



// MOVEMENT OUTPUT
if abs(haxis) < .2
	haxis = 0;
if abs(vaxis) < .2
	vaxis = 0;

if (haxis != 0) || (vaxis != 0)
	direction = point_direction(0, 0, haxis, vaxis);

speed = point_distance(0, 0, haxis, vaxis) * 5;
//image_angle = direction;

// CURSOR OUTPUT
if abs(hcursor) < .2
	hcursor = 0;
if abs(vcursor) < .2
	vcursor = 0;
	
if (hcursor != 0) || (vcursor != 0)
	angleCursor = point_direction(0, 0, hcursor, vcursor);
	
	

// INPUT BOUTTONS
stickl = gamepad_button_check(portNum, gp_stickl)
stickr = gamepad_button_check(portNum, gp_stickr)

bttd = gamepad_button_check(portNum, gp_face1)
bttr = gamepad_button_check(portNum, gp_face2)
bttl = gamepad_button_check(portNum, gp_face3)
bttu = gamepad_button_check(portNum, gp_face4)

shoulderl = gamepad_button_check(portNum, gp_shoulderl)
shoulderlb = gamepad_button_check(portNum, gp_shoulderlb)
shoulderr = gamepad_button_check(portNum, gp_shoulderr)
shoulderrb = gamepad_button_check(portNum, gp_shoulderrb)

select = gamepad_button_check(portNum, gp_select)
start = gamepad_button_check(portNum, gp_start)
