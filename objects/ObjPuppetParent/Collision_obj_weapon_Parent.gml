/// @description Insert description here
// You can write your code in this editor
random_range(1,3)
 
if (random_range(1,3)==1)
{
	var _obj = choose(obj_Punaise);
	instance_create_layer(x,y,"Bullets_Layer",_obj);
}
