/**
 * TouchControlPanelMinimal
 *
 * Minimal example code to demonstrate how to read X and Y values from
 * a Nintendo DS touch screen using an Arduino.
 *
 * This version reads X/Y values from a Nintendo DS touch screen ten
 * times per second and sends those values to the host computer via a
 * serial (USB) connection.
 *
 * The Nintendo DS touch screen has 4 connections which connect to the
 * first 4 analog input pins on the Arduino in this order:
 *
 * Y1 to analog 0
 * X2 to analog 1
 * Y2 to analog 2
 * X1 to analog 3
 *
 * Copyright 2009 Jonathan Oxer <jon@oxer.com.au>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version. http://www.gnu.org/licenses/
 *
 * www.practicalarduino.com/projects/medium/touch-control-panel
 */

// Variables to store the values read from the touchscreen
int xVal = 0;
int yVal = 0;


/**
 * Set up the USB connection to the host for reporting the values
 */
void setup()
{
  // Note: when using the serial monitor, make sure you set the baud rate to 38400
  Serial.begin(38400);
}


/**
 * Main program loop. Scan for touches and sends the X/Y coordinates to
 * the host 10 times per second.
 */
void loop()
{
  // Set up the analog pins in preparation for reading the X value
  // from the touchscreen.
  // NOTE: Recent versions of Arduino include friendly names for the
  // analog pins, so now we can refer to them using labels like "A1"
  // when using them in digital mode.
  pinMode( A1, INPUT );     // Analog pin 1
  pinMode( A3, INPUT );     // Analog pin 3
  pinMode( A0, OUTPUT );    // Analog pin 0
  digitalWrite( A0, LOW );  // Use analog pin 0 as a GND connection
  pinMode( A2, OUTPUT );    // Analog pin 2
  digitalWrite( A2, HIGH ); // Use analog pin 2 as a +5V connection
  xVal = analogRead( 1 );   // Read the X value

  // Set up the analog pins in preparation for reading the Y value
  // from the touchscreen
  pinMode( A0, INPUT );     // Analog pin 0
  pinMode( A2, INPUT );     // Analog pin 2
  pinMode( A1, OUTPUT );    // Analog pin 1
  digitalWrite( A1, LOW );  // Use analog pin 1 as a GND connection
  pinMode( A3, OUTPUT );    // Analog pin 3
  digitalWrite( A3, HIGH ); // Use analog pin 3 as a +5V connection
  yVal = analogRead( 0 );   // Read the Y value

  // Report the values back to the host
  Serial.print(xVal);
  Serial.print(",");
  Serial.println(yVal);

  delay(100); // Wait 100 milliseconds before repeating
}
