; ResonanceTest.g
; Identify and test resonant stepper speeds

G1 X10  Y10  F99999     ; Go home ASAP

G1 X60  Y60  F1000      ; Test for resonance at the given speed
G1 X10  Y120 F1100

G1 X10  Y10  F99999     ; Go home ASAP

G1 X60  Y60  F1200      ; Test for resonance at the given speed
G1 X10  Y120 F1300

G1 X10  Y10  F99999     ; Go home ASAP
