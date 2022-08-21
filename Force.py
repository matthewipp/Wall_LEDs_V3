"""
author: Matt Ippolito
date-created: 8/17/22
date-last-modified: 8/17/22

Force.py
This file contains the Force LED Page class, which inherits from Page in Page.py
"""

import tkinter as tk
from Page import Page
from PIL import Image, ImageTk
from SPIManager import send_data

class Force(Page):
    def __init__(self, root):
        super().__init__(root)
        self.text_input = tk.StringVar(self.frame, value="0")
        return
    
    def draw(self):
        self.entry_text = tk.Label(self.frame, text="Enter raw byte data in comma separated list.",
                                   font="Arial 40", bg="#ebeced")
        self.entry_text.place(x=20, y=20)
        self.entry = tk.Entry(self.frame, font="Arial 28", width=55, bg="#ebeced", 
                              textvariable=self.text_input)
        self.entry.place(x=20, y=100)
        self.submit_button = self.create_submit_button(self.frame, 20, 180)
        return
    
    def get_settings_data(self):
        data_to_send = []
        print(self.text_input.get())
        raw_data = self.text_input.get().strip().split(",")
        print(raw_data)
        for word in raw_data:
            data_to_send.append(int(word.strip()))
        return data_to_send
        