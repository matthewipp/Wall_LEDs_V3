/*
 * author: Matt Ippolito
 * date-created: 7/27/2022
 * last-modified: 7/27/2022
 * 
 * EqualizerMode.cpp
 * Implemntation file for EqualizerMode object
 * This mode contains most of the special music displays
 */

#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"
#include "EqualizerMode.h"

EqualizerMode::EqualizerMode(int rowLEDs, int numLEDRows) : LEDMode(rowLEDs, numLEDRows) {
  modeID = 2;
  dotHeight = new byte[rowLEDs];
}

EqualizerMode::~EqualizerMode() {
  delete[] dotHeight;
}

void EqualizerMode::updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta) {
  switch(inputBuffer[1] & 0x07) {
    case 0:
      // Default 7 solid color Bands with flat tops
      byte soundLevel;
      int bin;
      byte hue;
      byte bright;
      for(int i = 0; i < rowLength; i++) {
        bin = map(i, 0, rowLength, 0, 7);
        soundLevel = calcAmplitude(freqs[bin]);
        for(int j = 0; j < numRows; j++) {
          // Calc color and brightness
          hue = map(j, 0, numRows, 85, 0);
          bright = j <= soundLevel ? inputBuffer[2] : 0;
          // Draw pixels
          leds.setPixel(i+300*j, getRGB(hue, 255, bright));
        }
      }
      break;
    case 7:
    default:
      break;
  }
}

// Should return from 1 to numRows inclusive
byte EqualizerMode::calcAmplitude(byte freqMag) {
  byte value = 0;
  if(freqMag > 216) value = 7;
  else if(freqMag > 240) value = 6;
  else if(freqMag > 210) value = 5;
  else if(freqMag > 180) value = 4;
  else if(freqMag > 150) value = 3;
  else if(freqMag > 120) value = 2;
  else if(freqMag > 90) value = 1;
  return value;
}
 
