//Electronic Cats "Cat Finder"

#include "esp_http_server.h"
#include "esp_timer.h"
#include "esp_camera.h"
#include "img_converters.h"
#include "Arduino.h"
#include <HTTPClient.h>

#include "fb_gfx.h"
#include "fd_forward.h"
#include "fr_forward.h"

#define ENROLL_CONFIRM_TIMES 5
#define FACE_ID_SAVE_NUMBER 7

#define FACE_COLOR_WHITE  0x00FFFFFF
#define FACE_COLOR_BLACK  0x00000000
#define FACE_COLOR_RED    0x000000FF
#define FACE_COLOR_GREEN  0x0000FF00
#define FACE_COLOR_BLUE   0x00FF0000
#define FACE_COLOR_YELLOW (FACE_COLOR_RED | FACE_COLOR_GREEN)
#define FACE_COLOR_CYAN   (FACE_COLOR_BLUE | FACE_COLOR_GREEN)
#define FACE_COLOR_PURPLE (FACE_COLOR_BLUE | FACE_COLOR_RED)

int go_front=0;
int go_back=0;
int go_right=0;
int go_left=0;
int datain=0;

extern String str;

typedef struct {
        size_t size; //number of values used for filtering
        size_t index; //current value index
        size_t count; //value count
        int sum;
        int * values; //array to be filled with values
} ra_filter_t;

typedef struct {
        httpd_req_t *req;
        size_t len;
} jpg_chunking_t;

#define PART_BOUNDARY "123456789000000000000987654321"
static const char* _STREAM_CONTENT_TYPE = "multipart/x-mixed-replace;boundary=" PART_BOUNDARY;
static const char* _STREAM_BOUNDARY = "\r\n--" PART_BOUNDARY "\r\n";
static const char* _STREAM_PART = "Content-Type: image/jpeg\r\nContent-Length: %u\r\n\r\n";

static ra_filter_t ra_filter;
httpd_handle_t stream_httpd = NULL;
httpd_handle_t camera_httpd = NULL;
httpd_handle_t data_httpd = NULL;

static mtmn_config_t mtmn_config = {0};
static int8_t detection_enabled = 0;
static int8_t recognition_enabled = 0;
static int8_t is_enrolling = 0;
static face_id_list id_list = {0};

static ra_filter_t * ra_filter_init(ra_filter_t * filter, size_t sample_size){
    memset(filter, 0, sizeof(ra_filter_t));

    filter->values = (int *)malloc(sample_size * sizeof(int));
    if(!filter->values){
        return NULL;
    }
    memset(filter->values, 0, sample_size * sizeof(int));

    filter->size = sample_size;
    return filter;
}

static int ra_filter_run(ra_filter_t * filter, int value){
    if(!filter->values){
        return value;
    }
    filter->sum -= filter->values[filter->index];
    filter->values[filter->index] = value;
    filter->sum += filter->values[filter->index];
    filter->index++;
    filter->index = filter->index % filter->size;
    if (filter->count < filter->size) {
        filter->count++;
    }
    return filter->sum / filter->count;
}

static esp_err_t stream_handler(httpd_req_t *req){
    camera_fb_t * fb = NULL;
    esp_err_t res = ESP_OK;
    size_t _jpg_buf_len = 0;
    uint8_t * _jpg_buf = NULL;
    char * part_buf[64];
    dl_matrix3du_t *image_matrix = NULL;
    bool detected = false;
    int face_id = 0;
    int64_t fr_start = 0;
    int64_t fr_ready = 0;
    int64_t fr_face = 0;
    int64_t fr_recognize = 0;
    int64_t fr_encode = 0;

    static int64_t last_frame = 0;
    if(!last_frame) {
        last_frame = esp_timer_get_time();
    }

    res = httpd_resp_set_type(req, _STREAM_CONTENT_TYPE);
    if(res != ESP_OK){
        return res;
    }

    while(true){
        detected = false;
        //face_id = 0;
        fb = esp_camera_fb_get();
        if (!fb) {
            Serial.println("Camera capture failed");
            res = ESP_FAIL;
        } else {
            fr_start = esp_timer_get_time();
            fr_ready = fr_start;
            fr_face = fr_start;
            fr_encode = fr_start;
            fr_recognize = fr_start;
            if(!detection_enabled || fb->width > 400){
                if(fb->format != PIXFORMAT_JPEG){
                    bool jpeg_converted = frame2jpg(fb, 80, &_jpg_buf, &_jpg_buf_len);
                    esp_camera_fb_return(fb);
                    fb = NULL;
                    if(!jpeg_converted){
                        Serial.println("JPEG compression failed");
                        res = ESP_FAIL;
                    }
                } else {
                    _jpg_buf_len = fb->len;
                    _jpg_buf = fb->buf;
                }
            } else {

                image_matrix = dl_matrix3du_alloc(1, fb->width, fb->height, 3);

                if (!image_matrix) {
                    Serial.println("dl_matrix3du_alloc failed");
                    res = ESP_FAIL;
                } else {
                    if(!fmt2rgb888(fb->buf, fb->len, fb->format, image_matrix->item)){
                        Serial.println("fmt2rgb888 failed");
                        res = ESP_FAIL;
                    } else {
                        fr_ready = esp_timer_get_time();
                        box_array_t *net_boxes = NULL;
                        if(detection_enabled){
                            net_boxes = face_detect(image_matrix, &mtmn_config);
                        }
                        fr_face = esp_timer_get_time();
                        fr_recognize = fr_face;
                        if (net_boxes || fb->format != PIXFORMAT_JPEG){
                            if(net_boxes){
                                detected = true;
                                fr_recognize = esp_timer_get_time();
                                //draw_face_boxes(image_matrix, net_boxes, face_id);
                                free(net_boxes->box);
                                free(net_boxes->landmark);
                                free(net_boxes);
                            }
                            if(!fmt2jpg(image_matrix->item, fb->width*fb->height*3, fb->width, fb->height, PIXFORMAT_RGB888, 90, &_jpg_buf, &_jpg_buf_len)){
                                Serial.println("fmt2jpg failed");
                                res = ESP_FAIL;
                            }
                            esp_camera_fb_return(fb);
                            fb = NULL;
                        } else {
                            _jpg_buf = fb->buf;
                            _jpg_buf_len = fb->len;
                        }
                        fr_encode = esp_timer_get_time();
                    }
                    dl_matrix3du_free(image_matrix);
                }
            }
        }
        if(res == ESP_OK){
            size_t hlen = snprintf((char *)part_buf, 64, _STREAM_PART, _jpg_buf_len);
            res = httpd_resp_send_chunk(req, (const char *)part_buf, hlen);
        }
        if(res == ESP_OK){
            res = httpd_resp_send_chunk(req, (const char *)_jpg_buf, _jpg_buf_len);
        }
        if(res == ESP_OK){
            res = httpd_resp_send_chunk(req, _STREAM_BOUNDARY, strlen(_STREAM_BOUNDARY));
        }
        if(fb){
            esp_camera_fb_return(fb);
            fb = NULL;
            _jpg_buf = NULL;
        } else if(_jpg_buf){
            free(_jpg_buf);
            _jpg_buf = NULL;
        }
        if(res != ESP_OK){
            break;
        }
        int64_t fr_end = esp_timer_get_time();
        int64_t frame_time = fr_end - last_frame;
        last_frame = fr_end;
        frame_time /= 1000;
        uint32_t avg_frame_time = ra_filter_run(&ra_filter, frame_time);
    }

    last_frame = 0;
    return res;
}

static esp_err_t cmd_handler(httpd_req_t *req){
    char*  buf;
    size_t buf_len; 
    char variable[32] = {0,};
    char value[32] = {0,};
    datain=1;

    buf_len = httpd_req_get_url_query_len(req) + 1;
    if (buf_len > 1) {
        buf = (char*)malloc(buf_len);
        if(!buf){
            httpd_resp_send_500(req);
            return ESP_FAIL;
        }
        if (httpd_req_get_url_query_str(req, buf, buf_len) == ESP_OK) {
            if (httpd_query_key_value(buf, "var", variable, sizeof(variable)) == ESP_OK &&
                httpd_query_key_value(buf, "val", value, sizeof(value)) == ESP_OK) {
            } else {
                free(buf);
                httpd_resp_send_404(req);
                return ESP_FAIL;
            }
        } else {
            free(buf);
            httpd_resp_send_404(req);
            return ESP_FAIL;
        }
        free(buf);
    } else {
        httpd_resp_send_404(req);
        return ESP_FAIL;
    }
    int val = atoi(value);
    int res = 0;

    if(!strcmp(variable, "btnFront")){go_front=val;}
    else if(!strcmp(variable, "btnLeft")){go_left=val;}
    else if(!strcmp(variable, "btnRight")){go_right=val;}
    else if(!strcmp(variable, "btnBack")){go_back=val;}
    else {
        res = -1;
    }

    if(res){
        return httpd_resp_send_500(req);
    }
    httpd_resp_set_hdr(req, "Access-Control-Allow-Origin", "*");
    return httpd_resp_send(req, NULL, 0);
}

static esp_err_t get_handler(httpd_req_t *req)
{
  String SendHTML = "<DOCTYPE html><html><head><meta charset=\"utf-8\" /></head><body><img src=\"\"><a href=\"#\" id=\"btnFront\">FRONT</a><a href=\"#\" id=\"btnBack\">BACK</a><br/><a href=\"#\" id=\"btnLeft\">LEFT</a><a href=\"#\" id=\"btnRight\">RIGHT</a><h1>Explorador Rover</h1><img id=\"stream\" src=\"http://192.168.4.1:81/stream\"><br/><iframe src=\"http://192.168.4.1:80/data\"></iframe>";
  SendHTML +="<style>html {font-family: Helvetica;display: inline-block;margin: 0px auto;text-align: center;}body{margin-top: 50px;background-color: #f5f5f5;} h1 {color: #444444;margin: 50px auto 30px;} h3 {color: #444444;margin-bottom: 50px;}a{width:119px;background-color:#000;border:none;color:white;padding:35px 32px;text-align:center;text-decoration:none;display:inline-block;font-size:16px;margin: 5px 5px;}#stream{width: 75%;height: auto;}iframe{width: 75%;height: auto;border: none;}</style>";
  SendHTML +="<script>const buttonLeft=document.getElementById(\"btnLeft\");const buttonRight=document.getElementById(\"btnRight\");const buttonFront = document.getElementById(\"btnFront\");const buttonBack = document.getElementById(\"btnBack\");buttonLeft.addEventListener(\"touchstart\", e=>{updateConfigController(e);});buttonLeft.addEventListener(\"touchend\", e=>{updateConfigController(e);});buttonRight.addEventListener(\"touchstart\",e=>{updateConfigController(e);});buttonRight.addEventListener(\"touchend\", e=>{updateConfigController(e);});buttonFront.addEventListener(\"touchstart\",e=>{updateConfigController(e);});buttonFront.addEventListener(\"touchend\",e=>{updateConfigController(e);});buttonBack.addEventListener(\"touchstart\",e=>{updateConfigController(e);});buttonBack.addEventListener(\"touchend\",e=>{updateConfigController(e);});";
  SendHTML +="buttonLeft.addEventListener(\"mousedown\",(e)=>{updateConfigController(e);});buttonLeft.addEventListener(\"mouseup\",(e)=>{updateConfigController(e);});buttonRight.addEventListener(\"mousedown\",(e)=>{updateConfigController(e); });buttonRight.addEventListener(\"mouseup\", (e) =>{ console.log(e); updateConfigController(e); });";
  SendHTML += "buttonFront.addEventListener(\"mousedown\",(e)=>{console.log(e);updateConfigController(e);});buttonFront.addEventListener(\"mouseup\",(e)=>{console.log(e);updateConfigController(e);});buttonBack.addEventListener(\"mousedown\",(e)=>{console.log(e);updateConfigController(e);});buttonBack.addEventListener(\"mouseup\",(e)=>{console.log(e);updateConfigController(e);});function updateConfigController(el){let value;switch(el.srcElement.id) {case \"btnLeft\":value = el.buttons==1?1:0;break;case \"btnRight\":value = el.buttons == 1 ? 1 : 0;break; case \"btnFront\":value = el.buttons==1?1:0;break;case \"btnBack\":value   = el.buttons==1?1:0;break;default: return}const query=`http://192.168.4.1/control?var=${el.srcElement.id}&val=${value}`;console.log(\"query =>\"+query);fetch(query).then(response =>{console.log(`request to ${query} finished, status: ${response.status}`);});}</script>";
  SendHTML +="</body></html>";
    
    httpd_resp_set_type(req, "text/html");
    httpd_resp_set_hdr(req, "Content-Encoding", "UTF-8");
    char HTMLCh[SendHTML.length()+1];
    SendHTML.toCharArray(HTMLCh,SendHTML.length());
    httpd_resp_send(req,HTMLCh,SendHTML.length());
    return ESP_OK;
}

static esp_err_t post_handler(httpd_req_t *req){

  //Actualiza datos cada 3 seegundos
  String SendData = "<head><meta http-equiv='refresh' content='3'/></head>";

  // str => lectura de el serial data lo que manda la bast
  SendData +="<div>";
  SendData += str;
  SendData +="</div>";
 
  //(data) SendData += "<table><tr class=\"head-table\"><th colspan=\"2\">Datos</th><th>Acelerometro</th><th>Giroscopio</th></tr><tr><th scope=\"row\">Humidity: "+Humidity+"</th><th>CO2: "+co2+"</th><th>ACX: "+acex+"</th><th>GX: "+gx+"</th></tr><tr><th scope=\"row\">Temp: "+temp+"</th><th>TVOC: "+tvoc+"</th><th>ACY: "+acey+"</th><th>GY: "+gy+"</th></tr><tr><th scope=\"row\">Pressure: "+Pressure+"</th><th></th><th>ACZ: "+acez+"</th><th>GZ: "+gz+"</th></tr></table>";
  //SendData += "<style>html {font-family: Helvetica;display: inline-block;margin: 0px auto;text-align: center;}body{margin-top: 50px;background-color: #f5f5f5;} h1 {color: #444444;margin: 50px auto 30px;} h3 {color: #444444;margin-bottom: 50px;}a{width:119px;background-color:#000;border:none;color:white;padding:35px 32px;text-align:center;text-decoration:none;display:inline-block;font-size:16px;margin: 5px 5px;}#stream{width: 75%;height: auto;}iframe{height: auto;border: none;}table{width: 100%;}th, td{border-bottom: 1px solid #ddd;padding: 5x;}.head-table{padding: 5x;background-color: #000;color: #fff;}</style>";
    httpd_resp_set_type(req, "text/html");
    httpd_resp_set_hdr(req, "Content-Encoding", "utf-8");
    char HTMLCh[SendData.length()+1];
    SendData.toCharArray(HTMLCh,SendData.length());
    httpd_resp_send(req,HTMLCh,SendData.length());
    return ESP_OK;      
}


void startCameraServer(){
    httpd_config_t config = HTTPD_DEFAULT_CONFIG();

   httpd_uri_t test_uri = {
        .uri       = "/",
        .method    = HTTP_GET,
        .handler   = get_handler,
        .user_ctx  = NULL
    };
    
   httpd_uri_t cmd_uri = {
        .uri       = "/control",
        .method    = HTTP_GET,
        .handler   = cmd_handler,
        .user_ctx  = NULL
    };

   httpd_uri_t stream_uri = {
        .uri       = "/stream",
        .method    = HTTP_GET,
        .handler   = stream_handler,
        .user_ctx  = NULL
     };

     httpd_uri_t data_uri = {
        .uri       = "/data",
        .method    = HTTP_GET,
        .handler   = post_handler,
        .user_ctx  = NULL
     };

    ra_filter_init(&ra_filter, 20);
    
    mtmn_config.min_face = 80;
    mtmn_config.pyramid = 0.7;
    mtmn_config.p_threshold.score = 0.6;
    mtmn_config.p_threshold.nms = 0.7;
    mtmn_config.r_threshold.score = 0.7;
    mtmn_config.r_threshold.nms = 0.7;
    mtmn_config.r_threshold.candidate_number = 4;
    mtmn_config.o_threshold.score = 0.7;
    mtmn_config.o_threshold.nms = 0.4;
    mtmn_config.o_threshold.candidate_number = 1;
    
   face_id_init(&id_list, FACE_ID_SAVE_NUMBER, ENROLL_CONFIRM_TIMES);
    
    Serial.printf("Starting web server on port: '%d'\n", config.server_port);
    if (httpd_start(&camera_httpd, &config) == ESP_OK) {
        httpd_register_uri_handler(camera_httpd, &test_uri);
        httpd_register_uri_handler(camera_httpd, &cmd_uri);
        httpd_register_uri_handler(camera_httpd, &data_uri);
    }
    config.server_port += 1;
    config.ctrl_port += 1;
    Serial.printf("Starting stream server on port: '%d'\n", config.server_port);
    if (httpd_start(&stream_httpd, &config) == ESP_OK) {
    httpd_register_uri_handler(stream_httpd, &stream_uri);
    }
}
  
