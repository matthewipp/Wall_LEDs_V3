/*
 * author: Matt Ippolito
 * date-created: 8/3/2022
 * last-modified: 8/3/2022
 * 
 * EqualizerTextMode.h
 * Header file for EqualizerTextMode object
 * This mode has two equalizer display beside a middle text display
 */

#ifndef EQUALIZER_TEXT_MODE_H
#define EQUALIZER_TEXT_MODE_H

#include <Arduino.h>
#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"

class EqualizerTextMode : public LEDMode {
  public:
    // Constructor / destructor
    EqualizerTextMode(int rowLEDs, int numLEDRows);
    virtual ~EqualizerTextMode();
    // Update LED array
    virtual void updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta);
  private:
    byte calcAmplitude(byte freqMag);
    byte* dotHeight;
    int textOffset;
    unsigned long nextMove;
    bool resetWait;
};

#endif
 
