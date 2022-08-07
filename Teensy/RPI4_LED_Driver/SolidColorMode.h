/*
 * author: Matt Ippolito
 * date-created: 7/21/2022
 * last-modified: 7/21/2022
 * 
 * SolidColorMode.h
 * Header file for SolidColorMode object
 * In this mode the leds display a solid color
 */

#ifndef SOLID_COLOR_MODE_H
#define SOLID_COLOR_MODE_H

#include <Arduino.h>
#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"

class SolidColorMode : public LEDMode {
  public:
    // Constructor / destructor
    SolidColorMode(int rowLEDs, int numLEDRows);
    virtual ~SolidColorMode();
    // Update LED array
    virtual void updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta);
};

#endif
