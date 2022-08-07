/*
 * author: Matt Ippolito
 * date-created: 7/8/2022
 * last-modified: 7/21/2022
 * 
 * LEDMode.h
 * Header file for LEDMode object
 * LEDMode object is base object for all LED Modes
 * In this mode all LEDs are off
 */

#ifndef LEDMODE_H
#define LEDMODE_H

#include <Arduino.h>
#include <OctoWS2811.h>

class LEDMode {
  public:
    // Constructor / destructor
    LEDMode(int rowLEDs, int numLEDRows);
    virtual ~LEDMode();
    // Updates LEDs every update loop
    // freqs: at least 7 long array of equalizer values
    // inputBuffer: at least 3 long array of input arguments
    // delta: number of ms since last call
    virtual void updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta);
    // Turns all LEDs off
    void clearLEDs(OctoWS2811& leds);
    // ID of mode, constant for each subclass
    // 0: LEDMode (off)
    // 1: Solid Color
    // 2: Equalizer Mode
    // 3: Equalizer Text Mode
    // 255: Test Mode
    byte modeID;
    int rowLength, numRows, totalLEDs;
  protected:
    int getRGB(int hue, int sat, int val);
};

#endif
 
