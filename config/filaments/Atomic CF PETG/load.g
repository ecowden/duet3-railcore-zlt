; filaments/Atomic CF PETG/load.g
if tools[0].active[0] < 245                                    ; leave temp alone if already set hot enough
    G10 S245                                                   ; set extruder temp to 245C

M291 P"Heating nozzle..." R"Loading Atomic CF PETG" T5         ; display heating message
M116                                                           ; wait to reach temp

M291 P"Feeding filament..." R"Loading Atomic CF PETG" T5       ; display feed message
M98 P"/sys/filament/feed.g"                                    ; invoke feed movement script