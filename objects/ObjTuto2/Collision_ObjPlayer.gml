audio_play_sound(CinematicTuto2, 100, false)

if audio_is_playing(CinematicTuto2)
{
	audio_stop_sound(CinematicTuto1)
}
instance_destroy(self)

