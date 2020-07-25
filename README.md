# Railcore II ZLT Duet3 Configs

Duet3 RRF v3.1.1 configurations for my custom Railcore II ZLT, along with 
several variations I've been using for reference.

**UNTESTED!** I have not thoroughly verified these configurations yet. Be careful!

**NOT STOCK!** My machine is not completely stock. It has 0.9° steppers on Z, different steppers on X & Y, and a few
other modifications. Make sure to take these into account if you reference this configuration.

## Contents

* `/config/...` The real configs
* `/reference/duet2-from-filastruder` Duet2 configs downloaded from Filastruder's page on the Railcore II ZLT kit
* `/reference/duet2-from-github` Duet2 configs from the project's GitHub repo
* `/reference/duet3-rrf3.0-300ZL-from-steve` An early version of Duet3 configs at RRF v3.0 from one of the project creators
* `config.json` The export from the RRF3 configurator site

## Process

I started by plugging in the values from the early rrf3.0 config reference into the RRF configurator tool, then 
tweaked manually.