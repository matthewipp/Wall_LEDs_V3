"""
author: Matt Ippolito
date-created: 8/7/22
date-last-modified: 8/15/22

SPIManager.py
This file contains functions that interact with the GPIO of the 
raspberry pi to implement Serial now
"""

import serial
import time


serialPort = serial.Serial(port="Com4", baudrate=115200, bytesize=8, timeout=2, stopbits=serial.STOPBITS_ONE)

# Try to open serial port x number of times
def open_serial_port(attempts):
    for i in range(attempts):
        try:
            serialPort.open()
            print("Serial port opened.")
            return True
        except serial.SerialException:
            print("Serial Port Not Available.")
            time.sleep(0.5)    
    return False

# send data to raspberry pi
def send_data(data):
    # Check serial port
    message = bytes(data)
    if serialPort.isOpen:
        serialPort.write(message)
    return
