; filament load
if tools[0].active[0] < 200                                    ; leave temp alone if already set hot enough
    G10 S210                                                   ; set extruder temp

M98 P"/sys/filament/feed.g"                                    ; invoke feed movement script