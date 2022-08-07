/*
 * author: Matt Ippolito
 * date-created: 7/25/2022
 * last-modified: 7/25/2022
 * 
 * TestMode.h
 * A test mode which is not normally accessible via the screen for testing
 */

#ifndef TEST_MODE_H
#define TEST_MODE_H

#include <Arduino.h>
#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"

class TestMode : public LEDMode {
  public:
    // Constructor / Destructor
    TestMode(int rowLEDs, int numLEDRows);
    ~TestMode();
    // Update LEDs
    virtual void updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta);
  private:
    int counter;
};

#endif
