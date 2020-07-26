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
M569 P0.0 S0 D3                              ; Extruder     0.0 goes backwards  0.9° LDO "Slim Power" 
M569 P0.1 S1 D3                              ; Y / Front    0.1 goes forwards   0.9° Moons MS17HA6P4200*
M569 P0.2 S0 D3                              ; X / Rear     0.2 goes backwards  0.9° Moons MS17HA6P4200*
M569 P0.3 S0 D3                              ; Z Right      0.3 goes backwards  0.9° Moons MS17HA6P4200*
M569 P0.4 S0 D3                              ; Z Rear Left  0.4 goes backwards  0.9° Moons MS17HA6P4200*
M569 P0.5 S0 D3                              ; Z Front Left 0.5 goes backwards  0.9° Moons MS17HA6P4200*
M584 E0.0 Y0.1 X0.2 Z0.5:0.4:0.3             ; set drive mapping
M350 X16 Y16 Z32 E32 I1                      ; configure microstepping with interpolation
M92 X200.00 Y200.00 Z6400.00 E1674.00        ; set steps per mm
M906 X1600 Y1600 Z1600 E1100 I30             ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; Speeds
M203 X30000.00 Y30000.00 Z480.00 E3600.00    ; set maximum speeds (mm/min)
M201 X2000.00  Y2000.00  Z80.00  E1500.00    ; set accelerations (mm/s^2)
M566 X500.00   Y500.00   Z20.00  E1500.00    ; set maximum jerk (instantaneous speed changes) (mm/min)
M204 P1000 T2000                             ; use 1000mm/s² acceleration for print moves and 2000mm/s² for travel moves

; Trinamic Drive Tuning
; Tune tpwmthrs (V) so stealthchop runs at appropriate speeds
; and tune thigh (H) to avoid shifting into fullstep mode
M569 P0.0 V125  H5                                    ; E            - Set tpwmthrs so StealthChop runs up to 7.2mm/sec
M569 P0.1 V30   H5                                    ; X            - Set tpwmthrs so StealthChop runs up to 125mm/sec
M569 P0.2 V30   H5                                    ; Y            - Set tpwmthrs so StealthChop runs up to 125mm/sec
M569 P0.3 V15   H5                                    ; Z Right      - Set tpwmthrs so StealthChop runs up to 15.6mm/sec
M569 P0.4 V15   H5                                    ; Z Left Rear  - Set tpwmthrs so StealthChop runs up to 15.6mm/sec
M569 P0.5 V15   H5                                    ; Z Left Front - Set tpwmthrs so StealthChop runs up to 15.6mm/sec

; Axis Limits
M208 X0 Y0 Z0.15 S1                          ; set axis minima
M208 X285 Y285 Z615 S0                       ; set axis maxima, reduced because of extra-far fan mounting

;Leadscrew locations
M671 X-42.5:-42.5:377.5  Y3:258:133.5 S7.5   ; Measured leadscrew locations, I think my endstops are messed up

; Endstops
M574 X1 S1 P"io0.in"                         ; configure active-high endstop for high end on X via pin io1.in
M574 Y1 S1 P"io3.in"                         ; configure active-high endstop for high end on Y via pin io2.in
M574 Z1 S2                                   ; configure Z-probe endstop for low end on Z (*Not in reference*)

; Z-Probe
M950 S0 C"io7.out"                           ; create servo pin 0 for BLTouch
M558 P9 C"^io7.in" H5 F120 T99999            ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-2.8 Y43 Z1.05                     ; set Z probe trigger value, offset and trigger height

; Mesh bed leveling moved to macros/gridProbe
M557 X102.7:227.7 Y81.5:196.5 P2:2			 ; define bed mesh grid, Max_Plastic's Spreadsheet coordinates																

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

; Bed PID Tune @ 60°C with 50% fan at 25mm z-height
; Heater 0 model: gain 253.8, time constant 641.6, dead time 9.8, max PWM 1.00, calibration voltage 23.8, mode PID
; Computed PID parameters for setpoint change: P46.0, I0.579, D315.8
; Computed PID parameters for load change: P46.0, I1.445, D315.8
M307 H0 A253.8 C641.6 D9.8 S1.0 V23.8 B0

; Hotend PID Tune @ 215°C with 100% fan
; Heater 1 model: gain 329.7, time constant 105.6, dead time 2.4, max PWM 1.00, calibration voltage 23.8, mode PID
; Computed PID parameters for setpoint change: P24.1, I1.525, D40.0
; Computed PID parameters for load change: P24.1, I3.456, D40.0
M307 H1 A329.7 C105.6 D2.4 S1.0 V23.8 B0

; Fans
M950 F0 C"out8" Q500                         ; create fan 0 on pin out5 and set its frequency
M106 P0 C"Hotend" S0.5 H1 T40                ; set fan 0 name and value. Thermostatic control is turned on
M950 F1 C"out7" Q500                         ; create fan 1 on pin out4 and set its frequency
M106 P1 C"Part" S0 H-1                       ; set fan 1 name and value. Thermostatic control is turned off
M950 F2 C"!out6+out6.tach" Q25000            ; create fan 2 as PWM fan on pin out6 and set its frequency
M106 P2 C"Elec Box" S0.5 H-1                 ; set fan 2 name and value. Thermostatic control is turned off

; Tools
M563 P0 S"Mosquito" D0 H1 F0:1               ; define tool 0
G10 P0 X0 Y0 Z0                              ; set tool 0 axis offsets
G10 P0 R0 S0                                 ; set initial tool 0 active and standby temperatures to 0C

; Dynamic Acceleration
; https://duet3d.dozuki.com/Wiki/Gcode#Section_M593_Configure_Dynamic_Acceleration_Adjustment
; Divide speed in mm/sec by distance between ringing artifacts in mm
M593 F{ 80 / 2.62 }

; Miscellaneous
M308 S10 P"mcu-temp" Y"mcu-temp" A"MCU"      ; Set MCU temp on Sensor 10
T0                                           ; select first tool

