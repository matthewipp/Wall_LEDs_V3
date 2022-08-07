"""
author: Matt Ippolito
date-created: 5/22/22
date-last-modified: 5/22/22

SolidColor.py
This file contains the SolidColor LED Page class, which inherits from Page in Page.py
"""

import tkinter as tk
from Page import Page
from PIL import Image, ImageTk

class SolidColor(Page):
    def __init__(self, root):
        super().__init__(root)
        self.data = {
            "hue" : 0,
            "saturation" : 0,
            "value" : 0
        }
        self.bar_width = int(0.15*self.width)
        self.bar_height = int(0.6*self.height)
        slider_file = Image.open("./GUI_Images/Slider.png")
        slider_file = slider_file.resize((self.bar_width, self.bar_width//2))
        self.slider_symbol = ImageTk.PhotoImage(slider_file)
        return
    
    def draw(self):
        # Hue bar
        self.hue_bar = tk.Frame(self.frame, background="red",
                                width=self.bar_width, height=self.bar_height)
        self.hue_bar.place(x=self.width//4-self.bar_width//2, y=self.height//3-self.bar_height//2)
        self.hue_slider = tk.Label(self.hue_bar, image=self.slider_symbol, borderwidth=0)
        self.hue_slider.place(x=0, y=self.bar_height-self.bar_width//2)
        # Saturation bar
        self.hue_bar = tk.Frame(self.frame, background="green",
                                width=self.bar_width, height=self.bar_height)
        self.hue_bar.place(x=2*self.width//4-self.bar_width//2, y=self.height//3-self.bar_height//2)
        # Value bar
        self.hue_bar = tk.Frame(self.frame, background="blue",
                                width=self.bar_width, height=self.bar_height)
        self.hue_bar.place(x=3*self.width//4-self.bar_width//2, y=self.height//3-self.bar_height//2)
        return

