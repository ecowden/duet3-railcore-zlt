;File     : bltouch-bed.g
;Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
;Use-case : The BL-touch is affected by magnets. This 4 point bed.g was created by Robert Hendricks to probe points in the nulls in the magnetic field.
;         : remove/rename the original bed.g and rename this file to 'bed.g' to activate.
;Source   : https://github.com/railcore/configs/blob/master/duet/sys/config-user%20examples/bltouch/bed.g

M561                            ; clear any existing bed transform
G1 Z5 H2                        ; Raise nozzel for clearance
G30 P0 X102.7 Y81.5 Z-99999		; Define 4 points in a clockwise direction around the bed																	
G30 P1 X227.7 Y81.5 Z-99999																			
G30 P2 X227.7 Y196.5 Z-99999																			
G30 P3 X102.7 Y196.5 Z-99999 S3	; ...after fourth point, tram bed																		
G1 X10 Y10 F5000                ; Go home