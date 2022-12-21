; bed.g
; Perform a 4-point probe and tram the bed.
; Probe should start and end in the same state. If it starts deployed, leave it deployed. It it starts stowed, re-stow it after use.

; Probe coordinates
var xMin = 25
var yMin = 40
var xMax = 285
var yMax = 285

var probeStartedDeployed = (sensors.probes[0].value[0] == 0) ; Store starting probe state so we can return to it at the end

if sensors.probes[0].value[0]!=0                             ; If probe is not deployed...
  M401 P0                                                    ; ...deploy probe

if sensors.probes[0].value[0]!=0                             ; safety check that probe is deployed
    abort "bed.g: Probe not deployed!"

G90                                                          ; absolute positioning
G4 P250

G30 P0 X{var.xMin} Y{var.yMin} F9000.0 Z-99999               ; probe front left
G30 P1 X{var.xMin} Y{var.yMax} F9000.0 Z-99999               ; probe back  left
G30 P2 X{var.xMax} Y{var.yMax} F9000.0 Z-99999               ; probe back  right
G30 P3 X{var.xMax} Y{var.yMin} F9000.0 Z-99999 S3            ; probe front right and calibrate 3 motors

if !var.probeStartedDeployed                                 ; If probe was undeployed when this process began...
  M402 P0                                                    ; ...retract probe.