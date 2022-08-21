"""
author: Matt Ippolito
date-created: 5/21/22
date-last-modified: 8/7/22

GUI_App.py
This file contains the actual GUI code.  It manages which page is showing and loads
and unloads them.
"""

import tkinter as tk
import tkinter.font as font
from Page import Page
from SolidColor import SolidColor
from Rainbow import Rainbow
from StockTicker import StockTicker
from Force import Force
from SpotifySync import SpotifySync
import PIL
from PIL import Image
from PIL import ImageTk

from SPIManager import send_data, open_serial_port

# list of all possible pages
PAGES = {
    "Off" : Page,
    "Solid" : SolidColor,
    "Spotify" : SpotifySync,
    "Rainbow" : Rainbow,
    "Stonks" : StockTicker,
    "Force" : Force,
}

class GUI:
    def __init__(self):
        # initialize root
        self.root = tk.Tk()
        # maximize window and get width and height
        # self.root.state('zoomed')
        self.width = self.root.winfo_screenwidth()
        self.height = self.root.winfo_screenheight()
        self.root.config(background="#666d70")
        # load GUI assets
        on_off_file = Image.open("./GUI_Images/OnOffSymbol.png")
        on_off_file = on_off_file.resize((int(0.16*self.height), int(0.16*self.height)))
        self.on_off_symbol = ImageTk.PhotoImage(on_off_file)
        # initialize navbar
        self.navbar = tk.Frame(self.root, width=self.width, height=0.2*self.height)
        self.navbar.config(background="#666d70")
        self.navbar.place(x=0, y=0)
        self.scroll_buttons = []
        self.scroll_buttons_locs = []
        self.scroll_button_width = (0.324*self.height)
        self.nav_height = int(0.2*self.height)
        self.create_navbar()
        # initialize page
        self.page = Page(self.root)
        self.page.draw()

    def start_loop(self):
        self.root.mainloop()
    
    def turn_off(self):
        self.change_page("Off")

    def change_page(self, new_mode_str):
        new_class = PAGES[new_mode_str]
        if(type(self.page) != new_class):
            self.page.destroy()
            self.page = new_class(self.root)
            self.page.draw()
            self.page.send_settings_data()
    
    def start_scroll(self, event):
        for i, widget in enumerate(self.scroll_buttons):
            self.scroll_buttons_locs[i] = widget.winfo_x()
        self.last_x = event.x
        self.last_y = event.y

    def scroll_navbar(self, event):
        new_position_left = self.scroll_buttons_locs[0]+event.x-self.last_x
        new_position_right = self.scroll_buttons_locs[-1]+event.x-self.last_x
        middle_position = (self.width-0.23*self.height) // 2
        if new_position_left + self.scroll_button_width >= middle_position:
            dist = self.scroll_buttons[0].winfo_x() - middle_position + self.scroll_button_width
            for i, widget in enumerate(self.scroll_buttons):
                widget.place(x=widget.winfo_x() - dist, y=widget.winfo_y())
        elif new_position_right <= middle_position:
            dist = self.scroll_buttons[-1].winfo_x() - middle_position
            for i, widget in enumerate(self.scroll_buttons):
                widget.place(x=widget.winfo_x() - dist, y=widget.winfo_y())
        else:
            for i, widget in enumerate(self.scroll_buttons):
                widget.place(x=self.scroll_buttons_locs[i]+event.x-self.last_x, y=widget.winfo_y())
    
    def add_scroll_button(self):
        id = len(self.scroll_buttons)
        button = tk.Button(self.scroll_region,
                           text=list(PAGES.keys())[id],
                           font=self.navbar_font,
                           command=lambda: self.change_page(list(PAGES.keys())[id]))
        self.scroll_buttons.append(button)
        button.place(x=id*(self.scroll_button_width+0.05*self.width), y=0, 
                     width=self.scroll_button_width, height=self.nav_height)
        self.scroll_buttons_locs.append(button.winfo_x())

    def create_navbar(self):
        self.nav_power = tk.Button(self.navbar, image=self.on_off_symbol, 
                                   width=self.nav_height, 
                                   height=self.nav_height,
                                   command=self.turn_off)
        self.nav_power.place(x=0, y=0)
        self.scroll_region = tk.Frame(self.navbar, 
                                      width=int(self.width-0.23*self.height), 
                                      height=self.nav_height,
                                      background="#a7b1b5")
        self.scroll_region.place(x=0.23*self.height, y=0)
        # Create navbar buttons
        self.navbar_font = font.Font(size=36)
        for key in PAGES.keys():
            self.add_scroll_button()
        self.scroll_region.bind("<B1-Motion>", self.scroll_navbar)
        self.scroll_region.bind("<Button-1>", self.start_scroll)

