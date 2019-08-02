#include "esp_camera.h"
#include <WiFi.h>
#include <DNSServer.h>

const int ledPin = 12; // Pin controlado por PWM 
const int ledPin1 = 13; // Pin controlado por PWM 
const int ledPin2 = 14; // Pin controlado por PWM 
const int ledPin3 = 15; // Pin controlado por PWM 

extern int go_front;
extern int go_back;
extern int go_right;
extern int go_left;
extern int datain;
//
// WARNING!!! Make sure that you have either selected ESP32 Wrover Module,
//            or another board which has PSRAM enabled
//
#define CAMERA_MODEL_AI_THINKER

#include "camera_pins.h"

const byte DNS_PORT = 53;
IPAddress apIP(192, 168, 4, 1);
DNSServer dnsServer;

void startCameraServer();

void setup() {
  Serial.begin(115200);
  Serial.setDebugOutput(true);
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin, OUTPUT);

   /*WiFi Access point*/
  WiFi.mode(WIFI_AP);
  WiFi.softAPConfig(apIP, apIP, IPAddress(255, 255, 0, 0));
  WiFi.softAP("ESP32-CAM Portal");
  
  startCameraServer();
  
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
  // put your main code here, to run repeatedly:
  if(datain){activationoutput();}
  datain=0;
  delay(1000);
}

void activationoutput()
{
  if (go_front){digitalWrite(ledPin, HIGH);}
     else{digitalWrite(ledPin, LOW);}
  if (go_back!=0){digitalWrite(ledPin1, HIGH);}
  else{digitalWrite(ledPin1, LOW);}
     if (go_left){digitalWrite(ledPin2, HIGH); }
     else{digitalWrite(ledPin2, LOW);}
  if (go_right){digitalWrite(ledPin3, HIGH);}
  else{digitalWrite(ledPin3, LOW);}
  }
