; CLTune.g
; Perform a closed loop tuning
; WARNING ensure the hotend is in a safe position first!

M569.6 P51.0 V1     ; Tune X / Rear
G4 P150             ; pause for 100ms
M569.6 P50.0 V1     ; Tune Y / Front