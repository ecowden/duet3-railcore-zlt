;File     : bltouch-bed.g
;Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
;Use-case : The BL-touch is affected by magnets. This 4 point bed.g was created by Robert Hendricks to probe points in the nulls in the magnetic field.
;         : remove/rename the original bed.g and rename this file to 'bed.g' to activate.
;Source   : https://github.com/railcore/configs/blob/master/duet/sys/config-user%20examples/bltouch/bed.g

M561                                              ; clear any bed transform
M290 S0 R0                                        ; clear baby steps 

; Define Mesh bed leveling
M557 X25:285 Y40:280 P7:7		                      ; define bed mesh grid

if sensors.probes[0].value[0]!=0                  ; If probe is not deployed...
  M401 P0                                         ; ...deploy probe

M400                                              ; wait for completion

if sensors.probes[0].value[0]!=0                  ; Guard against failed probe deployment
  abort "Probe not picked up! Bed mesh cancelled."


; G1 Z15 H2                        ; Raise nozzel for clearance


M558 F{global.preciseProbeSpeedZ} H2 T99999 A1 S0.01  ; Be precise but fast
G29 S0                                                ; Probe bed

M402 P0                                               ; retract probe

; G30 P0 X105 Y93.7 Z-99999       ; Define 4 points in a clockwise direction around the bed
; G30 P1 X230 Y93.7 Z-99999
; G30 P2 X230 Y208.7 Z-99999
; G30 P3 X105 Y208.7 Z-99999 S3	; ...after fourth point, tram bed

; G1 X10 Y10 F99999               ; Go home ASAP