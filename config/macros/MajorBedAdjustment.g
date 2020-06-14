; Run after performing major work on the bed.
; Performs a leveling by measuring a smaller inner section of the bed to 
; avoid issues traveling far over a majorly unleveled bed.
;
; By cheeseandham, Railcore Discord, June 13 2020
;
; May want to do a G30 probe at the start, in the middle of the points (unless there's a magnet there)

M671 S20 
M558 S20
G30 P0 X125 Y125 Z-99999
G30 P1 X125 Y175 Z-99999
G30 P2 X150 Y150 Z-99999 S3
M671 S7.5 ; or whatever your default is
M558 S7.5 ; or whatever your default is


