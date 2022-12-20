; filament config
G4 P900                                                   ; wait a hair, otherwise RRF v3.4 may not show extruder heater in the UI
; M207 S0.8 F2700 T2400 Z0.18                             ; retraction at 0.8mm at 45mm/sec, un-retraction at 40mm/sec, with 0.18mm Z-hop
                                                          ;   from JohnOFC on Discord, 3/19/2022
M207 S0.8 F2700 T2400 Z0.00                               ; retraction at 0.8mm at 45mm/sec, un-retraction at 40mm/sec, with 0.00mm Z-hop
M572 D0 S0.07   		                                  ; pressure advance, determined experimentally
M309 S0.030                                               ; set heater feed-forward

echo "Configured PLA"                                     ; log configuration
