; SmallMotionTest.g
; Move around the bed to test motion settings

;if move.axes[2].machinePosition < 25                     ; if Z is low...
;    G1 Z25                                               ; ...raise Z off the bed

var speed = 99999

; "Square" Pattern uses both steppers
G1 X100 Y100 F{var.speed}
G1 X200 Y100 F{var.speed}
G1 X200 Y200 F{var.speed}
G1 X100 Y200 F{var.speed}
G1 X100 Y100 F{var.speed}
