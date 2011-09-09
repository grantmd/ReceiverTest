/*
  The simplest possible test code for reading data off of an RC receiver.
  
  Created by Myles Grant <myles@mylesgrant.com>
  See also: https://github.com/grantmd/QuadCopter
  
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

int throttlePin = 4;
int throttle = 0;

void setup(){
  Serial.begin(115200);
  
  pinMode(throttlePin, INPUT);
}

void loop(){
  int temp = pulseIn(throttlePin, HIGH, 20000);
  if (temp != 0) throttle = temp;
  
  Serial.print("Throttle: ");
  Serial.println(throttle, DEC);
  delay(5);
}

