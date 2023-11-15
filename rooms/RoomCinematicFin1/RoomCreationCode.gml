if keyboard_check(vk_space)
{
		obj_controller_transition.room_transition = RoomCinematicFin2;
		instance_create_depth(0, 0, -100, Obj_transition);
    
}