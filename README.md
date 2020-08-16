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
* `/reference/duet2-from-filastruder` Duet2 configs downloaded from Filastruder's page on the Railcore II ZLT kit
* `/reference/duet2-from-github` Duet2 configs from the project's GitHub repo
* `/reference/duet3-rrf3.0-300ZL-from-steve` An early version of Duet3 configs at RRF v3.0 from one of the project creators
* `config.json` The export from the RRF3 configurator site
