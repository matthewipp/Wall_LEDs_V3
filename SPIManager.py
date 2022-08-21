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


serialPort = None

# Try to open serial port x number of times
def open_serial_port(attempts):
    global serialPort
    try:
        serialPort = serial.Serial(port="/dev/ttyACM0", baudrate=9600, bytesize=8, timeout=2, stopbits=serial.STOPBITS_ONE)
        if not serialPort.isOpen():
            for i in range(attempts):
                try:
                    serialPort.open()
                    print("Serial port opened.")
                    return True
                except serial.SerialException as e:
                    print("Serial Port Not Available:")
                    print(e)
                    time.sleep(0.5)    
            return False
        # Already open, good to go
        return True
    except serial.SerialException as e2:
        print("Serial Port Does Not Exist:")
        print(e2)
        return False

# send data to raspberry pi
def send_data(data):
    # Check serial port
    message = bytes(data)
    if serialPort is not None:
        if serialPort.isOpen():
            serialPort.write(message)
    return
