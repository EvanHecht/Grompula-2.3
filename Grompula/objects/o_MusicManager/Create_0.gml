#region Set Up Playlist

//Music Struct
music = function(_song, _title, _artist) constructor {
	song = _song;
	title = _title;
	artist = _artist;
}

//Create the playlist
playlist = ds_list_create();

//Add music to the playlist
ds_list_add(playlist, new music(music_and_so_they_arrive, "And So They Arrive", "Marcus Wood"));
ds_list_add(playlist, new music(music_bring_it_my_way, "Bring It My Way", "Marcus Wood"));
ds_list_add(playlist, new music(music_epic_song, "Epic Song", "Austin Bruchs"));

//Shuffle the playlist
ds_list_shuffle(playlist);

//Begin Playing Initial Song
track_index = 0;
current_track = ds_list_find_value(playlist, track_index);
audio_play_sound(current_track.song, 1, false);

#endregion;

//Ui Variables (UI Origin is top right corner)
origin_x = display_get_gui_width();
origin_y = 0;
horizontal_margin = 200;
vertical_margin = 400;
title_artist_spacing = 50;
ui_alpha = 0;
fade_speed = .1;
show_duration = 120;
ui_state = "hidden";