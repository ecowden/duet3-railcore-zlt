; DoubleStep.g
; Test Ripple by halving the number of steps per millimeter so that the machine moves
; twice as far as calculated. If the issue is mechanical, the period should stay. If
; it's computational, the period of the Ripple should double.

; Reminder: home and level the bed first. This
; must be done beforehand, since we'll lost access to the 
; accurate coordinates of the bed magnets.
; (TODO change probe positions, too, and eliminate this prerequisite.)
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed ; home first
    M291 R"Error!" R"Home before starting DoubleStep mode" S3

if move.calibration.numFactors == 0                                  ; level fist
    M291 R"Error!" R"Run leveling routine before starting DoubleStep mode" S3

if move.axes[0].stepsPerMm < 400                                     ; Don't run it twice!
    M291 R"Error!" R"Make sure you don't run this twice!" S3

if move.axes[2].machinePosition < 5                  ; ensure nozzle is off the print bed to avoid a big blob
    G1 Z5
G1 X10 Y10                                           ; Make sure head is in the "good" part of the bed
M400                                                 ; wait for completion

M92  X{move.axes[0].stepsPerMm*2}   Y{move.axes[1].stepsPerMm*2}    ; set steps per mm to half normal
M203 X{move.axes[0].speed/2}        Y{move.axes[1].speed/2}         ; set maximum speeds (mm/min)
M201 X{move.axes[0].acceleration/2} Y{move.axes[1].acceleration/2}  ; set accelerations (mm/s^2)
M566 X{move.axes[0].jerk/2}         Y{move.axes[1].jerk/2}          ; set maximum jerk (instantaneous speed changes) (mm/min)
; M208 X{move.axes[0].max/2}       Y{move.axes[1].max/2}    S0      ; set axis maxima...I don't understand why this doesn't work...
M208 X150 Y142 Z615   S0                                            ; ...so set axis maxima manually instead
M204 P{500/2} T{2000/2}                                             ; set print and move accelerations, not in object model?

M221 S200                                            ; Double extrusion multiplier to match doubled movement 