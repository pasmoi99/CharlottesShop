switch (image_index)
{
    case 0:
        obj_controller_transition.room_transition = Roomtuto;
		instance_create_depth(0, 0, -100, Obj_transition);
    break;

	case 1:
        obj_controller_transition.room_transition = Options;
		instance_create_depth(0, 0, -100, Obj_transition);
    break;
	
	case 2:
        obj_controller_transition.room_transition = Credit;
		instance_create_depth(0, 0, -100, Obj_transition);
    break;

	case 3:
        game_end();
    break;
	
    default:
        image_alpha = .5;
}