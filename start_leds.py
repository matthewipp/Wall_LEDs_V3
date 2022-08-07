"""
author: Matt Ippolito
date-created: 5/21/22
date-last-modified: 5/21/22

start_leds.py
Running this file starts the led program.  It initializes the GUI and SPI connection
with the teensy and starts the main loop.
"""

import tkinter as tk
from turtle import clear
from GUI_App import GUI

if __name__ == "__main__":
    GUI_manager = GUI()
    GUI_manager.start_loop()
    