"""
author: Matt Ippolito
date-created: 8/21/22
date-last-modified: 8/21/22

Spotify Sync
This file contains the class declaration for the Spotify Sync Mode
"""

import spotipy
import spotipy.util as util
import tkinter as tk
from apscheduler.schedulers.background import BackgroundScheduler
from Page import Page
from API_Credentials import Spotify_Client_ID, Spotify_Client_Secret, Spotify_URI, Spotify_Username

class SpotifySync(Page):
    def __init__(self, root):
        super().__init__(root)
        scope = "user-read-currently-playing"
        self.token = util.prompt_for_user_token(Spotify_Username, scope, Spotify_Client_ID, Spotify_Client_Secret, Spotify_URI)
        self.sp = spotipy.Spotify(auth=self.token)
        self.song_title = "Now Playing: None"
        self.bg_scheduler = BackgroundScheduler()
        self.bg_scheduler.add_job(self.update_song_title, 'interval', seconds=6)
        self.bg_scheduler.start()
        self.brightness = tk.StringVar(self.frame, value="96")
        return
    
    def draw(self):
        self.val_entry_text = tk.Label(self.frame, text="Brightness", font="Arial 40", bg="#ebeced")
        self.val_entry_text.place(x=20, y=75)
        self.val_entry = tk.Entry(self.frame, font="Arial 40", width=3, bg="#ebeced", 
                                  textvariable=self.brightness)
        self.brightness.trace_add('write', self.send_settings_data)
        self.val_entry.place(x=20, y=150)
        return
    
    def get_settings_data(self):
        data_to_send = [0x03, 0x00, 0x00]
        data_to_send[1] = int(self.brightness.get())
        title_length = min(len(self.song_title), 200)
        data_to_send[2] = title_length
        for i in range(title_length):
            data_to_send.append(ord(self.song_title[i]))
        return data_to_send
    
    def update_song_title(self):
        song = self.sp.currently_playing()
        title = "Playing: "
        if song is not None:
            artists = song['item']['artists']
            song_title = song['item']['name']
            title += song_title
            title += " by "
            artist_length = len(artists)
            for i in range(artist_length):
                if artist_length == 1:
                    title += artists[0]['name']
                elif i+1 == len(artists):
                    # Last One
                    title += "and " + artists[i]['name']
                else:
                    title += artists[i]['name'] + ", "
        else:
            title += "None"
        if title != self.song_title:
            self.song_title = title
            self.send_settings_data()
            print(title)
        return
    
    def destroy_mode(self):
        self.bg_scheduler.shutdown()
        return 