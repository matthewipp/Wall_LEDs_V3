/*
 * author: Matt Ippolito
 * date-created: 8/2/2022
 * last-modified: 8/2/2022
 * 
 * TextWriter.cpp
 * implemntation for function and constant definitions for writing text to the leds
 */

#include <OctoWS2811.h>
#include "Definitions.h"
#include "TextWriter.h"

int writeChar(OctoWS2811& ledArray, char letter, int startLoc, int color, int startShowLoc, int endLoc) {
  byte charWidth = 0;
  const byte* charRows;
  switch(letter) {
    case ' ':
      charWidth = 5;
      charRows = spaceChar;
      break;
    case 'A':
    case 'a':
      charWidth = 6;
      charRows = aChar;
      break;
    case 'B':
    case 'b':
      charWidth = 6;
      charRows = bChar;
      break;
    case 'C':
    case 'c':
      charWidth = 6;
      charRows = cChar;
      break;
    case 'D':
    case 'd':
      charWidth = 6;
      charRows = dChar;
      break;
    case 'E':
    case 'e':
      charWidth = 5;
      charRows = eChar;
      break;
    case 'F':
    case 'f':
      charWidth = 5;
      charRows = fChar;
      break;
    case 'G':
    case 'g':
      charWidth = 6;
      charRows = gChar;
      break;
    case 'H':
    case 'h':
      charWidth = 5;
      charRows = hChar;
      break;
    case 'I':
    case 'i':
      charWidth = 2;
      charRows = iChar;
      break;
    case 'J':
    case 'j':
      charWidth = 6;
      charRows = jChar;
      break;
    case 'K':
    case 'k':
      charWidth = 5;
      charRows = kChar;
      break;
    case 'L':
    case 'l':
      charWidth = 5;
      charRows = lChar;
      break;
    case 'M':
    case 'm':
      charWidth = 6;
      charRows = mChar;
      break;
    case 'N':
    case 'n':
      charWidth = 6;
      charRows = nChar;
      break;
    case 'O':
    case 'o':
      charWidth = 6;
      charRows = oChar;
      break;
    case 'P':
    case 'p':
      charWidth = 6;
      charRows = pChar;
      break;
    case 'Q':
    case 'q':
      charWidth = 6;
      charRows = qChar;
      break;
    case 'R':
    case 'r':
      charWidth = 6;
      charRows = rChar;
      break;
    case 'S':
    case 's':
      charWidth = 6;
      charRows = sChar;
      break;
    case 'T':
    case 't':
      charWidth = 6;
      charRows = tChar;
      break;
    case 'U':
    case 'u':
      charWidth = 6;
      charRows = uChar;
      break;
    case 'V':
    case 'v':
      charWidth = 6;
      charRows = vChar;
      break;
    case 'W':
    case 'w':
      charWidth = 6;
      charRows = wChar;
      break;
    case 'X':
    case 'x':
      charWidth = 5;
      charRows = xChar;
      break;
    case 'Y':
    case 'y':
      charWidth = 6;
      charRows = yChar;
      break;
    case 'Z':
    case 'z':
      charWidth = 5;
      charRows = zChar;
      break;
    case '0':
      charWidth = 5;
      charRows = zeroChar;
      break;
    case '1':
      charWidth = 4;
      charRows = oneChar;
      break;
    case '2':
      charWidth = 5;
      charRows = twoChar;
      break;
    case '3':
      charWidth = 5;
      charRows = threeChar;
      break;
    case '4':
      charWidth = 5;
      charRows = fourChar;
      break;
    case '5':
      charWidth = 5;
      charRows = fiveChar;
      break;
    case '6':
      charWidth = 5;
      charRows = sixChar;
      break;
    case '7':
      charWidth = 5;
      charRows = sevenChar;
      break;
    case '8':
      charWidth = 5;
      charRows = eightChar;
      break;
    case '9':
      charWidth = 5;
      charRows = nineChar;
      break;
    case '.':
      charWidth = 3;
      charRows = periodChar;
      break;
    case ',':
      charWidth = 3;
      charRows = commaChar;
      break;
    case ':':
      charWidth = 3;
      charRows = colonChar;
      break;
    case ';':
      charWidth = 3;
      charRows = semiColonChar;
      break;
    case '$':
      charWidth = 6;
      charRows = dollarChar;
      break;
    case '#':
      charWidth = 6;
      charRows = hashtagChar;
      break;
    case '\'':
      charWidth = 2;
      charRows = apostropheChar;
      break;
    case '\"':
      charWidth = 4;
      charRows = quoteChar;
      break;
    case '!':
      charWidth = 2;
      charRows = exclamationChar;
      break;
    case '/':
      charWidth = 4;
      charRows = slashChar;
      break;
    case '%':
      charWidth = 8;
      charRows = percentChar;
      break;
    case '?':
      charWidth = 6;
      charRows = questionChar;
      break;
    case '(':
    case '{':
    case '[':
      charWidth = 3;
      charRows = openParentheseChar;
      break;
    case ')':
    case '}':
    case ']':
      charWidth = 3;
      charRows = closeParentheseChar;
      break;
    default:
      charWidth = 0;
      charRows = noChar;
  }

  // draw letter
  for(int i = 0; i < charWidth; i++) {
    if(startLoc + i >= endLoc) break;
    if(startLoc + i < startShowLoc) continue;
    for(int j = 0; j < 8; j++) {
      if(charRows[7-j] & (0x01 << i)) ledArray.setPixel(i + startLoc + LED_LENGTH * j, color);
      else ledArray.setPixel(i + startLoc + LED_LENGTH * j, 0);
    }
  }
  return startLoc + charWidth;
}

int writeString(OctoWS2811& ledArray, char* string, int strLen, int startLoc, int endLoc, int color, int textOffset) {
  if(strLen > 0) {
    int nextChar = startLoc - textOffset;
    for(int i = 0; i < strLen; i++) {
      nextChar = writeChar(ledArray, string[i], nextChar, color, startLoc, endLoc);
      if(nextChar >= endLoc) {
        break;
      }
    }
    return nextChar;
  }
  else {
    return 0;
  }
}
 
