/*program Bast Read I2C sensors*/
#include <Wire.h>
#include "SparkFunBME280.h"
#include "Adafruit_CCS811.h"

//Variables BME280
float humidity=0;
float pressure=0;
float temp=0;

//Variables CCS811
float co2=0;
float tvoc=0;


BME280 mySensorB;//Object BME280
Adafruit_CCS811 ccs; //Object CCS811

void setup()
{
  Serial.begin(115200);
  Wire.begin(0,16);
  while(!Serial);

  //BME280 CONFIG
  mySensorB.setI2CAddress(0x76); //Connect to a second sensor
  if(mySensorB.beginI2C() == false) Serial.println("Sensor B connect failed");

  //CCS811 config
  if(!ccs.begin()){
    Serial.println("Failed to start sensor! Please check your wiring.");
    while(1);
  }
   //calibrate temperature sensor CCS811
  while(!ccs.available());
  float temp = ccs.calculateTemperature();
  ccs.setTempOffset(temp - 25.0);
}

void loop()
{
  //Variables BME280
  humidity=mySensorB.readFloatHumidity();
  pressure=mySensorB.readFloatPressure();
  temp=mySensorB.readTempC();

    if(ccs.available()){
    float tempCCS = ccs.calculateTemperature();
    if(!ccs.readData()){
      Serial.print("CO2: ");
      co2=ccs.geteCO2();
      Serial.print(co2);
      Serial.print("ppm, TVOC: ");
      tvoc=ccs.getTVOC();
      Serial.print(tvoc);
      Serial.print("ppb   Temp:");
      Serial.println(tempCCS);
    }
    else{
      Serial.println("ERROR!");
      while(1);
    }
  }
  delay(1000);
}
