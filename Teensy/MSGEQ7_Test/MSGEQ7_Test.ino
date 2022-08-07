#include <OctoWS2811.h>
#include <FastLED.h>

//********************************* LEDs *************************************************
#define NUM_STRIPS 1
#define LEDS_PER_STRIP 300
#define BYTES_PER_LED 3
#define BYTES_PER_INT 4
//********************************* MSGEQ7 ***********************************************
#define MSGEQ7_INPUT_PIN 15
#define MSGEQ7_STROBE_PIN 8
#define MSGEQ7_RESET_PIN 14

DMAMEM int displayMemory[NUM_STRIPS*LEDS_PER_STRIP*BYTES_PER_LED*BYTES_PER_INT];
int drawingMemory[NUM_STRIPS*LEDS_PER_STRIP*BYTES_PER_LED*BYTES_PER_INT];
byte pinList[NUM_STRIPS] = {7};
OctoWS2811 leds(LEDS_PER_STRIP, displayMemory, drawingMemory, WS2811_GRB | WS2811_800kHz, NUM_STRIPS, pinList);

byte freqMags[7];
void readMSGEQ7(byte* freqs);
int getRGB(byte hue, byte sat, byte val);

void setup() {
  // LEDs
  leds.begin();
  leds.show();
  // MSGEQ7
  pinMode(MSGEQ7_INPUT_PIN, INPUT);
  pinMode(MSGEQ7_STROBE_PIN, OUTPUT);
  pinMode(MSGEQ7_RESET_PIN, OUTPUT);
  digitalWriteFast(MSGEQ7_STROBE_PIN, 1);
  digitalWriteFast(MSGEQ7_RESET_PIN, 0);
}

void loop() {
  // Read MSGEQ7
  readMSGEQ7(&freqMags[0]);
  // Write to LEDS
  for(int i = 0; i < LEDS_PER_STRIP; i++) {
    leds.setPixel(i, getRGB(i, 255, freqMags[i/43]));
    //leds.setPixel(i, 0x00FFFFFF);
  }
  leds.show();
  // Delay 
  delay(10);
}

void readMSGEQ7(byte* freqs) {
  digitalWriteFast(MSGEQ7_STROBE_PIN, 1);
  digitalWriteFast(MSGEQ7_RESET_PIN, 1);
  delayMicroseconds(2);
  digitalWriteFast(MSGEQ7_RESET_PIN, 0);
  delayMicroseconds(100);
  for(byte i = 0; i < 7; i++) {
    digitalWriteFast(MSGEQ7_STROBE_PIN, 0);
    delayMicroseconds(100);
    freqs[i] = (byte)(analogRead(MSGEQ7_INPUT_PIN) >> 2);
    delayMicroseconds(25);
    digitalWriteFast(MSGEQ7_STROBE_PIN, 1);
    delayMicroseconds(50);
  }
}

int getRGB(int hue, int sat, int val) {
  CRGB color = CHSV(hue, sat, val);
  return ((int)(color.raw[0]) << 16) + ((int)(color.raw[1]) << 8) + (int)(color.raw[2]);
}
