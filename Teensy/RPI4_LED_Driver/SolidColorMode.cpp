/*
 * author: Matt Ippolito
 * date-created: 7/21/2022
 * last-modified: 7/21/2022
 * 
 * SolidColorMode.cpp
 * implementation file for SolidColorMode object
 */

#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"
#include "SolidColorMode.h"

SolidColorMode::SolidColorMode(int rowLEDs, int numLEDRows) : LEDMode(rowLEDs, numLEDRows){
  modeID = 1;
}

SolidColorMode::~SolidColorMode() {
  
}

void SolidColorMode::updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta) {
  int rgb = ((int)(inputBuffer[3]) << 16) + ((int)(inputBuffer[2]) << 8) + ((int)(inputBuffer[4]));
  // HSV Mode Selected if bit is one
  if(inputBuffer[1] & 0x01) {
    rgb = getRGB(inputBuffer[2], inputBuffer[3], inputBuffer[4]);
  }
  for(int i = 0; i < totalLEDs; i++) {
    leds.setPixel(i, rgb);
  }
}
 
