 /*program Bast Read I2C sensors*/
#include <Wire.h>
#include "SparkFunBME280.h"
#include "Adafruit_CCS811.h"
#include <MPU6050.h>//acelerometro y gyroscopio
#include <Adafruit_Sensor.h>
#include <Adafruit_HMC5883_U.h>//Magnetometro


#define Serial SerialUSB

//Variables BME280
float humidity=0;
float pressure=0;
float temp=0;

//Variables CCS811
float co2=0;
float tvoc=0;

//Variables CCS811
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
  
// while(!Serial);

  //BME280 CONFIG
   mySensorB.setI2CAddress(0x76); //Connect to a second sensor
   if(mySensorB.beginI2C() == false) Serial.println("Sensor B connect failed");

  //CCS811 config
  if(!ccs.begin()){
    Serial.println("Failed to start sensor! Please check your wiring.");
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

  //get value gy-87
  sensors_event_t event;
  accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);

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
