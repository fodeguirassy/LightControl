//
// Copyright 2015 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

// FirebaseRoom_ESP8266 is a sample that demo using multiple sensors
// and actuactor with the FirebaseArduino library.

#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

#include<pgmspace.h>


// Set these to run example.
#define FIREBASE_HOST "lightcontrol-d2340.firebaseio.com"
#define FIREBASE_AUTH "ktmYEDC2sL5HmRRYDW2zCG6Ok0nWgs0rV3VMiDCJ"
/*
 * ESGI Reseau-GES
 * Livebox-DB06
 * 0E067429EEF461666CC5920853
 */
#define WIFI_SSID "ESGI"
#define WIFI_PASSWORD "Reseau-GES"

const int grovePowerPin = 15;
const int vibratorPin = 5;
const int lightSensorPin = A0;
const int ledPin = 12;
const int buttonPin = 14;
const int fanPin = 13;

void setup() {
  Serial.begin(115200);

  pinMode(grovePowerPin, OUTPUT);
  digitalWrite(grovePowerPin, HIGH);

  pinMode(vibratorPin, OUTPUT);
  pinMode(lightSensorPin, INPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(buttonPin, INPUT);
  pinMode(fanPin, OUTPUT);

  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  //Serial.print("Firebase connection status is ");

  String roomLightOnStringRaw  = "Please validate you have just turned on room light"; 
  PGM_P roomLightOnString = PSTR("Please validate you have just turned on room light");
  char buffer [roomLightOnStringRaw.length()];
  
  strncpy_P(buffer, roomLightOnString, roomLightOnStringRaw.length());

  String test = String(buffer);
    
  //Serial.println(strncpy_P(buffer, roomLightOnString, 30));    
  char currentChar;
  for(int i = 0; i < test.length(); i++) {
    currentChar = test.charAt(i);
    if(isAlpha(currentChar) == false && isWhitespace(currentChar) == false) {
      //test.setCharAt(i,'Y');
      
      test.remove(test.indexOf(currentChar)); 
    }  
  }
  
  Serial.println("\nbuffer value is : ");
  Serial.println(test);
 
}

int button = 0;
float light = 0.0;

void loop() {

   if (Firebase.getBool("light/Room/isOn") == false) {
      digitalWrite(D1, LOW);
   }else {
      digitalWrite(D1, HIGH);
   }
  
   
   /*
   if (Firebase.getBool("light/LivingRoom/isOn") == false) {
      digitalWrite(D1, LOW);
   }else {
      digitalWrite(D1, HIGH);
   }
    
   if (Firebase.getBool("light/Hall/isOn") == false) {
      digitalWrite(D1, LOW);
   }else {
      digitalWrite(D1, HIGH);
   }
   
   if (Firebase.getBool("light/Kitchen/isOn") == false) {
      digitalWrite(D1, LOW);
   }else {
      digitalWrite(D1, HIGH);
   }


  Serial.println("Room light state is");
  Serial.println(Firebase.getBool("light/Room/isOn"));
  Serial.println("Living Room light state is");
  Serial.println(Firebase.getBool("light/LivingRoom/isOn"));
  Serial.println("Hall light state is");
  Serial.println(Firebase.getBool("light/Hall/isOn"));
  Serial.println("Kitchen light state is");
  Serial.println(Firebase.getBool("light/Kitchen/isOn"));
  */

  
  delay(200);
}

void formatMessage(){

  
}

