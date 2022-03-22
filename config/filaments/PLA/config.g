; filament config
M207 S0.8 F2700 T2400 Z0.18                               ; retraction at 0.8mm at 45mm/sec, un-retraction at 40mm/sec, with 0.18mm Z-hop
                                                          ;   from JohnOFC on Discord, 3/19/2022
M572 D0 S0.09   		                                  ; pressure advance, determined experimentally
M309 S0.03                                                ; set heater feed-forward
; M290 R0 S0.05                                             ; set babystepping just a tad high since S3D squishes fat first layers a little too much
echo "Configured PLA"                                     ; log configuration
