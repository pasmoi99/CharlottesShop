//set grid/tile size
#macro TS 16

// get tiles in room
var _w = ceil(room_width / TS);
var _h = ceil(room_height / TS);

// create motion planing grid
global.mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS);

//add solid instance to grid
mp_grid_add_instances(global.mp_grid, ObjSolid, true);
mp_grid_add_instances(global.mp_grid, ObjSolidSup, true);
mp_grid_add_instances(global.mp_grid, ObjSolidFull, true);

if instance_exists(ObjDoor)
{
	mp_grid_add_instances(global.mp_grid, ObjDoor, true);
}