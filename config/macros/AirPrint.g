; Airprint a box for belt adjustment. 
; First belts should be loose, almost dropping off. 

; Run the below code and the belts will vibrate like a guitar string.
; Tighten a little bit and repeat until the belts get to a point where they don’t vibrate.
; At that point, you’re done. IMPORTANT: Y-rail should always be parallel to the right extrusion.

if move.axes[2].machinePosition < 5                     ; if Z is low...
    G1 Z5                                               ; ...raise Z off the bed

G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10} F6000   ; move around bed 10mm inside limits
G1 X{move.axes[0].max - 10} Y{move.axes[1].min + 10} F6000
G1 X{move.axes[0].max - 10} Y{move.axes[1].max - 10} F6000
G1 X{move.axes[0].min + 10} Y{move.axes[1].max - 10} F6000
G1 X{move.axes[0].min + 10} Y{move.axes[1].min + 10} F6000   ; move back to home position