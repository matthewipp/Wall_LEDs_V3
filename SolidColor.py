"""
author: Matt Ippolito
date-created: 5/22/22
date-last-modified: 5/22/22

SolidColor.py
This file contains the SolidColor LED Page class, which inherits from Page in Page.py
"""

from multiprocessing.sharedctypes import Value
import tkinter as tk
from Page import Page
from PIL import Image, ImageTk
from SPIManager import send_data

class SolidColor(Page):
    def __init__(self, root):
        super().__init__(root)
        self.hue_input = tk.StringVar(self.frame, value="100")
        self.sat_input = tk.StringVar(self.frame, value="255")
        self.val_input = tk.StringVar(self.frame, value="100")
        self.r_input = tk.StringVar(self.frame, value="75")
        self.g_input = tk.StringVar(self.frame, value="0")
        self.b_input = tk.StringVar(self.frame, value="100")
        self.use_HSV_container = tk.BooleanVar(self.frame, value=True)
        return
    
    def change_use_HSV(self):
        self.send_settings_data()
        if self.use_HSV_container.get():
            self.hue_entry.config(state="normal")
            self.sat_entry.config(state="normal")
            self.val_entry.config(state="normal")
            self.r_entry.config(state="disabled")
            self.g_entry.config(state="disabled")
            self.b_entry.config(state="disabled")
        else:
            self.hue_entry.config(state="disabled")
            self.sat_entry.config(state="disabled")
            self.val_entry.config(state="disabled")
            self.r_entry.config(state="normal")
            self.g_entry.config(state="normal")
            self.b_entry.config(state="normal")


    def draw(self):
        # RGB HSV picker
        self.HSV_picker = tk.Radiobutton(self.frame, text="HSV", variable=self.use_HSV_container, 
                                         value=True, command=self.change_use_HSV,
                                         font="Arial 60", indicatoron=0,
                                         selectcolor="gray", bg="#ebeced")
        self.HSV_picker.place(x=20, y=20)
        self.RGB_picker = tk.Radiobutton(self.frame, text="RGB", variable=self.use_HSV_container, 
                                         value=False, command=self.change_use_HSV,
                                         font="Arial 60", indicatoron=0,
                                         selectcolor="gray", bg="#ebeced")
        self.RGB_picker.place(x=300, y=20)
        # Value inputs
        # Hue
        self.hue_entry_text = tk.Label(self.frame, text="Hue", font="Arial 40", bg="#ebeced")
        self.hue_entry_text.place(x=20, y=150)
        self.hue_entry = tk.Entry(self.frame, font="Arial 40", width=3, bg="#ebeced", 
                                  textvariable=self.hue_input, command=self.send_settings_data)
        self.hue_entry.place(x=130, y=150)
        # Saturation
        self.sat_entry_text = tk.Label(self.frame, text="Sat", font="Arial 40", bg="#ebeced")
        self.sat_entry_text.place(x=20, y=225)
        self.sat_entry = tk.Entry(self.frame, font="Arial 40", width=3, bg="#ebeced", 
                                  textvariable=self.sat_input, command=self.send_settings_data)
        self.sat_entry.place(x=130, y=225)
        # Value
        self.val_entry_text = tk.Label(self.frame, text="Val", font="Arial 40", bg="#ebeced")
        self.val_entry_text.place(x=20, y=300)
        self.val_entry = tk.Entry(self.frame, font="Arial 40", width=3, bg="#ebeced", 
                                  textvariable=self.val_input, command=self.send_settings_data)
        self.val_entry.place(x=130, y=300)
        # Hue
        self.r_entry_text = tk.Label(self.frame, text="R", font="Arial 40", bg="#ebeced")
        self.r_entry_text.place(x=300, y=150)
        self.r_entry = tk.Entry(self.frame, font="Arial 40", width=3, bg="#ebeced", 
                                textvariable=self.r_input, state="disabled", 
                                command=self.send_settings_data)
        self.r_entry.place(x=410, y=150)
        # Saturation
        self.g_entry_text = tk.Label(self.frame, text="G", font="Arial 40", bg="#ebeced")
        self.g_entry_text.place(x=300, y=225)
        self.g_entry = tk.Entry(self.frame, font="Arial 40", width=3, bg="#ebeced", 
                                textvariable=self.g_input, state="disabled",
                                command=self.send_settings_data)
        self.g_entry.place(x=410, y=225)
        # Value
        self.b_entry_text = tk.Label(self.frame, text="B", font="Arial 40", bg="#ebeced")
        self.b_entry_text.place(x=300, y=300)
        self.b_entry = tk.Entry(self.frame, font="Arial 40", width=3, bg="#ebeced", 
                                textvariable=self.b_input, state="disabled",
                                command=self.send_settings_data)
        self.b_entry.place(x=410, y=300)
        return
    
    def get_settings_data(self):
        data_to_send = [0x01, 0x00, 0x00, 0x00, 0x00]
        try:
            if self.use_HSV_container.get():
                data_to_send[1] = 0x01
                data_to_send[2] = int(self.hue_entry)
                data_to_send[3] = int(self.sat_entry)
                data_to_send[4] = int(self.val_entry)
            else:
                data_to_send[2] = int(self.r_entry)
                data_to_send[3] = int(self.g_entry)
                data_to_send[4] = int(self.b_entry)
        except ValueError:
            pass
        return data_to_send, 5

