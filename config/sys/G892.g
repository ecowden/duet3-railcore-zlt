; G892.g
; Move Y Front stepper a number of rotations, relative
; WARNING this is for debugging and could be dangerous depending on machine locations
; This should really only be run when belts are not connected
; CW, then CCW

var mmPerRotation = 40
var speed = {200 * 60}                    ; Speed in mm/min
var rotations = 1                         ; Desired number of rotations

if (exists(param.R))
  set var.rotations = param.R

if (exists(param.S))
  set var.speed = param.S * 60

G1 X300 Y000 F{var.speed}                 ; Go to a safe space
M400                                      ; Wait for movement to complete
G4 P100                                   ; pause for 100ms so movements are separate

G91                                       ; relative positioning

G1 X{-1 * var.rotations * var.mmPerRotation } Y{var.rotations * var.mmPerRotation } F{var.speed}  ; Move rotations
M400

G90                                       ; absolute positioning