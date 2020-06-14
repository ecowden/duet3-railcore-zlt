; Perform mesh bed leveling and save mesh to a file

G91                         ; relative positioning
G1 Z5                       ; lift Z a little
M557 X10:295 Y10:295 S57    ; define mesh grid, elmoret's coordinates
G29 S3 P"heightmap.csv"     ; probe mesh and save as file
