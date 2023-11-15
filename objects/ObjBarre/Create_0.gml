can_clic = true;
marge = 60

rightLimite = x + (sprite_get_width(SprBarre)/2) - 30;
leftLimite = x - (sprite_get_width(SprBarre)/2) + 30;

// crée le lsid pour la barre de son

a = instance_create_depth(x, y, -1, ObjFicelle);
a.image_xscale = 1;
a.image_yscale = 1;
a.barLength = sprite_get_width(SprFicelle);
a.rightLimite = rightLimite-30;
a.leftLimite = leftLimite+30;
a.percentage = global.musicVolume * 100;

a.x = a.leftLimite + ((a.percentage/100) * (a.rightLimite - a.leftLimite));
a.clicked = false;