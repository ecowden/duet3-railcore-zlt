; SlowTest.g
; Move around the bed to test motion settings

;if move.axes[2].machinePosition < 25                     ; if Z is low...
;    G1 Z25                                               ; ...raise Z off the bed

var speed = {100 * 60}      ; speed in mm/min
var time = 2                ; time in seconds
var side = var.speed * var.time / 4 / 60
var offset = var.side / 2

; "Square" Pattern
; G1 X{150-var.offset} Y{150-var.offset} F{var.speed}
; G1 X{150+var.offset} Y{150-var.offset} F{var.speed}
; G1 X{150+var.offset} Y{150+var.offset} F{var.speed}
; G1 X{150-var.offset} Y{150+var.offset} F{var.speed}
; G1 X{150-var.offset} Y{150-var.offset} F{var.speed}

; "Diamond" Pattern
G1 X{150} Y{150-var.offset} F{var.speed}
G1 X{150+var.offset} Y{150} F{var.speed}
G1 X{150} Y{150+var.offset} F{var.speed}
G1 X{150-var.offset} Y{150} F{var.speed}
G1 X{150} Y{150-var.offset} F{var.speed}