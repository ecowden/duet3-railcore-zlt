; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Sat Jun 13 2020 15:20:34 GMT-0500 (Central Daylight Time)
;
; * Indicates a non-standard Railcore part

; General preferences
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"Railcore"                             ; set printer name, must match Linux hostname
M669 K1                                      ; select CoreXY mode

; Expansion Boards
; B50 Bottom 1HCL Front Stepper
; B51 Top    1HCL Rear  Stepper
G4 S1                                         ; wait for expansion boards to start

global yDir = 1                               ; Y / Front goes backwards
global xDir = 0                               ; X / Rear goes forwards

; Drives
M569 P0.0  S0 D2                              ; Extruder     0.0  goes forwards  1.8° LDO on LGX Lite
M569 P50.0 S{global.yDir} D2                  ; Y / Front    50.0 goes backwards 0.9° Moons ML23HA0L4350-E*
M569 P51.0 S{global.xDir} D2                  ; X / Rear     51.0 goes forwards  0.9° Moons ML23HA0L4350-E*
M569 P0.3  S0 D2                              ; Z Right      0.3  goes backwards 0.9° Moons MS17HA6P4200*
M569 P0.4  S0 D2                              ; Z Rear Left  0.4  goes backwards 0.9° Moons MS17HA6P4200*
M569 P0.5  S0 D2                              ; Z Front Left 0.5  goes backwards 0.9° Moons MS17HA6P4200*
M584 E0.0 Y50.0 X51.0 Z0.5:0.4:0.3            ; set drive mapping

; Closed Loop Settings
; "Best" settings for 0.9° Moons ML23HA0L4350-E w/ TMC 10K Encoder
M569.1 P50.0 T2 C10000 S200 R100.0 I65000 D0.100  E1:2       ; 1HCL address 50 Y / Front has a quadrature encoder with 10,000 CPR (TMC 10k)
M569.1 P51.0 T2 C10000 S200 R100.0 I65000 D0.100  E1:2       ; 1HCL address 51 X / Rear  has a quadrature encoder with 10,000 CPR (TMC 10k)
; "Best" settings for 0.9° Moons ML23HA0L4350-E w/ CUI Encoder
; M569.1 P50.0 T2 C5120 S400 R80.0 I30000 D0.05  E1:2       ; 1HCL address 50 Y / Front has a quadrature encoder with 5120 CPR (CUI AMT10E2)
; M569.1 P51.0 T2 C5120 S400 R80.0 I30000 D0.05  E1:2       ; 1HCL address 51 X / Rear  has a quadrature encoder with 5120 CPR (CUI AMT10E2)
; "Best" settings for 1.8° Moons ML23HS0L4350-E w/ CUI Encoder
; M569.1 P50.0 T2 C5120 S200 R200.0 I40000.000 D0.09  E1:2       ; 1HCL address 50 Y / Front has a quadrature encoder with 5120 CPR (CUI AMT10E2)
; M569.1 P51.0 T2 C5120 S200 R200.0 I40000.000 D0.09  E1:2       ; 1HCL address 51 X / Rear  has a quadrature encoder with 5120 CPR (CUI AMT10E2)
; Auto Tuned Settings for 1.8° Moons ML23HS0L4350-E w/ CUI Encoder...very mediocre
; M569.1 P50.0 T2 C5120 S200 R70.0 I4000.000 D0.10  E1:2       ; 1HCL address 50 Y / Front has a quadrature encoder with 5120 CPR (CUI AMT10E2)
; M569.1 P51.0 T2 C5120 S200 R70.0 I4000.000 D0.10  E1:2       ; 1HCL address 51 X / Rear  has a quadrature encoder with 5120 CPR (CUI AMT10E2)

; Microstepping
var xyUStep = 64                              ; X & Y microstepping variables
var zUStep  = 16                              ; Z
var eUStep  = 32                              ; E

M350 X{var.xyUStep} Y{var.xyUStep} I1         ; configure microstepping without interpolation
M350 Z{var.zUStep}  E{var.eUStep}  I1         ; configure microstepping with    interpolation

; Steps on X & Y
;   = steps per rotation / (pulley teeth * belt spacing) * microstep multiplier
;     0.9° degree stepper has 400 steps per rotation, 1.8° stepper has 200

var xyPulleyTeeth = 20                                        ; the number of teeth per pulley on the X & Y axes
var toothMM       =  2                                        ; the spacing per pulley tooth in millimeters

M92 X{200 / (var.xyPulleyTeeth * var.toothMM) * var.xyUStep}  ; X set steps per mm
M92 Y{200 / (var.xyPulleyTeeth * var.toothMM) * var.xyUStep}  ; Y set steps per mm
M92 Z{400 * var.zUStep / 4}                                   ; Z set steps per mm

; Extruder steps
; Bondtech says 562 steps at 16 microsteps
M92 E{var.eUStep / 16 * 562}                                  ; E set steps per mm

; Motor current
;   = Max stepper rating in milliamps * 0.8
;     Adjust multiplier as desired. Lower is quieter, while higher means more torque, noise, and heat.
;     ...but never over 1.0! (and even over 0.8 may lead to excess heat)
M906 X{3500 * 0.8} Y{3500 * 0.8} I50                          ; X & Y set motor currents (mA) and motor idle factor in per cent
M906 Z{2000 * 0.8}               I50                          ; Z     set motor currents (mA) and motor idle factor in per cent
M906 E600                        I50                          ; E     set motor currents (mA), per Bondtech use between 450-650mA
M84 S60                                                       ; Set idle timeout

; Speeds
M203 X{400 * 60} Y{400 * 60} Z{12 * 60}  E{60 * 60}             ; set maximum speeds (mm/min)
M201 X12000      Y12000      Z360.00     E1500.00               ; set maximum accelerations (mm/s^2)
M566 X{6 * 60}   Y{6 * 60}   Z{1.6 * 60} E{25 * 60}             ; set maximum jerk (instantaneous speed changes) (mm/min)
M204 P1500 T8000                                                ; set default print and travel accelerations (mm/s^2)

; Trinamic Drive Tuning
; Tune tpwmthrs (V) so stealthchop runs at appropriate speeds
; and tune thigh (H) to avoid shifting into fullstep mode
; B = Blank Time (tbl),       Default = 1
; F = Off Time   (toff),      Default = 3
; Y = Hysteresis (start:end), Default = 5:0
M569 P0.0 V250 H1                                       ; E            - Set tpwmthrs so StealthChop @ 3.60mm/sec, thigh @ 89.60 mm/sec
M569 P50.0       Y7:4 ; B1 F3                         ; X            - Set tpwmthrs so StealthChop @ 10.5mm/sec, thigh @ (disable)
M569 P51.0       Y7:4 ; B1 F3                         ; Y            - Set tpwmthrs so StealthChop @ 10.5mm/sec, thigh @ (disable)
; M569 P50.0 V400 H1 Y7:4 ; B1 F3                         ; X            - Set tpwmthrs so StealthChop @ 10.5mm/sec, thigh @ (disable)
; M569 P51.0 V400 H1 Y7:4 ; B1 F3                         ; Y            - Set tpwmthrs so StealthChop @ 10.5mm/sec, thigh @ (disable)
M569 P0.3 V400 H1 ; B2 F4 Y5:0                         ; Z Right      - Set tpwmthrs so StealthChop @ 1.20mm/sec, thigh @ (disable)
M569 P0.4 V400 H1 ; B2 F4 Y5:0                         ; Z Left Rear  - Set tpwmthrs so StealthChop @ 1.20mm/sec, thigh @ (disable)
M569 P0.5 V400 H1 ; B2 F4 Y5:0                         ; Z Left Front - Set tpwmthrs so StealthChop @ 1.20mm/sec, thigh @ (disable)

; StallGuard
; M915 X Y S8 F1 R1 H622                                ; X & Y StallGuard, log on stall, enable filter
M915 Z   S8 F1 R1 H543                                ; Z     StallGuard, log on stall, enable filter
M915 E   S7 F1 R1 H815                                ; E     StallGuard, log on stall, enable filter

; CoolStep
M915 Z T1                                             ; Z CoolStep threshold to very high speed to effectively disable CoolStep
M915 E T1                                             ; E CoolStep threshold to very high speed to effectively disable CoolStep
; M915 X Y T23                                        ; X & Y CoolStep threshold at 203.8 mm/sec (0.9° steppers)
; M915 X Y T46                                        ; X & Y CoolStep threshold at 203.8 mm/sec (1.8° steppers)
; M915 X Y T1                                         ; X & Y CoolStep threshold to very high speed to effectively disable CoolStep

; Axis Limits
M208 X-15 Y0   Z0.01 S1                      ; set axis minima
M208 X300 Y307 Z600  S0                      ; set axis maxima

; Leadscrew locations
M671 X-8.8:-8.8:348.6  Y23.9:278.8:149 S7.5   ; Measured leadscrew locations

; Endstops
M574 X1 S1 P"io0.in"                         ; configure active-high endstop for high end on X via pin io1.in
M574 Y1 S1 P"io3.in"                         ; configure active-high endstop for high end on Y via pin io2.in

; Configure Z Probe in configprobe.g
M98 P"0:/sys/configprobe.g"											

; Heaters
M308 S0 P"temp0" Y"thermistor" A"Bed" T100000 B3950 ; configure bed, sensor 0, as thermistor on pin temp0
M950 H0 C"out1" T0 Q60                              ; create bed heater output on out1 and map it to sensor 0
M307 H0 B0 S1.00                                    ; enable PID mode for the bed heater and set PWM limit and rate
M140 H0                                             ; map heated bed to heater 0
M143 H0 S120                                        ; set temperature limit for bed, heater 0, to 120C
M308 S1 P"temp2" Y"pt1000" A"Hotend" R2200          ; configure nozzle, sensor 1, as PT1000* on pin temp2
M950 H1 C"out2" T1                                  ; create nozzle heater output on out2 and map it to sensor 1
M307 H1 B0 S1.00                                    ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S350                                        ; set temperature limit for nozzle
M308 S2 P"temp1" Y"thermistor" A"Keenovo" T100000 B3950 ; configure keenovo thermistor, sensor 2, as thermistor on pin temp1

; Bed PID Tune @ 60°C
M307 H0 R0.347 C839.2 D20.59 S1.00 V23.8 B0

; Hotend PID Tune @ 215°C at 25mm z-height
M307 H1 R2.648 K0.411:0.180 D4.12 E1.35 S1.00 B0 V23.8
; Hotend PID Tuning Command:
; M303 T0 S215 

; Fans
M950 F0 C"out7" Q500                         ; create fan 0 on pin out7 and set its frequency
M106 P0 C"Part" S0 H-1                       ; set fan 0 name and value. Thermostatic control is turned off
M950 F2 C"out8" Q500                         ; create fan 2 on pin out8 and set its frequency
M106 P2 C"Hotend" S1.0 H1 T40                ; set fan 2 name and value. Thermostatic control is turned on. *Fan is Mosquito fan.
M950 F3 C"!out6+out6.tach" Q25000            ; create fan 3 as PWM fan on pin out6 and set its frequency
; M106 P3 C"Elec Box" S0.5 H-1                 ; set fan 3 name and value. Thermostatic control is turned off

; Configure Stepper X/Y Fans thermostatically controlled by hotend,
; since that's likely when the steppers need cooling
M950 F4 C"!out5+out5.tach" Q25000            ; create fan 4 as PWM fan on pin out6 and set its frequency
M106 P4 C"StepperF" S0.5 H1 T40              ; set fan 4 name and value. Thermostatic control is turned on
M950 F5 C"!out4+out4.tach" Q25000            ; create fan 5 as PWM fan on pin out6 and set its frequency
M106 P5 C"StepperB" S0.5 H1 T40              ; set fan 5 name and value. Thermostatic control is turned on

; Tools
M563 P0 S"Mosquito" D0 H1 F0                 ; define tool 0
G10 P0 X0 Y0 Z0                              ; set tool 0 axis offsets
G10 P0 R0 S0                                 ; set initial tool 0 active and standby temperatures to 0C

; Input Shaping
; Seems to interact with Pressure Advance (PA) to create artifacts.
; Unusable for now, re-examine later.
; M593 P"ei2" F42.0 S0.05                      ; Use EI3 Shaping at 42.0Hz, determined experimentally
; M593 P"mzv" F35.4                            ; Use MZV Shaping at 35.4Hz, determined experimentally

; Miscellaneous
M308 S10 P"mcu-temp" Y"mcu-temp" A"MCU"      ; Set MCU temp on Sensor 10
M290 R0 S0.00                                ; set babystepping, adjust as needed for BLTouch drift
T0                                           ; select first tool
M703                                         ; configure any loaded filament

; Set heater feed-forward in filament config because setting it here makes the heater disappear in the GUI
; M309 P0 S0.030                               ; set heater feed-forward, determined experimentally

M376 H10                                     ; Taper mesh compensation over 10mm