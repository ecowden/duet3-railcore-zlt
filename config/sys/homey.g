; homey.g
; called to home the Y axis
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Sat Jun 13 2020 15:20:34 GMT-0500 (Central Daylight Time)
G91               ; relative positioning
G1 H2 Z5 F6000    ; lift Z relative to current position
G1 H1 Y-350 F3000 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000       ; go back a few mm
G1 H1 Y-10 F600   ; move slowly to Y axis endstop once more (second pass)
G1 H2 Z-5 F6000   ; lower Z again
G90               ; absolute positioning

