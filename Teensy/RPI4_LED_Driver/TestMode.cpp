/*
 * author: Matt Ippolito
 * date-created: 7/25/2022
 * last-modified: 7/25/2022
 * 
 * TestMode.cpp
 * implementation file for SolidColorMode object
 */

#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"
#include "TestMode.h"

TestMode::TestMode(int rowLEDs, int numLEDRows) : LEDMode(rowLEDs, numLEDRows) {
  modeID = 255;
  counter = 0;
}

TestMode::~TestMode() {
  
}

void TestMode::updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta) {
  for(int i = 0; i < totalLEDs; i++) {
    leds.setPixel(i, getRGB((byte)(i+counter), inputBuffer[3], inputBuffer[4]));
  }
  counter++;
  if(counter >= totalLEDs) {
    counter = 0;
  }
}
