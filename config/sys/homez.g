; ***********************************************************
; Euclid Probe homez.g Example Macro
; RRF3.X Firmware Example
; saveas system/homez.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

var zProbePointX = 150 - {sensors.probes[0].offsets[0]}
var zProbePointY = 150 - {sensors.probes[0].offsets[1]}

if !move.axes[0].homed || !move.axes[1].homed     ; If the printer hasn't been homed, home it
   M98 P"0:/sys/homexy.g"  
M561                                              ; clear any bed transform
M290 S0 R0                                        ; clear baby steps 

; Trinamic tuning
; TODO make Trinamic tuning conditional in order to not throw off re-homing
; G1 H2 Z0.0005                                   ; just enough movement to energize steppers
; G4 P150                                         ; pause for 150ms

; G91                                               ; relative positioning
; G1 H2 Z6 F99999                                   ; lift Z relative to current position to clear any obstructions
; M400
; G90                                               ; absolute positioning
; echo "Call deployprobe.g macro" 
M401 P0                                           ; deploy probe
if sensors.probes[0].value[0]!=0
  abort "Probe not picked up! Z homing cancelled."

M558 F{global.fastProbeSpeedZ} T9000 A1           ; Start with a fast probe to get rough height

G1 X{var.zProbePointX} Y{var.zProbePointX} F99999 ; go to center of bed in advance of probe that point

G30                                               ; Probe the bed at the current XY position. When the probe is triggered, 
                                                  ; adjust the Z offset of the current tool to make the current position Z=0.
M400

M558 F{global.preciseProbeSpeedZ} T9000 A3 S0.01  ; Switch to precise probing for precision

G1 Z10                                            ; raise Z=10
M400

G4 P500
; echo "Call bedtram.g macro"
M98 P"0:/sys/bedtram.g"                           ; tram bed
; echo "Return"
G1 X{var.zProbePointX} Y{var.zProbePointX} F99999 ; go to center of bed in advance of probe that point
G30
; echo "Call retractprobe.g macro"
M402 P0                                           ; retract probe
; echo "Return"
G1 Z10 F99999                                     ; lift Z relative to current position
G90                                               ; absolute positioning
; M564 S1 H0                                      ; reset the bounding limits
G1 X100 Y50 F99999                                ; move carraige to a staging point