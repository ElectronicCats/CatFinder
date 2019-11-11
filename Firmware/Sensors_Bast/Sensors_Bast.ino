/************************************************************
  SPANISH
  Cat Finder 1.0.1
  Cat Finder - Rover Educativo
  Rocio Rosales @ Electronic Cats
  Eduardo Contreras @ Electronic Cats
  Original Creation Date: Sep 23, 2019
  https://github.com/ElectronicCats/Cat_Finder

  Este ejemplos demuestra el funcionamiento basico de los sensores y funcionalidad
  basica del Cat Finder Kit de Rover Educativo
  http://electroniccats.com

  Especificaciones del entorno de Desarrollo:
  IDE: Arduino 1.8.9
  Plataforma de Hardware:
  Kit Cat Finder
  - Bast Pro Mini M0
  - BMP280
  - CCS811
  - MPU6050
  - HMC5883


  Este código es beerware si tu me ves ( o cualquier otro miembro de Electronic Cats)
  a nivel local, y tu has encontrado nuestro código útil ,
  por favor comprar una ronda de cervezas!

  Distribuido como; no se da ninguna garantía.
************************************************************/

/************************************************************
  ENGLISH
  Cat Finder 1.0.1
  Cat Finer - Rover
  Rocio Rosales @ Electronic Cats
  Eduardo Contreras @ Electronic Cats
  Original Creation Date: Sep 23, 2019
  https://github.com/ElectronicCats/Cat_Finder

  This example demonstrates how to use program Bast read I2C sensors

  Development environment specifics:
  IDE: Arduino 1.8.9
  Hardware Platform:
  Kit Can Finder
  - Bast Pro Mini M0
  - BMP280
  - CCS811
  - MPU6050
  - HMC5883

  This code is beerware; if you see me (or any other Electronic Cats
  member) at the local, and you've found our code helpful,
  please buy us a round!

  Distributed as-is; no warranty is given.
*/

#include <Wire.h>
#include "SparkFunBME280.h"
#include "Adafruit_CCS811.h"
#include <MPU6050.h>  //acelerometro y gyroscopio
#include <Adafruit_Sensor.h>
#include <Adafruit_HMC5883_U.h>  //Magnetometro


#define Serial SerialUSB

//Variables BME280
float humidity=0;
float pressure=0;
float temp=0;

//Variables CCS811
float co2=0;
float tvoc=0;

//Variables HMC5883L
float magX=0;
float magY=0;
float magZ=0;

BME280 mySensorB;//Object BME280
Adafruit_CCS811 ccs; //Object CCS811

MPU6050 accelgyro;
//Variables de Aceleración y Giroscopio
//Accel and Gyro Vars
int16_t ax, ay, az;
int16_t gx, gy, gz;

Adafruit_HMC5883_Unified mag = Adafruit_HMC5883_Unified(1);//Magnetometro

String Todo;

void setup()
{
  Serial.begin(115200);
  Serial1.begin(115200);
  
  //while(!Serial);

  //BME280 CONFIG
   mySensorB.setI2CAddress(0x76); //Connect to a second sensor
   if(mySensorB.beginI2C() == false) Serial.println("Sensor BME280 connect failed");

  //CCS811 config
  if(!ccs.begin()){
    Serial.println("Failed to start sensor CCS811! Please check your wiring.");
    while(1);
     }

  //Inicializar acelerometro y gyroscopio
  accelgyro.initialize();  /// Initialize MPU

  accelgyro.setI2CMasterModeEnabled(false);
  accelgyro.setI2CBypassEnabled(true) ;
  accelgyro.setSleepEnabled(false);

  // Initialise the sensor
  if (!mag.begin())
  {
    // There was a problem detecting the HMC5883 ... check your connections
    Serial.println(F("Ooops, no HMC5883 detected ... Check your wiring!"));
    while (1);
  }
}

void loop()
{
  sensors_event_t event;
  
  //Variables BME280
  humidity=mySensorB.readFloatHumidity();
  pressure=mySensorB.readFloatPressure();
  temp=mySensorB.readTempC();


  //data CCS811
  if(ccs.available()){
    if(!ccs.readData()){
      co2=ccs.geteCO2();
      tvoc=ccs.getTVOC();
    }
    else{
      Serial.println("ERROR!");
      while(1);
    }
  }
  
  accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);

  mag.getEvent(&event);
 
  // Display the results (magnetic vector values are in micro-Tesla (uT))
  Serial.print("X: "); Serial.print(event.magnetic.x); Serial.print("  ");
  Serial.print("Y: "); Serial.print(event.magnetic.y); Serial.print("  ");
  Serial.print("Z: "); Serial.print(event.magnetic.z); Serial.print("  ");Serial.println("uT");

  // Hold the module so that Z is pointing 'up' and you can measure the heading with x&y
  // Calculate heading when the magnetometer is level, then correct for signs of axis.
  float heading = atan2(event.magnetic.y, event.magnetic.x);
  
  // Once you have your heading, you must then add your 'Declination Angle', which is the 'Error' of the magnetic field in your location.
  // Find yours here: http://www.magnetic-declination.com/
  // Mine is: -13* 2' W, which is ~13 Degrees, or (which we need) 0.22 radians
  // If you cannot find your Declination, comment out these two lines, your compass will be slightly off.
  float declinationAngle = 0.22;
  heading += declinationAngle;
  
  // Correct for when signs are reversed.
  if(heading < 0)
    heading += 2*PI;
    
  // Check for wrap due to addition of declination.
  if(heading > 2*PI)
    heading -= 2*PI;
   
  // Convert radians to degrees for readability.
  float headingDegrees = heading * 180/M_PI; 
  
  //Serial.print("Heading (degrees): "); Serial.println(headingDegrees);

  //send all data
    Todo+=humidity;
    Todo+=",";
    Todo+=pressure;
    Todo+=",";
    Todo+=temp;//°C
    Todo+=",";
    Todo+=co2;//ppm
    Todo+=",";
    Todo+=tvoc;//ppb
    Todo+=",";
    Todo+=ax;
    Todo+=",";
    Todo+=ay;
    Todo+=",";
    Todo+=az;
    Todo+=",";
    Todo+=gx;
    Todo+=",";
    Todo+=gy;
    Todo+=",";
    Todo+=gz;
    Serial.println(Todo);
    Serial1.println(Todo);
    Todo = "";

  delay(1000);
}
