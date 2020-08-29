# Railcore II ZLT Duet3 Configs

Duet3 RRF v3.1.1 configurations for my custom Railcore II ZLT

**USE AT YOUR OWN RISK!** Be careful!

**NOT STOCK!** My machine is not stock. Non-standard parts include:
* Duet 3 6HC
* Moons [MS23HA8L4360](https://www.moonsindustries.com/p/nema-23-high-precision-hybrid-stepper-motors/ms23ha8l4360-000004611110015316) 0.9° NEMA23 steppers on X & Y, with,
  * [NEMA23 Stepper Brackets](https://www.mandalaroseworks.com/product/railcore#nema23steppermounts) from Mandala Rose Works
  * [17-tooth pulleys](http://shop.sdp-si.com/catalog/product/?id=A_6A51-017DF0908)
  * [Dampers](https://www.moonsindustries.com/p/dampers/damper00012-000004696325000012)
  * [Rear Riser](https://www.thingiverse.com/thing:4577104) for best pulley fit
* Moons [MS17HA6P4200](https://www.moonsindustries.com/p/nema-17-high-precision-hybrid-stepper-motors/ms17ha6p4200-000004611110015926) 0.9° steppers on Z (standard are 1.8°)
* Hotend is a [Slice Mosquito Magnum](https://www.sliceengineering.com/products/mosquito-magnum%E2%84%A2-hotend)
* Heater is Slice [50W Heater Cartridge](https://www.sliceengineering.com/collections/accessories/products/50w-heater-cartridge?variant=29760199196744)
* [PT1000 temperature sensor](https://www.filastruder.com/products/e3d-pt1000-sensor?_pos=1&_sid=2b3dd065a&_ss=r) on hotend
* [Acylic Side Panels](https://www.mandalaroseworks.com/product/acrylicSidePanels) from Mandala Rose Works

## Contents

* `/config/...` The real configs
* `/reference/object-model` A few exported RRF3 object models for reference while scripting
* `config.json` The export from the RRF3 configurator site
