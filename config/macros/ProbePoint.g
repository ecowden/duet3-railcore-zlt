; Probe a single point's Z height and report it

G92 Z0      ; Set current height to 0, regardless of position
G1 Z5       ; Lift Z a little
G30 S-1     ; Probe current position and report the result
