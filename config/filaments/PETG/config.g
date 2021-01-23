; filament config
M207 S0.6 F1800 Z0.20                                     ; retraction at 0.6mm at 30mm/sec with 0.20mm Z-hop
M572 D0 S0.045   		                                  ; pressure advance, determined experimentally
; M290 R0 S0.10                                             ; set babystepping for a bit less squish
echo "Configured PETG"                                    ; log configuration