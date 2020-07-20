; filaments/Cleaning Filament/load.g
if tools[0].active[0] < 215                                    ; leave temp alone if already set hot enough
    G10 S250                                                   ; set extruder temp to 250C

M291 P"Heating nozzle..." R"Loading Cleaning Filament" T5      ; display heating message
M116                                                           ; wait to reach temp

M291 P"Feeding filament..." R"Loading Cleaning Filament" T5    ; display feed message
M83                                                            ; relative extruder moves
G1 E10 F400                                                    ; feed 10mm of filament at 400mm/min
G1 E60 F900                                                    ; feed 60mm of filament at 900mm/min
G1 E20 F100                                                    ; feed 20mm of filament at 100mm/min

G4 P1000                                                       ; wait one second
M400                                                           ; wait for completion
M292                                                           ; hide the message

M291 P"Cleaning..." R"Running Cleaning Routine" T5             ; display feed message

G1 E50 F400                                                    ; feed 50mm of filament at 400mm/min to purge old filament
G4 P3000                                                       ; wait three seconds

while iterations < 3
    G1 E20 F400                                                ; feed 20mm of filament at 400mm/min
    G4 P3000                                                   ; wait three seconds

    G1 E20 F100                                                ; feed 20mm of filament at 100mm/min
    G4 P3000                                                   ; wait three seconds

G1 E-1 F1800                                                   ; retract 1mm of filament at 1800mm/min
M292                                                           ; hide the message
M400                                                           ; wait for completion

M84 E                                                          ; turn off extruder stepper
