; /sys/print/end.g
; Clean up and shut down after a print
M400                            ; wait for moves to finish
M104 S0                         ; turn off temperature
M140 S0                         ; turn off heatbed
M107                            ; turn off fan
G1 X0 Y200 F6000                ; home X axis
M84                             ; disable motors
