; filament unload
if tools[0].active[0] < 250                                    ; leave temp alone if already set hot enough
    G10 S250                                                   ; set extruder temp

M98 P"/sys/filament/unfeed.g"                                  ; invoke unfeed movement script
