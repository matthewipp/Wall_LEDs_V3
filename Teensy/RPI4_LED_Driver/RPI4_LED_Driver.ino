/*
 * author: Matt Ippolito
 * date-created: 7/8/2022
 * last-modified: 7/21/2022
 * 
 * RPI4_LED_Driver.ino
 * Main loop run on the teensy 4.0
 * Is a SPI slave device to Raspberry Pi
 */

///////////////////////////////// Libraries ///////////////////////////////////
#include <OctoWS2811.h>
#include "Definitions.h"
#include "LEDMode.h"
#include "SolidColorMode.h"
#include "EqualizerMode.h"
#include "EqualizerTextMode.h"
#include "TestMode.h"

///////////////////////////////// Constants ///////////////////////////////////
const byte ledPins[NUM_LED_STRIPS] = {LED_0_PIN, LED_1_PIN, LED_2_PIN, LED_3_PIN, LED_4_PIN, LED_5_PIN, LED_6_PIN, LED_7_PIN};

///////////////////////////////// Variables ///////////////////////////////////
DMAMEM int displayMemory[NUM_LEDS*BYTES_PER_LED/BYTES_PER_INT];
int drawingMemory[NUM_LEDS*BYTES_PER_LED/BYTES_PER_INT];
OctoWS2811 leds(LED_LENGTH, displayMemory, drawingMemory, LED_COLOR_ORDER | LED_SPEED, NUM_LED_STRIPS, ledPins);
LEDMode* ledMode;
bool readingSerial;
int serialCounter;
byte serialBuffer[256];
byte spiMessage[256];
byte freqBuffers[7][FREQ_BUFFER_LEN];
int freqSums[7];
int freqSumsCounter;
byte freqMags[7];
long lastUpdateCall;
long thisUpdateCall;

///////////////////////////////// Function Prototypes /////////////////////////
void readMSGEQ7(byte* freqs);
void spiCSInterruptHandler();
void spiSCKInterruptHandler();

// Initialize everything
void setup() {
  // Startup pulse
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  delay(500);
  digitalWrite(13, LOW);
  // Init debug if debugging
  Serial.begin(9600);
  // Pin Initializations
  pinMode(LED_0_PIN, OUTPUT);
  pinMode(LED_1_PIN, OUTPUT);
  pinMode(LED_2_PIN, OUTPUT);
  pinMode(LED_3_PIN, OUTPUT);
  pinMode(LED_4_PIN, OUTPUT);
  pinMode(LED_5_PIN, OUTPUT);
  pinMode(LED_6_PIN, OUTPUT);
  pinMode(LED_7_PIN, OUTPUT);
  // SPI Initialization
  readingSerial = false;
  serialCounter = 0;
  spiMessage[0] = 0x03;
  spiMessage[1] = 0x60;
  spiMessage[2] = 0x1A;
  int k = 3;
  for(int i = 'A'; i <= 'Z'; i++) {
    spiMessage[k] = i;
    k++;
  }
  // LED Initializtion
  ledMode = new LEDMode(LED_LENGTH, NUM_LED_STRIPS);
  leds.begin();
  // MSGEQ7 Initialization
  pinMode(EQUALIZER_OUT, INPUT);
  pinMode(EQUALIZER_STROBE, OUTPUT);
  pinMode(EQUALIZER_RESET, OUTPUT);
  digitalWriteFast(EQUALIZER_STROBE, 1);
  digitalWriteFast(EQUALIZER_RESET, 0);
  freqSumsCounter = 0;
  for(int i = 0; i < 7; i++) {
    freqSums[i] = 0;
    for(int j = 0; j < FREQ_BUFFER_LEN; j++) {
      freqBuffers[i][j] = 0;
    }
  }
  lastUpdateCall = millis();
}

void loop() {
  // Check Serial, if available reads one byte every loop until finished, then copies everything over
  if(readingSerial) {
    if(Serial.available() == 0) {
      readingSerial = false;
      for(int i = 0; i < serialCounter; i++) {
        spiMessage[i] = serialBuffer[i];
      }
    }
    else {
      // Read one byte then continue loop
      serialBuffer[serialCounter] = Serial.read();
      serialCounter++;
    }
  }
  else {
    if(Serial.available() > 0) {
      readingSerial = true;
      serialCounter = 0;
    }
  }
  // Check if mode has changed
  if(spiMessage[0] != ledMode->modeID) {
    delete ledMode;
    switch(spiMessage[0]) {
      case 0:
        ledMode = new LEDMode(LED_LENGTH, NUM_LED_STRIPS);
        break;
      case 1:
        ledMode = new SolidColorMode(LED_LENGTH, NUM_LED_STRIPS);
        break;
      case 2:
        ledMode = new EqualizerMode(LED_LENGTH, NUM_LED_STRIPS);
        break;
      case 3:
        ledMode = new EqualizerTextMode(LED_LENGTH, NUM_LED_STRIPS);
        break;
      case 255:
        ledMode = new TestMode(LED_LENGTH, NUM_LED_STRIPS);
        break;
      default:
        ledMode = new LEDMode(LED_LENGTH, NUM_LED_STRIPS);
    }
  }
  // Run normal loop
  thisUpdateCall = millis();
  readMSGEQ7();
  ledMode->updateLEDs(leds, freqMags, spiMessage, thisUpdateCall-lastUpdateCall);
  lastUpdateCall = thisUpdateCall;
  leds.show();
  while(millis() - thisUpdateCall < 20);
}

// Read data from MSGEQ7
void readMSGEQ7() {
  digitalWriteFast(EQUALIZER_STROBE, 1);
  digitalWriteFast(EQUALIZER_RESET, 1);
  delayMicroseconds(2);
  digitalWriteFast(EQUALIZER_RESET, 0);
  delayMicroseconds(100);
  byte tempFreq;
  for(byte i = 0; i < 7; i++) {
    digitalWriteFast(EQUALIZER_STROBE, 0);
    delayMicroseconds(100);
    freqSums[i] -= freqBuffers[i][freqSumsCounter];
    tempFreq = (byte)(analogRead(EQUALIZER_OUT) >> 2);
    freqSums[i] += tempFreq;
    freqBuffers[i][freqSumsCounter] = tempFreq;
    freqMags[i] = freqSums[i] / FREQ_BUFFER_LEN;
    delayMicroseconds(25);
    digitalWriteFast(EQUALIZER_STROBE, 1);
    delayMicroseconds(50);
  }
  freqSumsCounter++;
  if(freqSumsCounter >= FREQ_BUFFER_LEN) {
    freqSumsCounter = 0;
  }
}
