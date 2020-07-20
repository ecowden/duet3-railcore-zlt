; filaments/Cleaning Filament/config.g
M207 S0.6 F1800 Z0.4                                      ; retraction at 0.6mm at 30mm/sec with 0.4mm Z-hop
M307 H1 A474.8 C134.2 D2.9 S1.0 V24.4 B0                  ; hot end PID tune at 250C with 30% fan
M572 D0 S0.050   		                                  ; pressure advance, determined experimentally
echo "Configured Cleaning Filament"                       ; log configuration

; PID tune result, 250°C @ 30% fan
; Heater 1 model: gain 474.8, time constant 134.2, dead time 2.9, max PWM 1.00, calibration voltage 24.4, mode PID
; Computed PID parameters for setpoint change: P17.3, I0.877, D35.3
; Computed PID parameters for load change: P17.3, I2.005, D35.3
