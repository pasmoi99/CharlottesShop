// si la sourie ne clic pas
if (!mouse_check_button(mb_left))
{
	grab = false; // on ne grab pas le spite car pas cliquer
}

if (grab == false) && (clicked == false) // si l'obj a pas ete grab
{
	exit;
}
else // si c'est le cas, changer les coordonners de la ficelle
{
	if ((mouse_x + xx) > leftLimite) && ((mouse_x + xx < rightLimite))
	{
		x = mouse_x + xx;
	}
	else if ((mouse_x + xx) < leftLimite)
	{
		x = leftLimite;
	}
	else if ((mouse_x + xx) > rightLimite)
	{
		x = rightLimite;
	}
}

//pourcentage qui varie
percentage = round(((x - leftLimite) / (rightLimite - leftLimite)) * 100);
ObjControlerSound.musicVolume = percentage/100;

clicked = false;