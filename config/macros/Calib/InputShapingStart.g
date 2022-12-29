; InputShapingStart.g
; Called per layer change with,
;   M98 P"0:/macros/Calib/InputShapingStart.g"
; To set initial input shaping settings for calibration

M593 P"none"                                 ; Start with input shaping disabled
echo "Input Shaping Disabled.", "Height: ", move.axes[2].machinePosition

M204 P8000 T8000                             ; set print and travel accelerations (mm/s^2) high to exagerate ghosting
