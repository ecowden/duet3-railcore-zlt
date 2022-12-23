; configprobe.g
; Configure Euclid probe

; Configure coordinates for key probe locations
global dockX = -15
global dockY = 306.5

global dockSideX = {global.dockX}
global dockSideY = {global.dockY - 30}

global dockPreflightX = {global.dockX}
global dockPreflightY = {global.dockY - 100}

global dockExitX = {global.dockX + 40}
global dockExitY = {global.dockY}

global dockStagingX = {global.dockX + 70}
global dockStagingY = {global.dockY}

global probeReadyX = 150
global probeReadyY = 150

; Z Offset is bed height when probe makes contact
var zOffset = 7.70
global probeClearanceZ    = var.zOffset + 5                 ; How far to lift to avoid crashing the Euclid into the bed
global fastProbeSpeedZ    = 300                             ; Fast speed when first homing and bed may be low from previous print
global preciseProbeSpeedZ = 120                             ; Precise speed when for fine-grained homing

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

M574 Z1 S2                                   ; configure Z-probe endstop for low end on Z

; Z-Probe
M558 K0 P5 C"^io6.in" H4 F{global.fastProbeSpeedZ} T9000 A3 S0.01      
                                              ; K0 for probe 0, P5 for NC switch, C for input pin, 
                                              ; ^ for enabling the native pullup resistor on Duet
                                              ; hardware running RRF3  
                                              ; H dive height of 4mm, F300 probing speed 5mm/sec, 
                                              ; T9000 travel speed 150mm/sec,   
                                              ; A3 number of probes 1, S0.01 max tolerance of 0.01 

G31 K0 P500 X7.0 Y35.8 Z{var.zOffset}         ; CHECK for LOOSE things first! set Z probe trigger 
                                              ; value, offset and trigger height.  Higher numbers
                                              ; makes nozzle closer to bed
                                              ; switch plunger is 16.4mm to the LEFT and 29.27mm in
                                              ; FRONT of the nozzle. Switch triggers 0.9mm BELOW nozzle
                                              ; https://duet3d.dozuki.com/Wiki/Test_and_calibrate_the_Z_probe#Section_Fine_tuning_the_trigger_height
                                              ; if you have to move the nozzle away from the bed, 
                                              ; decrease the G31 Z value by the amount of baby stepping used.

; Old settings
; M558 P9 C"^io7.in" H5 F120 T99999           ; set Z probe type to bltouch and the dive height + speeds
; G31 P500 X-3.8 Y35.1 Z3.25                  ; set Z probe trigger value, offset and trigger height
