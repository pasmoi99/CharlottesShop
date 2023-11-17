/// @description Insert description here

	if (audio_is_playing(Session_sans_titre_2_mixage_final))
	{
		audio_stop_sound(Session_sans_titre_2_mixage_final);
	}

	if (!audio_is_playing(MusiqueJeu))
	{
		audio_play_sound(MusiqueJeu, 100, true);
		if (audio_is_playing(CinematicTuto1) or audio_is_playing(CinematicTuto2) or audio_is_playing(CinematicTuto3))
		{
			audio_sound_gain(MusiqueJeu, global.musicVolume*0.2, 50);
		}
		else
		{
			audio_sound_gain(MusiqueJeu, global.musicVolume, 50);
		}
	}
