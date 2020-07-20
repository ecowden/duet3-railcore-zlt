; filaments/Atomic CF PETG/config.g
M207 S0.8 F2100 Z0.0                                      ; retraction at 0.8mm at 35mm/sec with 0.4mm Z-hop
M307 H1 A474.8 C134.2 D2.9 S1.0 V24.4 B0                  ; hot end PID tune at 250C with 30% fan
M572 D0 S0.050   		                                  ; pressure advance, determined @ 260°C, 0.6mm nozzle, 0.2mm layer height
echo "Configured Atomic CF PETG"                          ; log configuration

; PID tune result, 250°C @ 30% fan
; Heater 1 model: gain 474.8, time constant 134.2, dead time 2.9, max PWM 1.00, calibration voltage 24.4, mode PID
; Computed PID parameters for setpoint change: P17.3, I0.877, D35.3
; Computed PID parameters for load change: P17.3, I2.005, D35.3
