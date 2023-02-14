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
* Solar: https://www.amazon.com/AOSHIKE-Electric-Materials-photovoltaic-Charger/dp/B07BMM7SJX?ref_=ast_sto_dp
* Simple Solar Charger design: https://learn.adafruit.com/adafruit-bq24074-universal-usb-dc-solar-charger-breakout/design-notes


## Power Consumption Prediction

10% duty cycle for active wifi and 90% active sleep: 3.3v * (0.1 * 0.075a + 0.9 * 0.004a) = 0.03663w

If we use a 3.7v @1000mah lipo battery, it could last for 3.7v * 1a / 0.03663w / 24hr/d = 4.2 days without sunlight

If we use a 3v @120ma solar, the battery can charge pretty fast. Let say it can produce 50% of its rating, this means it takes 3.7v * 1a / 3v / 0.12a * 0.5 = ~20hr to fully charge.

## "MPPT" Solar Charger

![PXL_20230214_013451918](https://user-images.githubusercontent.com/15654932/218615727-3c6c41e1-2b31-44b3-a0d8-d5d7c5a64f60.jpg)

Hugely based on this idea, https://learn.adafruit.com/adafruit-bq24074-universal-usb-dc-solar-charger-breakout/design-notes. When the Vin drops (read this using ADC), reduce the amps by reducing the transistor duty cycle.

## Power Saving

* DTIM Beacon,https://lastminuteengineers.com/esp32-sleep-modes-power-consumption/. Receivers adjusts sleep time based on sender pattern
