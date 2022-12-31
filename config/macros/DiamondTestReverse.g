; DiamondTest.g
; Move around the bed to test motion settings

var speed = {200 * 60}      ; speed in mm/min

; Move in a "Diamond" Pattern
G1 X150  Y50 F{var.speed} ; 5
G1 X50  Y150 F{var.speed} ; 4
G1 X150 Y250 F{var.speed} ; 3
G1 X250 Y150 F{var.speed} ; 2
G1 X150 Y50  F{var.speed} ; 1
