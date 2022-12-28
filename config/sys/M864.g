; M864.g
;
; Set Closed Loop
M569 P50.0 S1 D4     ; Y / Front
M569 P51.0 S1 D4     ; X / Rear

; Set speed and accel limits
M203 X{global.closedLoopMaxSpeed} Y{global.closedLoopMaxSpeed}      ; set maximum speeds (mm/min)
M201 X{global.closedLoopMaxAccel} Y{global.closedLoopMaxAccel}      ; set accelerations (mm/s^2)
M204 P{global.closedLoopPrintAccel} T{global.closedLoopTravelAccel} ; set acceleration for print moves and for travel moves

echo "Set Closed Loop"