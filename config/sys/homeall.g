; homeall.g
; Home all axes

; Trinamic tuning for Z
; perform before X & Y, since X & Y tend to drop Z
G1 H2 Z0.0005           ; just enough movement to energize steppers
G4 P150                 ; pause for 150ms

M98 P"homex.g"
M98 P"homey.g"
M98 P"homez.g"