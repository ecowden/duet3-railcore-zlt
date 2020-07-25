; /sys/filament/unfeed.g
; Retract filament during unloading
; assumes that extruder is already at temperature
;
M83                     ; relative extruder moves
M116 P0                 ; Wait for the tool temperature to be reached
G1 E-20 F300            ; Retract 20mm of filament at 300mm/min
G1 E-200 F3000          ; Retract 200mm of filament at 3000mm/min
M400                    ; wait for completion
M292                    ; hide the message
G10 S0                  ; turn off heater
M84 E                   ; turn off extruder stepper
M290 R0 S0.00           ; reset babystepping to zero
