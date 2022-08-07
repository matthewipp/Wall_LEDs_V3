/*
 * author: Matt Ippolito
 * date-created: 7/8/2022
 * last-modified: 7/21/2022
 * 
 * LEDMode.cpp
 * Definition file for LEDMode object
 * LEDMode object is base object for all LED Modes
 * In this mode all LEDs are off
 */

#include <OctoWS2811.h>
#include <FastLED.h>
#include "LEDMode.h"

LEDMode::LEDMode(int rowLEDs, int numLEDRows) {
  modeID = 0;
  rowLength = rowLEDs;
  numRows = numLEDRows;
  totalLEDs = rowLEDs * numLEDRows;
}

LEDMode::~LEDMode() {
  
}

void LEDMode::updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta) {
  clearLEDs(leds);
}

void LEDMode::clearLEDs(OctoWS2811& leds) {
  for(int i = 0; i < totalLEDs; i++) {
    leds.setPixel(i, 0, 0, 0);
  }
}

int LEDMode::getRGB(int hue, int sat, int val) {
  CRGB color = CHSV(hue, sat, val);
  return ((int)(color.raw[0]) << 16) + ((int)(color.raw[1]) << 8) + (int)(color.raw[2]);
}
 
