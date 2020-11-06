//Check when sound stops, and then advance the playlist
if(!audio_is_playing(current_track.song)){
	
	//Check if playlist needs to be restarted
	if(track_index == ds_list_size(playlist) - 1){
		ds_list_shuffle(playlist)
		track_index = 0;
		current_track = ds_list_find_value(playlist, track_index);
		audio_play_sound(current_track.song, 1, false);
	}
	
	//If they playlist doesnt need to be restarted
	else {
		ds_list_shuffle(playlist)
		track_index++;
		current_track = ds_list_find_value(playlist, track_index);
		audio_play_sound(current_track.song, 1, false);
	}
	
}