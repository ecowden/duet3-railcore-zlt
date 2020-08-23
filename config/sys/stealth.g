; stealth.g
; Switch X&Y into StealthChop mode and perform Trinamic autotuning

G828                    ; home if not homed
G1 X10 Y10 F9999        ; go home ASAP
M400                    ; wait for moves to finish
G4 P200                 ; pause for 200ms

; Switch steppers into StealthChop
M569 P0.1 D3            ; Y / Front
M569 P0.2 D3            ; X / Rear

; Trinamic StealthChop Autotuning Procedure
G4 P200                 ; Step 1: pause for 200ms

; Step 2: make a series of moderate speed moves that produce back-emf,
;         but which stay under the threshhold from switching to SpreadCycle
G1 X60  Y60  F1200      
G1 X10  Y120 F1200
G4 P200                 ; pause for 200ms
G1 X60  Y60  F1000
G1 X10  Y10  F1000
G4 P200                 ; pause for 200ms

; Make some faster moves that switch into SpreadCycle just for funzies (utterly unnecessary)
G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10} F6000  ; 100 mm/sec box
G1 X{move.axes[0].max / 2 } Y{move.axes[1].min + 10} F6000
G1 X{move.axes[0].max / 2 } Y{move.axes[1].max / 2 } F6000
G1 X{move.axes[0].min + 10} Y{move.axes[1].max / 2 } F6000
G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10} F6000
