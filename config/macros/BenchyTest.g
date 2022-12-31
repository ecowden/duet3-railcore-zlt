; BenchyTest.g
; Benchy Perimiter Test
; Move X & Y in one layer of the 3D Benchy Perimeter
; Use this as a short but somewhat real world motion test

var speed = {150 * 60}                           ; set speed in mm/min
var inner = false                                ; if true, use the inner perimeter
var outer = true                                 ; if true, use the outer perimeter

; layer 42, Z = 6.3000
; feature inner perimeter
if var.inner
    G1 X122.552 Y158.773 F{var.speed}
    G1 X122.398 Y158.630 F{var.speed}
    G1 X122.272 Y158.452 F{var.speed}
    G1 X122.182 Y158.245 F{var.speed}
    G1 X122.128 Y157.998 F{var.speed}
    G1 X122.117 Y157.819 F{var.speed}
    G1 X122.116 Y156.280 F{var.speed}
    G1 X122.118 Y154.888 F{var.speed}
    G1 X122.118 Y154.664 F{var.speed}
    G1 X122.117 Y154.429 F{var.speed}
    G1 X122.117 Y152.928 F{var.speed}
    G1 X122.118 Y151.960 F{var.speed}
    G1 X122.117 Y151.752 F{var.speed}
    G1 X122.117 Y150.610 F{var.speed}
    G1 X122.589 Y151.187 F{var.speed}
    G1 X122.822 Y151.388 F{var.speed}
    G1 X123.086 Y151.545 F{var.speed}
    G1 X123.388 Y151.660 F{var.speed}
    G1 X123.828 Y151.726 F{var.speed}
    G1 X124.272 Y151.679 F{var.speed}
    G1 X124.578 Y151.577 F{var.speed}
    G1 X124.848 Y151.432 F{var.speed}
    G1 X125.091 Y151.242 F{var.speed}
    G1 X125.296 Y151.011 F{var.speed}
    G1 X125.457 Y150.748 F{var.speed}
    G1 X125.569 Y150.459 F{var.speed}
    G1 X125.626 Y150.151 F{var.speed}
    G1 X125.623 Y149.810 F{var.speed}
    G1 X125.526 Y149.406 F{var.speed}
    G1 X125.382 Y149.117 F{var.speed}
    G1 X125.190 Y148.857 F{var.speed}
    G1 X124.862 Y148.575 F{var.speed}
    G1 X124.578 Y148.423 F{var.speed}
    G1 X124.287 Y148.326 F{var.speed}
    G1 X123.982 Y148.281 F{var.speed}
    G1 X123.675 Y148.288 F{var.speed}
    G1 X123.374 Y148.346 F{var.speed}
    G1 X123.072 Y148.461 F{var.speed}
    G1 X122.712 Y148.696 F{var.speed}
    G1 X122.117 Y149.306 F{var.speed}
    G1 X122.117 Y147.498 F{var.speed}
    G1 X122.117 Y146.951 F{var.speed}
    G1 X122.117 Y146.054 F{var.speed}
    G1 X122.118 Y145.026 F{var.speed}
    G1 X122.116 Y143.371 F{var.speed}
    G1 X122.118 Y142.133 F{var.speed}
    G1 X122.142 Y141.912 F{var.speed}
    G1 X122.208 Y141.683 F{var.speed}
    G1 X122.310 Y141.485 F{var.speed}
    G1 X122.445 Y141.319 F{var.speed}
    G1 X122.621 Y141.179 F{var.speed}
    G1 X122.735 Y141.116 F{var.speed}
    G1 X122.861 Y141.068 F{var.speed}
    G1 X123.134 Y141.014 F{var.speed}
    G1 X139.183 Y139.429 F{var.speed}
    G1 X147.994 Y138.543 F{var.speed}
    G1 X148.782 Y138.484 F{var.speed}
    G1 X149.571 Y138.452 F{var.speed}
    G1 X150.363 Y138.448 F{var.speed}
    G1 X151.159 Y138.472 F{var.speed}
    G1 X151.956 Y138.524 F{var.speed}
    G1 X152.708 Y138.599 F{var.speed}
    G1 X153.347 Y138.684 F{var.speed}
    G1 X154.143 Y138.815 F{var.speed}
    G1 X154.930 Y138.973 F{var.speed}
    G1 X156.114 Y139.268 F{var.speed}
    G1 X156.846 Y139.484 F{var.speed}
    G1 X157.418 Y139.673 F{var.speed}
    G1 X158.611 Y140.121 F{var.speed}
    G1 X159.731 Y140.614 F{var.speed}
    G1 X160.827 Y141.171 F{var.speed}
    G1 X161.518 Y141.562 F{var.speed}
    G1 X162.037 Y141.878 F{var.speed}
    G1 X163.083 Y142.576 F{var.speed}
    G1 X164.068 Y143.314 F{var.speed}
    G1 X165.014 Y144.108 F{var.speed}
    G1 X165.463 Y144.518 F{var.speed}
    G1 X166.053 Y145.092 F{var.speed}
    G1 X166.477 Y145.533 F{var.speed}
    G1 X167.027 Y146.141 F{var.speed}
    G1 X167.539 Y146.752 F{var.speed}
    G1 X167.917 Y147.232 F{var.speed}
    G1 X168.416 Y147.909 F{var.speed}
    G1 X168.863 Y148.566 F{var.speed}
    G1 X169.202 Y149.097 F{var.speed}
    G1 X169.536 Y149.663 F{var.speed}
    G1 X169.589 Y149.790 F{var.speed}
    G1 X169.616 Y149.906 F{var.speed}
    G1 X169.623 Y150.019 F{var.speed}
    G1 X169.609 Y150.131 F{var.speed}
    G1 X169.575 Y150.250 F{var.speed}
    G1 X169.507 Y150.392 F{var.speed}
    G1 X169.112 Y151.047 F{var.speed}
    G1 X168.665 Y151.730 F{var.speed}
    G1 X168.193 Y152.399 F{var.speed}
    G1 X167.842 Y152.865 F{var.speed}
    G1 X167.046 Y153.837 F{var.speed}
    G1 X166.216 Y154.742 F{var.speed}
    G1 X165.335 Y155.601 F{var.speed}
    G1 X164.407 Y156.411 F{var.speed}
    G1 X163.437 Y157.168 F{var.speed}
    G1 X162.427 Y157.872 F{var.speed}
    G1 X161.381 Y158.518 F{var.speed}
    G1 X160.303 Y159.105 F{var.speed}
    G1 X159.194 Y159.630 F{var.speed}
    G1 X158.063 Y160.095 F{var.speed}
    G1 X156.909 Y160.495 F{var.speed}
    G1 X155.739 Y160.833 F{var.speed}
    G1 X154.555 Y161.106 F{var.speed}
    G1 X153.765 Y161.251 F{var.speed}
    G1 X152.968 Y161.369 F{var.speed}
    G1 X152.373 Y161.437 F{var.speed}
    G1 X151.575 Y161.504 F{var.speed}
    G1 X150.822 Y161.541 F{var.speed}
    G1 X150.183 Y161.554 F{var.speed}
    G1 X149.390 Y161.543 F{var.speed}
    G1 X148.600 Y161.505 F{var.speed}
    G1 X148.011 Y161.458 F{var.speed}
    G1 X123.122 Y158.985 F{var.speed}
    G1 X122.957 Y158.958 F{var.speed}
    G1 X122.735 Y158.882 F{var.speed}
    G1 X122.552 Y158.773 F{var.speed}

; feature outer perimeter
if var.outer
    G1 X121.637 Y156.760 F{var.speed}
    ; G1 E0.8000 F2100
    G1 X121.530 Y156.760 {var.speed}
    G1 X121.530 Y156.024 {var.speed}
    G1 X121.636 Y156.032 {var.speed}
    G1 X121.637 Y155.339 {var.speed}
    G1 X121.637 Y154.879 {var.speed}
    G1 X121.530 Y154.872 {var.speed}
    G1 X121.530 Y153.955 {var.speed}
    G1 X121.637 Y153.975 {var.speed}
    G1 X121.637 Y153.243 {var.speed}
    G1 X121.530 Y153.230 {var.speed}
    G1 X121.530 Y153.186 {var.speed}
    G1 X121.636 Y153.186 {var.speed}
    G1 X121.637 Y152.498 {var.speed}
    G1 X121.530 Y152.498 {var.speed}
    G1 X121.529 Y152.230 {var.speed}
    G1 X121.636 Y152.238 {var.speed}
    G1 X121.637 Y151.813 {var.speed}
    G1 X121.636 Y151.520 {var.speed}
    G1 X121.530 Y151.514 {var.speed}
    G1 X121.530 Y151.506 {var.speed}
    G1 X121.637 Y151.506 {var.speed}
    G1 X121.637 Y150.818 {var.speed}
    G1 X121.530 Y150.818 {var.speed}
    G1 X121.530 Y150.658 {var.speed}
    G1 X121.636 Y150.690 {var.speed}
    G1 X121.637 Y150.128 {var.speed}
    G1 X121.636 Y149.906 {var.speed}
    G1 X121.637 Y149.555 {var.speed}
    G1 X121.637 Y149.281 {var.speed}
    G1 X121.529 Y149.290 {var.speed}
    G1 X121.529 Y148.666 {var.speed}
    G1 X121.637 Y148.666 {var.speed}
    G1 X121.637 Y147.978 {var.speed}
    G1 X121.529 Y147.978 {var.speed}
    G1 X121.529 Y147.861 {var.speed}
    G1 X121.637 Y147.861 {var.speed}
    G1 X121.636 Y147.173 {var.speed}
    G1 X121.638 Y146.567 {var.speed}
    G1 X121.530 Y146.574 {var.speed}
    G1 X121.530 Y146.195 {var.speed}
    G1 X121.636 Y146.195 {var.speed}
    G1 X121.637 Y145.506 {var.speed}
    G1 X121.529 Y145.506 {var.speed}
    G1 X121.529 Y145.389 {var.speed}
    G1 X121.637 Y145.389 {var.speed}
    G1 X121.637 Y145.102 {var.speed}
    G1 X121.637 Y144.701 {var.speed}
    G1 X121.530 Y144.701 {var.speed}
    G1 X121.529 Y144.561 {var.speed}
    G1 X121.637 Y144.547 {var.speed}
    G1 X121.636 Y143.788 {var.speed}
    G1 X121.530 Y143.774 {var.speed}
    G1 X121.530 Y143.240 {var.speed}
    G1 X121.636 Y143.240 {var.speed}
    G1 X121.638 Y142.107 {var.speed}
    G1 X121.669 Y141.819 {var.speed}
    G1 X121.760 Y141.504 {var.speed}
    G1 X121.907 Y141.220 {var.speed}
    G1 X122.106 Y140.977 {var.speed}
    G1 X122.353 Y140.779 {var.speed}
    G1 X122.533 Y140.679 {var.speed}
    G1 X122.728 Y140.605 {var.speed}
    G1 X123.063 Y140.539 {var.speed}
    G1 X139.135 Y138.951 {var.speed}
    G1 X147.952 Y138.064 {var.speed}
    G1 X148.754 Y138.004 {var.speed}
    G1 X149.560 Y137.972 {var.speed}
    G1 X150.370 Y137.968 {var.speed}
    G1 X151.182 Y137.993 {var.speed}
    G1 X151.995 Y138.046 {var.speed}
    G1 X152.762 Y138.122 {var.speed}
    G1 X153.418 Y138.209 {var.speed}
    G1 X154.229 Y138.342 {var.speed}
    G1 X155.036 Y138.505 {var.speed}
    G1 X156.240 Y138.804 {var.speed}
    G1 X156.989 Y139.026 {var.speed}
    G1 X157.578 Y139.220 {var.speed}
    G1 X158.792 Y139.677 {var.speed}
    G1 X159.936 Y140.180 {var.speed}
    G1 X161.054 Y140.748 {var.speed}
    G1 X161.761 Y141.148 {var.speed}
    G1 X162.295 Y141.473 {var.speed}
    G1 X163.361 Y142.184 {var.speed}
    G1 X164.367 Y142.938 {var.speed}
    G1 X165.330 Y143.747 {var.speed}
    G1 X165.792 Y144.169 {var.speed}
    G1 X166.393 Y144.754 {var.speed}
    G1 X166.828 Y145.205 {var.speed}
    G1 X167.389 Y145.826 {var.speed}
    G1 X167.912 Y146.449 {var.speed}
    G1 X168.299 Y146.941 {var.speed}
    G1 X168.808 Y147.632 {var.speed}
    G1 X169.264 Y148.302 {var.speed}
    G1 X169.606 Y148.840 {var.speed}
    G1 X169.611 Y148.847 {var.speed}
    G1 X169.728 Y149.045 {var.speed}
    G1 X169.932 Y149.391 {var.speed}
    G1 X169.966 Y149.448 {var.speed}
    G1 X170.047 Y149.642 {var.speed}
    G1 X170.092 Y149.837 {var.speed}
    G1 X170.104 Y150.033 {var.speed}
    G1 X170.081 Y150.228 {var.speed}
    G1 X170.024 Y150.422 {var.speed}
    G1 X169.930 Y150.620 {var.speed}
    G1 X169.899 Y150.670 {var.speed}
    G1 X169.518 Y151.302 {var.speed}
    G1 X169.062 Y152.000 {var.speed}
    G1 X168.711 Y152.497 {var.speed}
    G1 X168.581 Y152.682 {var.speed}
    G1 X168.505 Y152.783 {var.speed}
    G1 X168.220 Y153.162 {var.speed}
    G1 X167.409 Y154.151 {var.speed}
    G1 X166.560 Y155.076 {var.speed}
    G1 X165.660 Y155.953 {var.speed}
    G1 X164.713 Y156.781 {var.speed}
    G1 X163.722 Y157.555 {var.speed}
    G1 X162.691 Y158.273 {var.speed}
    G1 X161.622 Y158.933 {var.speed}
    G1 X160.520 Y159.533 {var.speed}
    G1 X159.388 Y160.070 {var.speed}
    G1 X158.233 Y160.544 {var.speed}
    G1 X157.055 Y160.953 {var.speed}
    G1 X155.860 Y161.298 {var.speed}
    G1 X154.652 Y161.577 {var.speed}
    G1 X153.844 Y161.725 {var.speed}
    G1 X153.030 Y161.845 {var.speed}
    G1 X152.421 Y161.915 {var.speed}
    G1 X151.607 Y161.983 {var.speed}
    G1 X150.839 Y162.021 {var.speed}
    G1 X150.185 Y162.034 {var.speed}
    G1 X149.375 Y162.023 {var.speed}
    G1 X148.570 Y161.984 {var.speed}
    G1 X147.968 Y161.937 {var.speed}
    G1 X123.059 Y159.461 {var.speed}
    G1 X122.840 Y159.425 {var.speed}
    G1 X122.533 Y159.320 {var.speed}
    G1 X122.263 Y159.160 {var.speed}
    G1 X122.035 Y158.947 {var.speed}
    G1 X121.852 Y158.690 {var.speed}
    G1 X121.723 Y158.394 {var.speed}
    G1 X121.651 Y158.065 {var.speed}
    G1 X121.637 Y157.834 {var.speed}
    G1 X121.637 Y156.760 {var.speed}

    ; The hole in the rear smokestack -- ignore
    ; 
    ; ; G1 E-0.8000 F2100
    ; G1 X123.510 Y151.193 {var.speed}
    ; ; G1 E0.8000 F2100
    ; G1 X123.839 Y151.242 {var.speed}
    ; G1 X124.170 Y151.207 {var.speed}
    ; G1 X124.387 Y151.134 {var.speed}
    ; G1 X124.585 Y151.029 {var.speed}
    ; G1 X124.761 Y150.891 {var.speed}
    ; G1 X124.909 Y150.724 {var.speed}
    ; G1 X125.025 Y150.535 {var.speed}
    ; G1 X125.105 Y150.328 {var.speed}
    ; G1 X125.146 Y150.109 {var.speed}
    ; G1 X125.143 Y149.869 {var.speed}
    ; G1 X125.072 Y149.571 {var.speed}
    ; G1 X124.971 Y149.368 {var.speed}
    ; G1 X124.836 Y149.186 {var.speed}
    ; G1 X124.590 Y148.974 {var.speed}
    ; G1 X124.387 Y148.866 {var.speed}
    ; G1 X124.175 Y148.795 {var.speed}
    ; G1 X123.952 Y148.762 {var.speed}
    ; G1 X123.726 Y148.766 {var.speed}
    ; G1 X123.506 Y148.809 {var.speed}
    ; G1 X123.291 Y148.891 {var.speed}
    ; G1 X123.019 Y149.069 {var.speed}
    ; G1 X122.860 Y149.232 {var.speed}
    ; G1 X122.734 Y149.417 {var.speed}
    ; G1 X122.638 Y149.645 {var.speed}
    ; G1 X122.585 Y149.940 {var.speed}
    ; G1 X122.596 Y150.167 {var.speed}
    ; G1 X122.656 Y150.407 {var.speed}
    ; G1 X122.791 Y150.676 {var.speed}
    ; G1 X122.934 Y150.851 {var.speed}
    ; G1 X123.103 Y150.997 {var.speed}
    ; G1 X123.296 Y151.111 {var.speed}
    ; G1 X123.510 Y151.193 {var.speed}