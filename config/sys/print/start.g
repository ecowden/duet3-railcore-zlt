; /sys/print/start.g
; Perform all steps to prepare printing, including
; home, prepare bed, prime nozzle, etc.
;
G90                              ; use absolute coordinates
M83                              ; extruder relative mode

G828                             ; home if not homed

if (exists(param.A) && exists(param.B) && exists(param.C) && exists(param.D))
  if (exists(param.E) && exists(param.F))
    G29 A{param.A} B{param.B} C{param.C} D{param.D} E{param.E} F{param.F}
  else
    G29 A{param.A} B{param.B} C{param.C} D{param.D}
else
  G29

if sensors.probes[0].value[0]==0              ; if probe is deployed...
  M402 P0                                     ; ...stow probe

if sensors.probes[0].value[0]==0              ; if probe is still deployed...
  abort "Aborting print: probe is deployed!"  ; ...abort print

M116                                          ; Wait for heater to reach set temp