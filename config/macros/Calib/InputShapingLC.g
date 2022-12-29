; InputShapingLC.g
; Called per layer change with,
;   M98 P"0:/macros/Calib/InputShapingLC.g"
; To change input shaping settings per layer for calibration

var minHeight = 10                ; minimum height to start input shaping

if move.axes[2].machinePosition >= var.minHeight
  M593 P"zvd" F{move.axes[2].machinePosition}
  echo "Frequency: ", move.axes[2].machinePosition
