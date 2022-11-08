## System Dependencies

```
apt install llvm-dev libclang-dev clang
```

## How to flash?

```
cargo espflash --release --target riscv32imc-esp-espidf --monitor /dev/ttyUSB
```
