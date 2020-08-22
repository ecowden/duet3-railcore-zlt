; SmallMotionTest.g
; Move around the bed to test motion settings

if move.axes[2].machinePosition < 5                     ; if Z is low...
    G1 Z5                                               ; ...raise Z off the bed

; Move around half the bed counter-clockwise
while iterations < 1
    G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10} F4800  ; mm/s * 60 for mm/min
    G1 X{move.axes[0].max / 2 } Y{move.axes[1].min + 10} F4800  ; mm/s * 60 for mm/min
    G1 X{move.axes[0].max / 2 } Y{move.axes[1].max / 2 } F4800  ; mm/s * 60 for mm/min
    G1 X{move.axes[0].min + 10} Y{move.axes[1].max / 2 } F4800  ; mm/s * 60 for mm/min

G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10}     F4800  ; mm/s * 60 for mm/min
