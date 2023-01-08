; Perform a bed mesh
; Deploy the probe if it is not already deployed.
; Leave the probe deployed if it started deployed.

; Parameters:
;
; Mesh params specify coordinates for a mesh. Use these to specify a specific mesh area, like to only
; probe the print area. If unspecified, probes the whole bed.
;
; A      xMin
; B      xMax
; C      yMin
; D      yMax
; E      number of points along the X axis
; E                             ... Y axis

var wholeBedNumPoints = 8                                     ; number of points in each direction when performing a whole bed mesh
var defaultSpacingMm = 20                                     ; millimeters between points when performing a print mesh
var maxPoints = 15                                            ; maximum number of points per axis in a print mesh

; safe probing limits
var safeMinX = 5
var safeMaxX = 295
var safeMinY = 40
var safeMaxY = 300

var probeStartedDeployed = (sensors.probes[0].value[0] == 0) ; Store starting probe state so we can return to it at the end

M561                                                         ; clear any bed transform
M290 S0 R0                                                   ; clear baby steps 

if sensors.probes[0].value[0]!=0                             ; If probe is not deployed...
  M401 P0                                                    ; ...deploy probe

M400                                                         ; wait for completion

if sensors.probes[0].value[0]!=0                             ; Guard against failed probe deployment
  abort "Aborting mesh: Probe not deployed!"

M558 F{global.preciseProbeSpeedZ} H1.2 T99999 A1 S0.01       ; Probe from 1.2mm high at precise speed once per point

; perform a print mesh
if (exists(param.A) && exists(param.B) && exists(param.C) && exists(param.D))
  var xMin = max(var.safeMinX,param.A)
  var xMax = min(var.safeMaxX,param.B)
  var yMin = max(var.safeMinY,param.C)
  var yMax = min(var.safeMaxY,param.D)

  if (exists(param.E) && exists(param.F))                                    ; if number of points point is specified...
    echo "Performing a print-specific mesh: ", "xMin=", var.xMin, "xMax=", var.xMax, "yMin=", var.yMin, "yMax=", var.yMax, "nX=", param.E, "nY=", param.F
    M557 X{param.A,param.B} Y{param.C,param.D} P{param.E,param.F}            ; define print mesh grid using it
  else                                                                       ; otherwise...
    var distanceX = var.xMax - var.xMin
    var distanceY = var.yMax - var.yMin
    var nPointsX = max(floor(min(var.distanceX / var.defaultSpacingMm, var.maxPoints)),2)
    var nPointsY = max(floor(min(var.distanceY / var.defaultSpacingMm, var.maxPoints)),2)
    echo "Performing a print-specific mesh: ", "xMin=", var.xMin, "xMax=", var.xMax, "yMin=", var.yMin, "yMax=", var.yMax, "nX=", var.nPointsX, "nY=", var.nPointsY
    M557 X{param.A,param.B} Y{param.C,param.D} P{var.nPointsX,var.nPointsY} ; define print mesh grid with default point spacing
    
    var nPoints = var.nPointsX * var.nPointsY
    if var.nPoints < (var.wholeBedNumPoints * var.wholeBedNumPoints / 2)    ; if there are a small number of points...
      M558 A3                                                               ; ...be extra precise when probing

; perform a whole bed mesh
else
  if (exists(param.E) && exists(param.F))                                    ; if number of points point is specified...
    var nPoints = param.E * param.F
    echo "Performing a whole-bed mesh: ", "nPoints=", var.nPoints
    M557 X{var.safeMinX,var.safeMaxX} Y{var.safeMinY,var.safeMaxY} P{param.E,param.F}            ; define bed mesh grid using specified number of points
  else
    M557 X{var.safeMinX,var.safeMaxX} Y{var.safeMinY,var.safeMaxY} P{var.wholeBedNumPoints}  ; define bed mesh grid with defaults

G29 S0                                                       ; Probe bed

if !var.probeStartedDeployed                                 ; If probe was undeployed when this process began...
  M402 P0                                                    ; ...retract probe
