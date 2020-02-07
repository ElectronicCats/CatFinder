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
  ESP32 Core: 1.0.2
  Plataforma de Hardware:
  Kit Cat Finder
  - ESP32 CAM


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

  This example demonstrates how to use ESP32 Cam

  Development environment specifics:
  IDE: Arduino 1.8.4
  Hardware Platform:
  Kit Can Finder
  - ESP32 CAM

  This code is beerware; if you see me (or any other Electronic Cats
  member) at the local, and you've found our code helpful,
  please buy us a round!

  Distributed as-is; no warranty is given.
*/

#include "esp_camera.h"
#include <WiFi.h>

// WARNING!!! Make sure that you have either selected ESP32 Wrover Module,
//            or another board which has PSRAM enabled


const int motorUnoA = 15; // Pin controlado por PWM 
const int motorUnoB = 14; // Pin controlado por PWM 
const int motorDosA = 12; // Pin controlado por PWM 
const int motorDosB = 13; // Pin controlado por PWM 

extern int go_front;
extern int go_back;
extern int go_right;
extern int go_left;
extern int datain;
String str = "";

void startCameraServer();

#define PWDN_GPIO_NUM     32
#define RESET_GPIO_NUM    -1
#define XCLK_GPIO_NUM      0
#define SIOD_GPIO_NUM     26
#define SIOC_GPIO_NUM     27

#define Y9_GPIO_NUM       35
#define Y8_GPIO_NUM       34
#define Y7_GPIO_NUM       39
#define Y6_GPIO_NUM       36
#define Y5_GPIO_NUM       21
#define Y4_GPIO_NUM       19
#define Y3_GPIO_NUM       18
#define Y2_GPIO_NUM        5
#define VSYNC_GPIO_NUM    25
#define HREF_GPIO_NUM     23
#define PCLK_GPIO_NUM     22

char ssid[15]; //Create a Unique AP from MAC address
const byte DNS_PORT = 53;
IPAddress apIP(192, 168, 4, 1);

void setup() {
  Serial.begin(115200);
  Serial.setDebugOutput(true);
  pinMode(motorUnoB, OUTPUT);
  pinMode(motorDosA, OUTPUT);
  pinMode(motorDosB, OUTPUT);
  pinMode(motorUnoA, OUTPUT);
  pinMode(4, OUTPUT);

   //WiFi Access point
  WiFi.mode(WIFI_AP);
  WiFi.softAPConfig(apIP, apIP, IPAddress(255, 255, 0, 0));
  
  uint64_t chipid=ESP.getEfuseMac();//The chip ID is essentially its MAC address(length: 6 bytes).
  uint16_t chip = (uint16_t)(chipid>>32);
  snprintf(ssid,15,"Cat Finder-%04X",chip);
  WiFi.softAP(ssid);

  //init camera
  startCameraServer();

  //Camera config
  camera_config_t config;
  config.ledc_channel = LEDC_CHANNEL_0;
  config.ledc_timer = LEDC_TIMER_0;
  config.pin_d0 = Y2_GPIO_NUM;
  config.pin_d1 = Y3_GPIO_NUM;
  config.pin_d2 = Y4_GPIO_NUM;
  config.pin_d3 = Y5_GPIO_NUM;
  config.pin_d4 = Y6_GPIO_NUM;
  config.pin_d5 = Y7_GPIO_NUM;
  config.pin_d6 = Y8_GPIO_NUM;
  config.pin_d7 = Y9_GPIO_NUM;
  config.pin_xclk = XCLK_GPIO_NUM;
  config.pin_pclk = PCLK_GPIO_NUM;
  config.pin_vsync = VSYNC_GPIO_NUM;
  config.pin_href = HREF_GPIO_NUM;
  config.pin_sscb_sda = SIOD_GPIO_NUM;
  config.pin_sscb_scl = SIOC_GPIO_NUM;
  config.pin_pwdn = PWDN_GPIO_NUM;
  config.pin_reset = RESET_GPIO_NUM;
  config.xclk_freq_hz = 20000000;
  config.pixel_format = PIXFORMAT_JPEG;
  
  //init with high specs to pre-allocate larger buffers
  if(psramFound()){
    config.frame_size = FRAMESIZE_UXGA;
    config.jpeg_quality = 10;
    config.fb_count = 2;
  } else {
    config.frame_size = FRAMESIZE_SVGA;
    config.jpeg_quality = 12;
    config.fb_count = 1;
  }

  // camera init
  esp_err_t err = esp_camera_init(&config);
  if (err != ESP_OK) {
    Serial.printf("Camera init failed with error 0x%x", err);
    return;
  }
  sensor_t * s = esp_camera_sensor_get();
  //initial sensors are flipped vertically and colors are a bit saturated
  //drop down frame size for higher initial frame rate
  s->set_framesize(s, FRAMESIZE_QVGA);
}

void loop() {
  if(datain){activationoutput();}
  datain=0;
  if (Serial.available())
   {
      str = Serial.readStringUntil('\n');
     // #IFDEBUG Serial.print(str);
   }  
  delay(1000);
}

void activationoutput()  
{
  if (go_front)
  {digitalWrite(motorUnoA, HIGH);
   digitalWrite(motorUnoB, LOW);
   digitalWrite(motorDosA, HIGH);
   digitalWrite(motorDosB, LOW);
  }
  
  if (go_back)
  {
   digitalWrite(motorUnoA, LOW);
   digitalWrite(motorUnoB, HIGH);
   digitalWrite(motorDosA, LOW);
   digitalWrite(motorDosB, HIGH);}
  
  if (go_left)
  {
   digitalWrite(motorUnoA, HIGH);
   digitalWrite(motorUnoB, LOW);
   digitalWrite(motorDosA, LOW);
   digitalWrite(motorDosB, HIGH);}
     
  if (go_right)
  {
   digitalWrite(motorUnoA, LOW);
   digitalWrite(motorUnoB, HIGH);
   digitalWrite(motorDosA, HIGH);
   digitalWrite(motorDosB, LOW);}

  if (!go_right&!go_left&!go_back&!go_front)
  {
   digitalWrite(motorUnoA, LOW);
   digitalWrite(motorUnoB, LOW);
   digitalWrite(motorDosA, LOW);
   digitalWrite(motorDosB, LOW);}
 }
  
