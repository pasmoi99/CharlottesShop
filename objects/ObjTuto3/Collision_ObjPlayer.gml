audio_play_sound(CinematicTuto3, 100, false,5)

if audio_is_playing(CinematicTuto3)
{
	audio_stop_sound(CinematicTuto2)
}
instance_destroy(self)
