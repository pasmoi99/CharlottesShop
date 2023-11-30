/// @description add Health
ObjPlayer.hp+=ObjPlayer.MAX_HP*0.2;
ObjPlayer.hp =  clamp(ObjPlayer.hp, 0, ObjPlayer.MAX_HP)
