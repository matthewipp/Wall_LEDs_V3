"""
author: Matt Ippolito
date-created: 5/21/22
date-last-modified: 5/21/22

Page.py
This file contains the default page class.  The first page that is automatically
loaded is this one.  All other pages ingerit from this class.  The default page class
is LEDs off.
"""

import tkinter as tk
import tkinter.font as font

class Page:
    def __init__(self, root):
        # Configure frame
        self.width = root.winfo_screenwidth()
        self.height = 0.78 * root.winfo_screenheight()
        self.frame = tk.Frame(root, width=self.width, height=self.height)
        self.frame.configure(background="#a7b1b5")
        self.frame.place(x=0, y=0.22*root.winfo_screenheight())
        self.data = {}

    # returns the settings data, first byte is Page id
    def get_settings_data(self):
        return chr(0)
    
    # returns the serial data, or None if there is none
    def get_serial_data(self):
        return None
    
    # draws the boxes within the frame
    def draw(self):
        text_font = font.Font(size=20)
        text = tk.Label(self.frame, font=text_font, justify=tk.LEFT, bg='SystemButtonFace',
                        text="Click a button along the top to select a mode.\n\n" \
                             "Drag your finger between the buttons to see more modes.\n\n" \
                             "Press the power button or \"Off\" mode to return here and turn off the LEDs.\n\n" \
                             "Most modes have settings that can be changed in the area where this text is now.")
        text.place(x=int(0.1*self.height), y=int(0.05*self.width))
        return
    
    # destroys everything.  As long as all widgets inherit from frame this method
    # does not have to be overridden
    def destroy(self):
        self.frame.destroy()
        return
