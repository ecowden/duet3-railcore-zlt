; SpeedTest.g
; Move around the bed to test motion settings

if move.axes[2].machinePosition < 5                     ; if Z is low...
    G1 Z5                                               ; ...raise Z off the bed

; Move around the bed counter-clockwise
while iterations < 2
    G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10} F99999   ; move at max allowable speeds
    G1 X{move.axes[0].max - 10} Y{move.axes[1].min + 10} F99999
    G1 X{move.axes[0].max - 10} Y{move.axes[1].max - 10} F99999
    G1 X{move.axes[0].min + 10} Y{move.axes[1].max - 10} F99999

G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10}     F99999   ; move back to home position
