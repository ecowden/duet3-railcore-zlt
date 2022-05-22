; filament config
G4 P900                                                   ; wait a hair, otherwise RRF v3.4 may not show extruder heater in the UI

M207 S0.6 F1800 Z0.20                                     ; retraction at 0.6mm at 30mm/sec with 0.20mm Z-hop
M572 D0 S0.045   		                                  ; pressure advance, determined experimentally
M309 S0.03                                                ; set heater feed-forward, TODO may need adjustment for PETG
; M290 R0 S0.10                                             ; set babystepping for a bit less squish
echo "Configured PETG"                                    ; log configuration