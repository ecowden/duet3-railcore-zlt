; filament load
if tools[0].active[0] < 250                                    ; leave temp alone if already set hot enough
    G10 S250                                                   ; set extruder temp

M98 P"/sys/filament/feed.g"                                    ; invoke feed movement script

; Perform a series of extrusions and waits to clean
G4 P1000                                                       ; wait one second
M400                                                           ; wait for completion
M292                                                           ; hide any message

M291 P"Cleaning..." R"Running Cleaning Routine" T5             ; display feed message

G1 E50 F400                                                    ; feed 50mm of filament at 400mm/min to purge old filament
G4 P3000                                                       ; wait three seconds

while iterations < 3
    G1 E25 F400                                                ; feed 25mm of filament at 400mm/min
    G4 P3000                                                   ; wait three seconds

    G1 E25 F100                                                ; feed 25mm of filament at 100mm/min
    G4 P3000                                                   ; wait three seconds

G1 E-1 F1800                                                   ; retract 1mm of filament at 1800mm/min
M292                                                           ; hide the message
M400                                                           ; wait for completion

M84 E                                                          ; turn off extruder motor