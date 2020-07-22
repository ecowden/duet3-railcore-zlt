; /sys/print/end.g
; Clean up and shut down after a print
M400                                        ; wait for moves to finish
M104 S0                                     ; turn off temperature
M140 S0                                     ; turn off heatbed
M107                                        ; turn off fan

; Drop Z, being careful near the max
if move.axes[2].machinePosition + 40 < move.axes[2].max
    G1 Z{ move.axes[2].machinePosition + 40 }
else
    G1 Z{ move.axes[2].max }

G1 X10 Y{ move.axes[1].max / 2 } F6000      ; move extruder out of the way

M84                                         ; disable motors
