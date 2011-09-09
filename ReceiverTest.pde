/*
  The simplest possible test code for reading data off of an RC receiver.
  
  Created by Myles Grant <myles@mylesgrant.com>
  See also: https://github.com/grantmd/QuadCopter
  
  Adapted from: http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1290626864/5
  
  This program is free software: you can redistribute it and/or modify 
  it under the terms of the GNU General Public License as published by 
  the Free Software Foundation, either version 3 of the License, or 
  (at your option) any later version. 

  This program is distributed in the hope that it will be useful, 
  but WITHOUT ANY WARRANTY; without even the implied warranty of 
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
  GNU General Public License for more details. 

  You should have received a copy of the GNU General Public License 
  along with this program. If not, see <http://www.gnu.org/licenses/>. 
*/

int channels[6]; // Channel-to-pin assignments
int readings[6]; // Current values for the channels

void setup(){
  Serial.begin(115200);
  
  // These may seem arbitrary, but they are what the AeroQuad software uses,
  // so I am using the same, for consistency
  channels[0] = 4; // Throttle
  channels[1] = 2; // Aile / Yaw
  channels[2] = 5; // Elev. / Pitch
  channels[3] = 6; // Rudd. / Roll
  channels[4] = 7; // Gear
  channels[5] = 8; // Aux / Flt Mode
  
  // Assign all pins for reading
  for (int i=0; i<6; i++){
    pinMode(channels[i], INPUT);
  }
}

void loop(){
  int temp;
  int i;
  
  // Read all the channels. Worst case, this will take 180us
  for (i=0; i<6; i++){
    temp = pulseIn(channels[i], HIGH, 20000); // Attempt to read a pulse for 20us
    if (temp != 0) readings[i] = temp; // A value of 0 means that the read timed out, so we keep our previous value
  }
  
  // Print what we got
  for (i=0; i<6; i++){
    Serial.print(readings[i], DEC);
    
    if (i<5){
      Serial.print("  ");
    }
    else{
      Serial.println();
    }
  }
  delay(5);
}

