; filament unload
if tools[0].active[0] < 230                                    ; leave temp alone if already set hot enough
    G10 S230                                                   ; set extruder temp

M98 P"/sys/filament/unfeed.g"                                  ; invoke unfeed movement script
