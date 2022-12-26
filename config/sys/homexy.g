; homexy.g
; called to home the X & Y axes
;
M561              ; clear bed transform
G91               ; relative positioning

; Trinamic tuning
M17 X Y Z         ; Energize X, Y & Z steppers (core xy uses both steppers to move straight, and we move the bed
G4 P150           ; pause for 150ms

G1 H2 Z5 F9999    ; lift Z relative to current position

; Home Y first to avoid possible Euclid collision
G1 H1 Y-350 F3000 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000       ; go back a few mm
G1 H1 Y-10 F600   ; move slowly to Y axis endstop once more (second pass)

; Home X
G1 H1 X-350 F3000 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000       ; go back a few mm
G1 H1 X-10 F600   ; move slowly to X axis endstop once more (second pass)

G1 H2 Z-5 F9999   ; lower Z again
G90               ; absolute positioning
