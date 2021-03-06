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

; Drives
M569 P0.0 S0 D2                              ; Extruder     0.0 goes backwards  0.9° LDO "Slim Power" 
M569 P0.1 S1 D2                              ; Y / Front    0.1 goes forwards   0.9° Moons MS23HA8L4360*
M569 P0.2 S0 D2                              ; X / Rear     0.2 goes backwards  0.9° Moons MS23HA8L4360*
M569 P0.3 S0 D3                              ; Z Right      0.3 goes backwards  0.9° Moons MS17HA6P4200*
M569 P0.4 S0 D3                              ; Z Rear Left  0.4 goes backwards  0.9° Moons MS17HA6P4200*
M569 P0.5 S0 D3                              ; Z Front Left 0.5 goes backwards  0.9° Moons MS17HA6P4200*
M584 E0.0 Y0.1 X0.2 Z0.5:0.4:0.3             ; set drive mapping
M350 X32 Y32 Z32 E32 I1                      ; configure microstepping with interpolation

; Steps on X & Y
;   = steps per rotation / (pulley teeth * belt spacing) * microstep multiplier
;     0.9° degree stepper has 400 steps per rotation, 1.8° stepper has 200
M92 X{400 / (17 * 2) * 32} Y{400 / (17 * 2) * 32} Z3200.00 E1674.00  ; set steps per mm

; Motor current
;   = Max stepper rating in milliamps * 0.8
;     Adjust multiplier as desired. Lower is quieter, while higher means more torque, noise, and heat.
;     ...but never over 1.0! (and even over 0.8 may lead to excess heat)
M906 X{3600 * 0.8} Y{3600 * 0.8} Z{2000 * 0.8} E1100 I50           ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                            ; Set idle timeout

; Speeds
M203 X48000.00 Y48000.00 Z960.00  E3600.00    ; set maximum speeds (mm/min)
M201 X6000.00  Y6000.00  Z240.00  E1500.00    ; set accelerations (mm/s^2)

; Jerk and accelerations
M566 X240.00   Y240.00   Z20.00  E1500.00    ; set maximum jerk (instantaneous speed changes) (mm/min)
M204 P1000 T6000                             ; use 1000mm/s² acceleration for print moves and 6000mm/s² for travel moves

; Trinamic Drive Tuning
; Tune tpwmthrs (V) so stealthchop runs at appropriate speeds
; and tune thigh (H) to avoid shifting into fullstep mode
; B = Blank Time (tbl),       Default = 1
; F = Off Time   (toff),      Default = 3
; Y = Hysteresis (start:end), Default = 5:0
M569 P0.0 V250  H1                                    ; E            - Set tpwmthrs so StealthChop runs up to 3.6mm/sec
M569 P0.1 V400  H1       Y4:0                         ; X            - Set tpwmthrs so StealthChop runs up to 10.5mm/sec
M569 P0.2 V400  H1       Y4:0                         ; Y            - Set tpwmthrs so StealthChop runs up to 10.5mm/sec
M569 P0.3 V400  H1                                    ; Z Right      - Set tpwmthrs so StealthChop runs up to 1.2mm/sec
M569 P0.4 V400  H1                                    ; Z Left Rear  - Set tpwmthrs so StealthChop runs up to 1.2mm/sec
M569 P0.5 V400  H1                                    ; Z Left Front - Set tpwmthrs so StealthChop runs up to 1.2mm/sec

; Avoid engaging CoolStep by setting very, very high thresholds
M915 X Y Z E T1                                       ; Set CoolStep threshold to very high speed to effectively disable CoolStep

; Axis Limits
M208 X0   Y0   Z0.01 S1                      ; set axis minima
M208 X300 Y300 Z615  S0                      ; set axis maxima

; Leadscrew locations
M671 X-8.9:-8.9:345.2  Y20.5:274.9:147.5 S7.5   ; Measured leadscrew locations

; Endstops
M574 X1 S1 P"io0.in"                         ; configure active-high endstop for high end on X via pin io1.in
M574 Y1 S1 P"io3.in"                         ; configure active-high endstop for high end on Y via pin io2.in
M574 Z1 S2                                   ; configure Z-probe endstop for low end on Z (*Not in reference*)

; Z-Probe
M950 S0 C"io7.out"                           ; create servo pin 0 for BLTouch
M558 P9 C"^io7.in" H5 F120 T99999            ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-3.8 Y35.1 Z3.55                   ; set Z probe trigger value, offset and trigger height

; Mesh bed leveling
M557 X105:230 Y93.7:208.7 P2:2		         ; define bed mesh grid, Max_Plastic's Spreadsheet coordinates												

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
M307 H1 R2.613 C168.3:118.5 D4.31 S1.00 V23.8 B0

; Fans
M950 F0 C"out8" Q100000                      ; create fan 0 on pin out8 and set its frequency
M106 P0 C"HotendIn" S0.6 H1 T40              ; set fan 0 name and value. Thermostatic control is turned on. *Fan Sunon MF2510V2 on Mosquito as intake.
M950 F1 C"out9" Q100000                      ; create fan 1 on pin out9 and set its frequency
M106 P1 C"HotendOut" S0.4 H1 T40             ; set fan 1 name and value. Thermostatic control is turned on. *Fan Sunon MF2510V2 on Mosquito as exhaust.
M950 F2 C"out7" Q500                         ; create fan 2 on pin out7 and set its frequency
M106 P2 C"Part" S0 H-1                       ; set fan 2 name and value. Thermostatic control is turned off
M950 F3 C"!out6+out6.tach" Q25000            ; create fan 3 as PWM fan on pin out6 and set its frequency
M106 P3 C"Elec Box" S0.5 H-1                 ; set fan 3 name and value. Thermostatic control is turned off

; Configure Stepper X/Y Fans thermostatically controlled by hotend,
; since that's likely when the steppers need cooling
M950 F4 C"!out5+out5.tach" Q25000            ; create fan 4 as PWM fan on pin out6 and set its frequency
M106 P4 C"StepperF" S0.5 H1 T40              ; set fan 4 name and value. Thermostatic control is turned on
M950 F5 C"!out4+out4.tach" Q25000            ; create fan 5 as PWM fan on pin out6 and set its frequency
M106 P5 C"StepperB" S0.5 H1 T40              ; set fan 5 name and value. Thermostatic control is turned on

; Tools
M563 P0 S"Mosquito" D0 H1 F2                 ; define tool 0
G10 P0 X0 Y0 Z0                              ; set tool 0 axis offsets
G10 P0 R0 S0                                 ; set initial tool 0 active and standby temperatures to 0C

; Dynamic Acceleration
; https://duet3d.dozuki.com/Wiki/Gcode#Section_M593_Configure_Dynamic_Acceleration_Adjustment
; Divide speed in mm/sec by distance between ringing artifacts in mm
; M593 F{ 80 / 2.55 }

; Miscellaneous
M308 S10 P"mcu-temp" Y"mcu-temp" A"MCU"      ; Set MCU temp on Sensor 10
M290 R0 S0                                   ; clear any babystepping
T0                                           ; select first tool
M703                                         ; configure any loaded filament

