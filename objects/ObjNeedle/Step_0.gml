/// @description Insert description here
// You can write your code in this editor


//image_angle = ObjPlayer.image_angle;
//if(point_distance(ObjPlayer.x,ObjPlayer.y,mouse_x,mouse_y)>point_distance(ObjPlayer.x,ObjPlayer.y,sprite_width/2,sprite_height/2))
//{

//}

image_angle = point_direction(x, y, mouse_x, mouse_y); //permet de pointer l'aiguille vers la souris
ang=point_direction(ObjPlayer.x, ObjPlayer.y, mouse_x, mouse_y)*-1; //donne l'angle en ° que l'aiguille doit indiquer

dify=(sprite_height/2)*dsin(ang);

difx=(sprite_width/2)*dcos(ang);

x=ObjPlayer.x+difx;

y=ObjPlayer.y+dify;
