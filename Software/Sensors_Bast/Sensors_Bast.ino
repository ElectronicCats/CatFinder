/*program Bast Read I2C sensors*/
#include <Wire.h>
#include "SparkFunBME280.h"
//#define Serial SerialUSB
float humidity=0;
float pressure=0;
float temp=0;

//BME280 mySensorA; //Uses default I2C address 0x77
BME280 mySensorB; //Uses I2C address 0x76 (jumper closed)

void setup()
{
  Serial.begin(115200);
  while(!Serial);
  Serial.println("Example showing alternate I2C addresses");

 // Wire.begin(4,5);
  mySensorB.setI2CAddress(0x76); //Connect to a second sensor
  if(mySensorB.beginI2C() == false) Serial.println("Sensor B connect failed");
}

void loop()
{
  humidity=mySensorB.readFloatHumidity();
  pressure=mySensorB.readFloatPressure();
  temp=mySensorB.readTempC();
  Serial.println(humidity);
  Serial.println(pressure);
  Serial.println(temp);
  
  delay(1000);
}
