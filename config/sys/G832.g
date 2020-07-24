; G832.g
; Conditional variant of G32 bed command.
; Perform bed leveling if not already leveled.
if move.calibration.numFactors == 0             ; if leveling has not yet been performed...
    G32                                         ; level bed
    G28 Z                                       ; re-home Z
else
    echo "Bed already leveled. Skipping..."
