; Perform a bed mesh
; Deploy the probe if it is not already deployed.
; Leave the probe deployed if it started deployed.

M561                                                         ; clear any bed transform
M290 S0 R0                                                   ; clear baby steps 

; Define Mesh bed leveling
M557 X25:285 Y40:280 P7:7		                             ; define bed mesh grid

var probeStartedDeployed = (sensors.probes[0].value[0] == 0) ; Store starting probe state so we can return to it at the end

if sensors.probes[0].value[0]!=0                             ; If probe is not deployed...
  M401 P0                                                    ; ...deploy probe

M400                                                         ; wait for completion

if sensors.probes[0].value[0]!=0                             ; Guard against failed probe deployment
  abort "Probe not picked up! Bed mesh cancelled."

M558 F{global.preciseProbeSpeedZ} H2 T99999 A1 S0.01         ; Probe from 2mm high at precise speed once per point
G29 S0                                                       ; Probe bed

if !var.probeStartedDeployed                                 ; If probe was undeployed when this process began...
  M402 P0                                                    ; ...retract probe
