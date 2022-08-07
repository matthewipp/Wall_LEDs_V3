/*
 * author: Matt Ippolito
 * date-created: 7/20/2022
 * last-modified: 7/20/2022
 * 
 * Definitions.h
 * Definitions for RPi4 LEDs
 */

#ifndef DEFINITIONS_H
#define DEFINITIONS_H

// LED Settings
#define LED_COLOR_ORDER WS2811_GRB
#define LED_SPEED WS2811_800kHz
#define LED_LENGTH 300
#define NUM_LED_STRIPS 8
#define NUM_LEDS 2400
#define BYTES_PER_LED 3
#define BYTES_PER_INT 4
// Pin Definitions
#define LED_0_PIN 2
#define LED_1_PIN 3
#define LED_2_PIN 5
#define LED_3_PIN 4
#define LED_4_PIN 6
#define LED_5_PIN 7
#define LED_6_PIN 9
#define LED_7_PIN 8
#define RPI_CS 10
#define RPI_COPI 11
#define RPI_CIPO 12
#define RPI_SCK 13
#define EQUALIZER_OUT A0
#define EQUALIZER_RESET A1
#define EQUALIZER_STROBE A2
#define FREQ_BUFFER_LEN 5
//#define DEBUG

#endif
 
