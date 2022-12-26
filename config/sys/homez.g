; homez.g
; Uses Euclid probe

var zProbePointX = 150 - {sensors.probes[0].offsets[0]}
var zProbePointY = 150 - {sensors.probes[0].offsets[1]}

M561                                              ; clear any bed transform
M290 S0 R0                                        ; clear baby steps 

; Trinamic tuning
M17 X Y Z         ; Energize X, Y & Z steppers (core xy uses both steppers to move straight, and we move the bed)
G4 P150           ; pause for 150ms

if !move.axes[0].homed || !move.axes[1].homed     ; If the printer hasn't been homed, home it
   M98 P"0:/sys/homexy.g"  

M401 P0                                           ; deploy probe
if sensors.probes[0].value[0]!=0
  abort "Probe not picked up! Z homing cancelled."

M558 F{global.fastProbeSpeedZ} T9000 A1           ; Start with a fast probe to get rough height

G1 X{var.zProbePointX} Y{var.zProbePointX} F99999 ; go to center of bed in advance of probe that point

G30                                               ; Probe the bed at the current XY position. When the probe is triggered, 
                                                  ; adjust the Z offset of the current tool to make the current position Z=0.
M400

M558 F{global.preciseProbeSpeedZ} T12000 A3 S0.01 ; Switch to precise probing for precision

G1 Z10                                            ; raise Z=10
M400

G4 P500

G32                                               ; tram bed while we have the probe deployed

; Re-probe Z after tramming
G1 X{var.zProbePointX} Y{var.zProbePointX} F99999 ; go to center of bed in advance of probing that point
G30

M402 P0                                           ; retract probe

G1 Z10 F99999                                     ; lift Z relative to current position
G90                                               ; absolute positioning
