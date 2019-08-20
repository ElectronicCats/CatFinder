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


BME280 mySensorB;//Object BME280
Adafruit_CCS811 ccs; //Object CCS811

MPU6050 accelgyro;
//Variables de Aceleración y Giroscopio
//Accel and Gyro Vars
int16_t ax, ay, az;
int16_t gx, gy, gz;

Adafruit_HMC5883_Unified mag = Adafruit_HMC5883_Unified(1);//Magnetometro

void setup()
{
  Serial.begin(115200);
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
  Serial.print("humidity:");
  Serial.println(humidity);
  Serial.print("pressure:");
  Serial.println(pressure);
  Serial.print("temp:");
  Serial.println(temp);

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

   sensors_event_t event;
  // Display the results (magnetic vector values are in micro-Tesla (uT))
  Serial.print(F("Magnetometro:  "));
  Serial.print(F("X: ")); Serial.print(event.magnetic.x); Serial.print(F("  "));
  Serial.print(F("Y: ")); Serial.print(event.magnetic.y); Serial.print(F("  "));
  Serial.print(F("Z: ")); Serial.print(event.magnetic.z); Serial.print(F("  ")); Serial.println(F("uT"));

  accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
  Serial.print(F("Acelerometro "));
  Serial.print(F("X:")); Serial.print(ax); Serial.print("\t");
  Serial.print(F("Y:")); Serial.print(ay); Serial.print("\t");
  Serial.print(F("Z:")); Serial.print(az); Serial.print("\n");
  Serial.print(F("Giroscopio "));
  Serial.print(F("X:")); Serial.print(gx); Serial.print("\t");
  Serial.print(F("X:")); Serial.print(gy); Serial.print("\t");
  Serial.print(F("X:")); Serial.println(gz); Serial.print("\n");
  
  delay(1000);
}
