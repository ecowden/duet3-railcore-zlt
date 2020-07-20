; G828.g
; Conditional variant of G28 home command.
; Homes all axes if not already homed.
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
    G28
