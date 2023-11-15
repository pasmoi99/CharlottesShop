if (audio_is_playing(Session_sans_titre_2_mixage_final))
{
	audio_stop_sound(Session_sans_titre_2_mixage_final)
}

if (!audio_is_playing(MusiqueJeu))
{
	audio_play_sound(MusiqueJeu, 100, true);
	audio_sound_gain(MusiqueJeu, global.musicVolume, 0);
}