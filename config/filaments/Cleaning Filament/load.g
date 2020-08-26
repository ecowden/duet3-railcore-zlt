; filament load
if tools[0].active[0] < 250                                    ; leave temp alone if already set hot enough
    G10 S250                                                   ; set extruder temp

M98 P"/sys/filament/feed.g"                                    ; invoke feed movement script

; Perform a series of extrusions to clean
echo "Running Cleaning Routine..."                             ; display feed message

G1 E100 F300                                                   ; feed 100mm of filament at 300mm/min to purge old filament

G1 E-1 F1800                                                   ; retract 1mm of filament at 1800mm/min
M400                                                           ; wait for completion

M84 E                                                          ; turn off extruder motor