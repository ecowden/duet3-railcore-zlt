; filament config
M207 S0.8 F2100 Z0.00                                     ; retraction at 0.8mm at 35mm/sec with 0.00mm Z-hop
M572 D0 S0.07   		                                  ; pressure advance, determined experimentally
; M290 R0 S0.05                                             ; set babystepping just a tad high since S3D squishes fat first layers a little too much
echo "Configured PLA"                                     ; log configuration
