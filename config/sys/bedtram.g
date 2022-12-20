; ***********************************************************
; Euclid Probe Independant Screw Leveling Macro
; could save it as conventional bed.g but for illustration purposes 
; the name is purposefully altered
; comments and echo statements throughout are provided for convenience
; ***********************************************************
; probe is -16.4 in X -29.4 in Y bed is 290 in X 325 in Y
; locations of probe points are at 
; (18, 285)     (270,285)
;
; (18,65)       (270,65)
;
; adjust coords so that probe hits symmetric points on the bed and avoids dock
;
; echo "Running bed4point.g"
; M558 F60 A3                              ; fix probe speed to 1mm/s


if sensors.probes[0].value[0]!= 0
    echo "Probe Value =" ^sensors.probes[0].value[0]
    echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "bedtram: Probe not currently picked up!"

G90
G4 P250

var xMin = 25
var yMin = 40

var xMax = 285
var yMax = 285

G30 P0 X{var.xMin} Y{var.yMin} F9000.0 Z-99999       ; probe front left

G30 P1 X{var.xMin} Y{var.yMax} F9000.0 Z-99999       ; probe back left

G30 P2 X{var.xMax} Y{var.yMax} F9000.0 Z-99999       ; probe back right

G30 P3 X{var.xMax} Y{var.yMin} F9000.0 Z-99999 S3    ; probe near front right leadscrew and calibrate 3 motors

; echo "bedtram.g complete" 