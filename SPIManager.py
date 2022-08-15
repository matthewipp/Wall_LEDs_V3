"""
author: Matt Ippolito
date-created: 8/7/22
date-last-modified: 8/7/22

SPIManager.py
This file contains functions that interact with the GPIO of the 
raspberry pi to implement SPI.
"""

import RPi.GPIO as GPIO
import time

COPI = 4
CIPO = 27
SCK = 21
CS = 13
SPI_SPEED = 500_000

spi = spidev.SpiDev()

# Init pins and set to starting value
def init_SPI_pins():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(COPI, GPIO.OUT)
    GPIO.setup(CIPO, GPIO.IN)
    GPIO.setup(SCK, GPIO.OUT)
    GPIO.setup(CS, GPIO.OUT)
    GPIO.output(COPI, 0)
    GPIO.output(SCK, 0)
    GPIO.output(CS, 1)
    GPIO.output(CS, 1)
    return

# send data to raspberry pi
def send_data(data):
    # Enable sending data
    GPIO.output(CS, 0)
    time.sleep(25)
    # Send all data
    for word in data:
        bit_selector = 0b1000_0000
        for i in range(8):
            if word & bit_selector:
                GPIO.output(COPI, 1)
            else:
                GPIO.output(COPI, 0)
            # python too slow for sleep?
            # time.sleep(0.001)
            bit_selector = bit_selector >> 1
            GPIO.output(SCK, 1)
            GPIO.output(SCK, 0)
    GPIO.output(CS, 1)        
    return
