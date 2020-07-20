; filaments/Cleaning Filament/unload.g
if tools[0].active[0] < 215                                       ; leave temp alone if already set hot enough
    G10 S250                                                      ; set extruder temp to 250C

M291 P"Heating nozzle..." R"Unloading Cleaning Filament" T5       ; display heating message
M116                                                              ; wait to reach temp

M291 P"Retracting filament..." R"Unloading Cleaning Filament" T5  ; display unfeed message
M98 P"/sys/filament/unfeed.g"                                     ; invoke unfeed movement script
