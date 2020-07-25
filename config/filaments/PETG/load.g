; filament load
if tools[0].active[0] < 230                                    ; leave temp alone if already set hot enough
    G10 S230                                                   ; set extruder temp

M98 P"/sys/filament/feed.g"                                    ; invoke feed movement script
