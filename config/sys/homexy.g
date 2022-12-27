; homexy.g
; called to home the X & Y axes
;
M561              ; clear bed transform
G91               ; relative positioning

; --- Traditional Homing in Open Loop Mode -------------------------------------

; Trinamic tuning
M17 X Y Z         ; Energize X, Y & Z steppers (core xy uses both steppers to move straight, and we move the bed
G4 P150           ; pause for 150ms

G1 H2 Z5 F9999    ; lift Z relative to current position

; Set open loop mode
M569 P50.0 D2     ; Y / Front
M569 P51.0 D2     ; X / Rear

; Home Y first to avoid possible Euclid collision
G1 H1 Y-350 F3000 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000       ; go back a few mm
G1 H1 Y-10 F600   ; move slowly to Y axis endstop once more (second pass)

; Home X
G1 H1 X-350 F3000 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000       ; go back a few mm
G1 H1 X-10 F600   ; move slowly to X axis endstop once more (second pass)

G90               ; absolute positioning

; --- Closed Loop Tuning--------------------------------------------------------

G1 X150 Y150      ; Go to a safe position in the middle of the bed

; Set closed loop mode
M569 P50.0 D4     ; Y / Front
M569 P51.0 D4     ; X / Rear

M917 X0 Y0        ; Set the closed loop axes to have a holding current of zero

M569.6 P50.0 V1   ; Tune Y
M569.6 P51.0 V1   ; Tune X

; --- Clean Up -----------------------------------------------------------------
G1 H2 Z-5 F9999   ; lower Z again


