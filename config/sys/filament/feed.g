; /sys/filament/feed.g
; Feed filament during loading
; assumes that extruder is already at temperature
;

if move.axes[2].machinePosition < 25
    G1 Z25

M83                                      ; relative extruder moves
M116 P0                                  ; Wait for the tool temperature to be reached
G1 E70 F3000                             ; Extrude 70mm of filament at 3000mm/min
G1 E80 F300                              ; Extrude 80mm of filament at 300mm/min - purge hotend

G4 P1000                                 ; wait one second
G1 E-1 F1800                             ; retract 1mm of filament at 1800mm/min

M400                                     ; wait for completion
M292                                     ; hide the message
M84 E                                    ; turn off extruder stepper
