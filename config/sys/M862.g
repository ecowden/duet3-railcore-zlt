; M862.g
;
; Set Open Loop
M569 P50.0 S1 D2     ; Y / Front
M569 P51.0 S1 D2     ; X / Rear

; Set speed and accel limits
M203 X{global.openLoopMaxSpeed} Y{global.openLoopMaxSpeed}      ; set maximum speeds (mm/min)
M201 X{global.openLoopMaxAccel} Y{global.openLoopMaxAccel}      ; set accelerations (mm/s^2)
M204 P{global.openLoopPrintAccel} T{global.openLoopTravelAccel} ; set acceleration for print moves and for travel moves

echo "Set Open Loop"