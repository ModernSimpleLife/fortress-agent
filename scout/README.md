## System Dependencies

```
apt install llvm-dev libclang-dev clang
```

## How to flash?

```
cargo espflash --release --target riscv32imc-esp-espidf --monitor /dev/ttyUSB
```


## Hardware

* Battery: AAA Rechargeable lithium
* Solar: https://www.amazon.com/AOSHIKE-Photovoltaic-Charger-Projects-54x54mm/dp/B07BLP238X/ref=sr_1_1?crid=1NSARYTIAUWO3&keywords=epoxy+solar+panel&qid=1676257458&sprefix=epoxy+solar+panel%2Caps%2C131&sr=8-1
* Simple Solar Charger design: https://learn.adafruit.com/adafruit-bq24074-universal-usb-dc-solar-charger-breakout/design-notes


## Power Saving

* DTIM Beacon,https://lastminuteengineers.com/esp32-sleep-modes-power-consumption/. Receivers adjusts sleep time based on sender pattern
