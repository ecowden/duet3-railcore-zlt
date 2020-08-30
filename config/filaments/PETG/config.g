; filament config
M207 S0.6 F1800 Z0.20                                     ; retraction at 0.6mm at 30mm/sec with 0.20mm Z-hop
M572 D0 S0.045   		                                  ; pressure advance, determined experimentally
; M290 R0 S0.10                                             ; set babystepping for a bit less squish

; PID Tuning
;
; Bed PID tuned at 85°C and 40% fan at 25mm z-height
; Heater 0 model: gain 274.2, time constant 701.2, dead time 8.9, max PWM 1.00, calibration voltage 23.8, mode PID
; Computed PID parameters for setpoint change: P51.4, I0.651, D319.5
; Computed PID parameters for load change: P51.4, I1.702, D319.5
M307 H0 A274.2 C701.2 D8.9 S1.0 V23.8 B0
;
; Hotend PID tuned at 240°C and 40% fan at 25mm z-height
; Heater 1 model: gain 489.1, time constant 165.7, dead time 3.1, max PWM 1.00, calibration voltage 23.8, mode PID
; Computed PID parameters for setpoint change: P19.4, I0.854, D42.3
; Computed PID parameters for load change: P19.4, I2.023, D42.3
M307 H1 A489.1 C165.7 D3.1 S1.0 V23.8 B0

echo "Configured PETG"                                    ; log configuration