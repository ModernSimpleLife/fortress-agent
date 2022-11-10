# fortress

## Quick and Dirty Solution

Use Alfred app to turn android into a surveilance camera. It takes about 600mA. Let's assume we're using Pixel 3. A 2915mAh battery will last for ~4.8 hours.

Optimize the ROM:
* Add a custom apk to compilation: https://stackoverflow.com/questions/10579827/how-do-i-add-apks-in-an-aosp-build
* Compile AOSP from source: https://appuals.com/build-custom-rom-android-open-source-project/


### Termux Approach

Setup storage: `termux-setup-storage`

Slow Termux calls: https://github.com/termux/termux-api/issues/63, https://github.com/termux/termux-api/issues/547

Run Activity Manager as a service: https://github.com/termux/termux-api/pull/471


### Power Benchmark

Pixel 3

Alfred

|Time|Power Level|
|:--:|:--:|
|1666993341|100%|
|1667006042|0%|

3.5 hours runtime

Idle with Wifi On

|Time|Power Level|
|:--:|:--:|
|1667064784|100%|
|1667130509|89%|
|1667219314|77%|
|1667491114|42%|


Idle with Hotspot On and scout ping every 1 second

|Time|Power Level|
|:--:|:--:|
|1668035925|98%|
|1668037249|95%|
|1668043025|85%|
|1668094621|0%|


## Hardware

### Case

Search for "Waterproof DIY Electronic Junction Box", there's a lot of options.

https://a.co/d/7EkK2PK Seems to be the best overall

### Scout

Solar Panel: https://www.amazon.com/AOSHIKE-Polycrystalline-Battery-Charger-2-67x1-45inch/dp/B0736W4HK1/ref=sr_1_7?crid=1VIQ5YBI2CLZH&keywords=epoxy+solar+panel&qid=1667064525&qu=eyJxc2MiOiIyLjE5IiwicXNhIjoiMC4wMCIsInFzcCI6IjAuMDAifQ%3D%3D&sprefix=epoxy+solar+panel%2Caps%2C114&sr=8-7

The Vin can be fed to the 5v pin as it feeds the voltage regulator directly (accepts 1.5v to 6v) but MUST BE protected by a diode.

Daily energy usage:

Every cycle:
  * 10% for wifi sensing + repeater: 74.7mA@3.3v
  * 90% light sleep: 3.6ma@3.3v

24 * (0.1 * 74.7 + 0.9 * 3.6) / 1000 * 5v = 1.285wh

DFS algorithm to reduce power usage: https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/api-reference/system/power_management.html#

### Telescope Board

https://www.reddit.com/r/embedded/comments/ii73vr/best_low_cost_production_ready_sbc_for_video/

https://www.reddit.com/r/esp32/comments/r31v43/is_there_an_h264_or_h265_encoder_chip_that_works/

https://www.reddit.com/r/embedded/comments/fx0b5b/need_low_power_h264_encoder_for_embedded_camera/


Usb 2.0 devices work with usb 1.0 hosts, but lower throughput: https://www.quora.com/Does-hooking-up-a-Webcam-to-USB-3-or-USB-Type-C-make-a-live-stream-any-better-then-regular-USB-2

Low speed USB 1.0 software only: https://github.com/cnlohr/espusb

USB 1.0 spec: https://fabiensanglard.net/usbcheat/usb1.pdf

USB keyboard deep dive: https://www.youtube.com/watch?v=wdgULBpRoXk
