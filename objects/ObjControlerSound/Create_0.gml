//la musique
global.musicVolume = 1;
percentage = global.musicVolume * 100;




if (!audio_is_playing(Session_sans_titre_2_mixage_final))
{
	audio_play_sound(Session_sans_titre_2_mixage_final, 100, true);
	audio_sound_gain(Session_sans_titre_2_mixage_final, global.musicVolume, 0);
}

