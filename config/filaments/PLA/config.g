; filament config
M207 S0.6 F1800 Z0.18                                     ; retraction at 0.6mm at 30mm/sec with 0.18mm Z-hop
M307 H1 A329.7 C105.6 D2.4 S1.0 V23.8 B0                  ; hot end PID tune at 215C with 100% fan
M572 D0 S0.06   		                                  ; pressure advance, determined experimentally
M290 R0 S0.00                                             ; set babystepping flat
echo "Configured PLA"                                     ; log configuration
