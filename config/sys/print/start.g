; /sys/print/start.g
; Perform all steps to prepare printing, including
; home, prepare bed, prime nozzle, etc.
;
G90                              ; use absolute coordinates
M83                              ; extruder relative mode

G828                             ; home if not homed
; G832                             ; if not already leveled, level bed and re-home Z

if sensors.probes[0].value[0]==0              ; if probe is deployed...
    ; stow probe

if sensors.probes[0].value[0]==0              ; if probe is still deployed...
  abort "Aborting print: probe is deployed!"  ; abort print