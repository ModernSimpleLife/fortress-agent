#include <stdio.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_spi_flash.h"
#include "esp_wifi.h"
#include "espnow.h"
#include "espnow_storage.h"
#include "espnow_utils.h"

static void app_wifi_init();

void app_main(void)
{
    esp_wifi_init(NULL);
}

static void app_wifi_init() {
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
}
