/// @description Insert description here

	if (audio_is_playing(Session_sans_titre_2_mixage_final))
	{
		audio_stop_sound(Session_sans_titre_2_mixage_final);
	}

	if (!audio_is_playing(MusiqueJeu))
	{
		audio_play_sound(MusiqueJeu, 50, true);
		
	}
	if (audio_is_playing(CinematicTuto1))
	{
		audio_sound_gain(MusiqueJeu,global.musicVolume*0.1, 50);
	}
	
	else if (audio_is_playing(CinematicTuto2))
	{
		audio_sound_gain(CinematicTuto2,global.musicVolume*10,50);
		audio_sound_gain(MusiqueJeu, global.musicVolume*0.1, 50);
	}

	else if (audio_is_playing(CinematicTuto3))
	{
		audio_sound_gain(CinematicTuto3,global.musicVolume*10,50);
		audio_sound_gain(MusiqueJeu, global.musicVolume*0.1, 50);
	}
	else if (!audio_is_playing(CinematicTuto1) || !audio_is_playing(CinematicTuto2) || audio_is_playing(CinematicTuto3))
	{
		audio_sound_gain(MusiqueJeu, global.musicVolume, 50);
	}