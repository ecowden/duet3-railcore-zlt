; FastTest.g
; Move around the bed to test motion settings

var speed = {400 * 60}      ; speed in mm/min
var time = 2                ; time in seconds
var side = var.speed * var.time / 4 / 60
var offset = var.side / 2

; "Square" Pattern
; G1 X{150-var.offset} Y{150-var.offset} F{var.speed}
; G1 X{150+var.offset} Y{150-var.offset} F{var.speed}
; G1 X{150+var.offset} Y{150+var.offset} F{var.speed}
; G1 X{150-var.offset} Y{150+var.offset} F{var.speed}
; G1 X{150-var.offset} Y{150-var.offset} F{var.speed}

;echo "Speed:", var.speed, "Offset:", var.offset

; "Diamond" Pattern
G1 X{150} Y{150-var.offset} F{var.speed}
G1 X{150+var.offset} Y{150} F{var.speed}
G1 X{150} Y{150+var.offset} F{var.speed}
G1 X{150-var.offset} Y{150} F{var.speed}
G1 X{150} Y{150-var.offset} F{var.speed}