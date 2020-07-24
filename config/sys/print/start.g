; /sys/print/start.g
; Perform all steps to prepare printing, including
; home, prepare bed, prime nozzle, etc.
;
G90                              ; use absolute coordinates
M83                              ; extruder relative mode

G828                             ; home if not homed
G832                             ; if not already leveled, level bed and re-home Z

; prime nozzle
; G1 X0 Y0 F99999.0                ; Go home
; G1 Z0.15                         ; lower extruder
; G92 E0.0
; G1 X60.0 E9.0 F1000.0            ; intro line
; G1 X100.0 E12.5 F1000.0          ; intro line
; G92 E0.0
