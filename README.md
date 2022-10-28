# fortress

## Quick and Dirty Solution

Use Alfred app to turn android into a surveilance camera. It takes about 600mA. Let's assume we're using Pixel 3. A 2915mAh battery will last for ~4.8 hours.

Optimize the ROM:
* Add a custom apk to compilation: https://stackoverflow.com/questions/10579827/how-do-i-add-apks-in-an-aosp-build
* Compile AOSP from source: https://appuals.com/build-custom-rom-android-open-source-project/


### Termux Approach

Setup storage: `termux-setup-storage`

Slow Termux calls: https://github.com/termux/termux-api/issues/63

Run Activity Manager as a service: https://github.com/termux/termux-api/pull/471


## Hardware

### Case

Search for "Waterproof DIY Electronic Junction Box", there's a lot of options.

https://a.co/d/7EkK2PK Seems to be the best overall


### Telescope Board

https://www.reddit.com/r/embedded/comments/ii73vr/best_low_cost_production_ready_sbc_for_video/

https://www.reddit.com/r/esp32/comments/r31v43/is_there_an_h264_or_h265_encoder_chip_that_works/

https://www.reddit.com/r/embedded/comments/fx0b5b/need_low_power_h264_encoder_for_embedded_camera/


Usb 2.0 devices work with usb 1.0 hosts, but lower throughput: https://www.quora.com/Does-hooking-up-a-Webcam-to-USB-3-or-USB-Type-C-make-a-live-stream-any-better-then-regular-USB-2

Low speed USB 1.0 software only: https://github.com/cnlohr/espusb

USB 1.0 spec: https://fabiensanglard.net/usbcheat/usb1.pdf

USB keyboard deep dive: https://www.youtube.com/watch?v=wdgULBpRoXk
