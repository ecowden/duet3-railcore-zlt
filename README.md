# Railcore II ZLT Duet3 Configs

Duet3 RRF v3.1.1 configurations for my custom Railcore II ZLT, along with 
several variations I've been using for reference.

**USE AT YOUR OWN RISK!** Be careful!

**NOT STOCK!** My machine is not completely stock. Non-standard parts include:
* Duet 3
* Moons [MS23HA8L4360](https://www.moonsindustries.com/p/nema-23-high-precision-hybrid-stepper-motors/ms23ha8l4360-000004611110015316) 0.9° NEMA23 steppers on X & Y, with 18-tooth pulleys
* Moons [MS17HA6P4200](https://www.moonsindustries.com/p/nema-17-high-precision-hybrid-stepper-motors/ms17ha6p4200-000004611110015926) 0.9° steppers on Z (standard are 1.8°)
* PT1000 temperature sensor on hotend

## Contents

* `/config/...` The real configs
* `/reference/object-model` A few exported RRF3 object models for reference while scripting
* `config.json` The export from the RRF3 configurator site
