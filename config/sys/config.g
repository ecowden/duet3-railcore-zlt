; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Sat Jun 13 2020 15:20:34 GMT-0500 (Central Daylight Time)

; General preferences
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"Duet3"                                ; set printer name, must match Linux hostname
M669 K1                                      ; select CoreXY mode

; Drives
M569 P0.0 S1 D3                              ; X / Rear     0.0 goes forwards
M569 P0.1 S1 D3                              ; Y / Front    0.1 goes forwards
M569 P0.2 S1 D3                              ; Z Front Left 0.2 goes forwards
M569 P0.3 S1 D3                              ; Z Rear Left  0.3 goes forwards
M569 P0.4 S1 D3                              ; Z Right      0.4 goes forwards
M569 P0.5 S1 D3                              ; Extruder     0.5 goes forwards
M584 X0.0 Y0.1 Z0.2:0.3:0.4 E0.5             ; set drive mapping
M350 X32 Y32 Z16 E32 I1                      ; configure microstepping with interpolation
M92 X400.00 Y400.00 Z3200.00 E1674.00        ; set steps per mm
M566 X840.00 Y840.00 Z96.00 E1500.00         ; set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y12000.00 Z900.00 E3600.00    ; set maximum speeds (mm/min)
M201 X2500.00 Y2500.00 Z100.00 E1500.00      ; set accelerations (mm/s^2)
M906 X1600 Y1600 Z1600 E1100 I80             ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                             ; set axis minima
M208 X295 Y295 Z575 S0                       ; set axis maxima

;Leadscrew locations
M671 X-10:-10:333  Y22.5:277.5:150 S7.5      ; Starting estimate, measure real values

; Endstops
M574 X1 S1 P"io1.in"                         ; configure active-high endstop for high end on X via pin io1.in
M574 Y1 S1 P"io2.in"                         ; configure active-high endstop for high end on Y via pin io2.in
M574 Z1 S2                                   ; configure Z-probe endstop for low end on Z (*Not in reference*)

; Z-Probe
M950 S0 C"io7.out"                           ; create servo pin 0 for BLTouch
M558 P9 C"^io7.in" H5 F120 T6000             ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X2 Y42 Z2                           ; set Z probe trigger value, offset and trigger height

; Mesh bed leveling moved to macros/gridProbe
; M557 X10:295 Y10:295 S57                   ; define mesh grid, elmoret's coordinates

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B3950 R4700 ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out1" T0                                 ; create bed heater output on out1 and map it to sensor 0
M307 H0 B1 S1.00                                   ; enable bang-bang mode for the bed heater and set PWM limit
M140 H0                                            ; map heated bed to heater 0
M143 H0 S120                                       ; set temperature limit for heater 0 to 120C
M308 S1 P"spi.cs0" Y"rtd-max31865"                 ; configure sensor 1 as thermocouple via CS pin spi.cs0
M950 H1 C"out0" T1                                 ; create nozzle heater output on out0 and map it to sensor 1
M307 H1 B0 S1.00                                   ; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"out5" Q500                         ; create fan 0 on pin out5 and set its frequency
M106 P0 C"Hotend" S0 H1 T50                  ; set fan 0 name and value. Thermostatic control is turned on
M950 F1 C"out4" Q500                         ; create fan 1 on pin out4 and set its frequency
M106 P1 C"Layer" S1 H-1                      ; set fan 1 name and value. Thermostatic control is turned off

; Tools
M563 P0 S"Mosquito Magnum" D0 H1 F0:1        ; define tool 0
G10 P0 X0 Y0 Z0                              ; set tool 0 axis offsets
G10 P0 R0 S0                                 ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
T0                                           ; select first tool

