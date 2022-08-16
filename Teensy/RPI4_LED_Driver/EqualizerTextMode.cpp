/*
 * author: Matt Ippolito
 * date-created: 8/3/2022
 * last-modified: 8/3/2022
 * 
 * EqualizerTextMode.cpp
 * Implementation file for EqualizerTextMode object
 * This mode has two equalizer display beside a middle text display
 */

#include <OctoWS2811.h>
#include <FastLED.h>
#include "LEDMode.h"
#include "TextWriter.h"
#include "EqualizerTextMode.h"

EqualizerTextMode::EqualizerTextMode(int rowLEDs, int numLEDRows) : LEDMode(rowLEDs, numLEDRows) {
  modeID = 3;
  dotHeight = new byte[rowLEDs];
  textOffset = 0;
  nextMove = 0;
  resetWait = true;
}

EqualizerTextMode::~EqualizerTextMode() {
  delete[] dotHeight;
}

void EqualizerTextMode::updateLEDs(OctoWS2811& leds, byte* freqs, byte* inputBuffer, int delta) {
  int sectionLength = LED_LENGTH / 3;
  byte soundLevel;
  int bin;
  byte hue;
  byte bright;
  int tempColor;
  // Draw Equalizer
  for(int i = 0; i < sectionLength; i++) {
    bin = map(i, 0, sectionLength, 0, 7);
    soundLevel = calcAmplitude(freqs[bin]);
    for(int j = 0; j < numRows; j++) {
      // Calc color and brightness
      hue = map(j, 0, numRows, 85, 0);
      bright = j <= soundLevel ? inputBuffer[1] : 0;
      // Draw pixels
      tempColor = getRGB(hue, 255, bright);
      leds.setPixel(i+LED_LENGTH*j, tempColor);
      leds.setPixel(sectionLength*2+i+LED_LENGTH*j, tempColor);
    }
  }
  // Draw Text
  int next = writeString(leds, &(inputBuffer[3]), inputBuffer[2], sectionLength, sectionLength*2, getRGB(150, 255, inputBuffer[1]), textOffset);
  if((next >= sectionLength*2) | (resetWait && nextMove != 0)) {
    if(resetWait && millis() > nextMove) {
      textOffset = 0;
      nextMove = millis() + 2000;
      resetWait = false;
    }
    else if(nextMove < millis()) {
      nextMove = millis() + 250;
      textOffset++;
    }
  }
  else if(!resetWait) {
    resetWait = true;
    nextMove = millis() + 2000;
  }
}

// Should return from 1 to numRows inclusive
byte EqualizerTextMode::calcAmplitude(byte freqMag) {
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
 
 
