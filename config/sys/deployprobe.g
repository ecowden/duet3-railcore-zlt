; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; RRF3.X Firmware Example
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************
;  __________________________________________________________________________
;  |                                                                        |
;  |  * Dock     * Dock Exit     * Dock Staging                             |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |  * Dock Side                                                           |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |  * Dock Preflight                                                      |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                * Probe Ready Position                  |
;  |                                  X150 Y150                             |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |________________________________________________________________________|
;
; Above is example 300x300 bed to coorelate with macros and movements below.
; This example is for a fixed dock, fixed gantry/carraige and moving bed motion system. 
; RailCore, Ender5, V-Core3, etc...
; coordinates are re-written below above the macros

if sensors.probes[0].value[0]!=1000
  abort "Deployprobe aborted, probe already mounted. Manually return probe to the dock."

echo "Running deployprobe.g"
if !move.axes[0].homed || !move.axes[1].homed     ; If the printer hasn't been homed, home it
    M98 P"0:/sys/homexy.g" 

; uncomment next line to echo the probe deploy state 
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

; TODO uncommend the following line after re-limiting axes
; M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                          ; relative positioning
echo "Lift Z in advance of deploy" 
G0 H2 Z{global.probeClearanceZ} F99999            ; move Z 15 for clearance above dock.
;                            ; need to figure out some safety check on this
G90                          ; absolute positioning

G0 X{global.dockPreflightX} Y{global.dockPreflightY} F99999    ; move to Preflight Position
M400                                                           ; wait for moves to finish

G0 X{global.dockSideX} Y{global.dockSideY} F12000              ; move to Dock Side dock location
M400                                                           ; wait for moves to finish

G0 X{global.dockX} Y{global.dockY} F3000                       ; move over Dock 
G4 P500                                                        ; pause 0.5 seconds
M400                                                           ; wait for moves to finish

G0 X{global.dockExitX} Y{global.dockExitY} F600                ; slide probe out of dock - slowly
G0 X{global.dockStagingX} Y{global.dockStagingY} F6000         ; move to re-entry position
M400                                                           ; wait for moves to finish

G0 X150 Y150 F99999                                            ; move to the center of the bed
M400                                                           ; wait for moves to finish

if sensors.probes[0].value[0]!=0
  abort "Probe not picked up! Deploy cancelled."
