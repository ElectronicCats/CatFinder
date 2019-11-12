/************************************************************
  SPANISH
  Sensor Bast 1.0.1
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
  Sensor Bast 1.0.1
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
#include <QMC5883LCompass.h>  //Magnetometro

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


QMC5883LCompass compass; //Magnetometro

String Todo;

void setup()
{
  Wire.begin();

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

  // Initialise mag
  compass.init();
}

void loop()
{ 
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
 
  compass.read();
  
  byte a = compass.getAzimuth();

  char myArray[3];
  compass.getDirection(myArray, a);
  
  Serial.print(myArray[0]);
  Serial.print(myArray[1]);
  Serial.print(myArray[2]);
  Serial.println();

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
    Todo+=",";
    Todo+=mx;
    Todo+=",";
    Todo+=my;
    Todo+=",";
    Todo+=mz;
    Serial.println(Todo);
    Serial1.println(Todo);
    Todo = "";

  delay(1000);
}
