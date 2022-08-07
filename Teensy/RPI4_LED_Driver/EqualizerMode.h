/*
 * author: Matt Ippolito
 * date-created: 7/27/2022
 * last-modified: 7/27/2022
 * 
 * EqualizerMode.h
 * Header file for EqualizerMode object
 * This mode contains most of the special music displays
 * 
 * | mode(0.0->0.7) | subMode(1.0->1.2) | brightness(2.0->2.7)| 
 * 
 */

#ifndef EQUALIZER_MODE_H
#define EQUALIZER_MODE_H

#include <Arduino.h>
#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"

class EqualizerMode : public LEDMode {
  public:
    // Constructor / destructor
    EqualizerMode(int rowLEDs, int numLEDRows);
    virtual ~EqualizerMode();
    // Update LED array
    virtual void updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta);
  private:
    byte calcAmplitude(byte freqMag);
    byte* dotHeight;
};

#endif
