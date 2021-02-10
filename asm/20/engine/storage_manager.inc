; Data from 10D8 to 10DA (3 bytes)
_engine_storage_manager_availabl:
	.db $CD $6D $08

; Data from 10DB to 10DB (1 bytes)
	.db $E5

; Data from 10DC to 10DE (3 bytes)
	.db $CD $52 $08

; Data from 10DF to 10DF (1 bytes)
	.db $E1

; Data from 10E0 to 10E0 (1 bytes)
	.db $4E

; Data from 10E1 to 10E1 (1 bytes)
	.db $23

; Data from 10E2 to 10E2 (1 bytes)
	.db $46

; Data from 10E3 to 10E3 (1 bytes)
	.db $23

; Data from 10E4 to 10E4 (1 bytes)
	.db $5E

; Data from 10E5 to 10E5 (1 bytes)
	.db $23

; Data from 10E6 to 10E6 (1 bytes)
	.db $56

; Data from 10E7 to 10E7 (1 bytes)
	.db $79

; Data from 10E8 to 10E9 (2 bytes)
	.db $D6 $04

; Data from 10EA to 10EB (2 bytes)
	.db $20 $13

; Data from 10EC to 10EC (1 bytes)
	.db $78

; Data from 10ED to 10EE (2 bytes)
	.db $D6 $B0

; Data from 10EF to 10F0 (2 bytes)
	.db $20 $0E

; Data from 10F1 to 10F1 (1 bytes)
	.db $7B

; Data from 10F2 to 10F3 (2 bytes)
	.db $D6 $E0

; Data from 10F4 to 10F5 (2 bytes)
	.db $20 $09

; Data from 10F6 to 10F6 (1 bytes)
	.db $7A

; Data from 10F7 to 10F8 (2 bytes)
	.db $D6 $AC

; Data from 10F9 to 10FA (2 bytes)
	.db $20 $04

; Data from 10FB to 10FC (2 bytes)
	.db $3E $01

; Data from 10FD to 10FE (2 bytes)
	.db $18 $01

; Data from 10FF to 10FF (1 bytes)
	.db $AF

; Data from 1100 to 1100 (1 bytes)
	.db $6F

; Data from 1101 to 1101 (1 bytes)
	.db $E5

; Data from 1102 to 1104 (3 bytes)
	.db $CD $67 $08

; Data from 1105 to 1105 (1 bytes)
	.db $E1

; Data from 1106 to 1106 (1 bytes)
	ret

; Data from 1107 to 1109 (3 bytes)
_engine_storage_manager_read:
	.db $CD $6D $08

; Data from 110A to 110A (1 bytes)
	.db $E5

; Data from 110B to 110D (3 bytes)
	.db $CD $52 $08

; Data from 110E to 110F (2 bytes)
	.db $FD $E1

; Data from 1110 to 1112 (3 bytes)
	.db $FD $4E $04

; Data from 1113 to 1115 (3 bytes)
	.db $21 $2A $C0

; Data from 1116 to 1116 (1 bytes)
	.db $71

; Data from 1117 to 1119 (3 bytes)
	.db $C3 $67 $08

; Data from 111A to 111C (3 bytes)
_engine_storage_manager_write:
	.db $CD $6D $08

; Data from 111D to 111D (1 bytes)
	.db $E5

; Data from 111E to 1120 (3 bytes)
	.db $CD $52 $08

; Data from 1121 to 1121 (1 bytes)
	.db $C1

; Data from 1122 to 1122 (1 bytes)
	.db $69

; Data from 1123 to 1123 (1 bytes)
	.db $60

; Data from 1124 to 1125 (2 bytes)
	.db $36 $04

; Data from 1126 to 1126 (1 bytes)
	.db $23

; Data from 1127 to 1128 (2 bytes)
	.db $36 $B0

; Data from 1129 to 1129 (1 bytes)
	.db $23

; Data from 112A to 112B (2 bytes)
	.db $36 $E0

; Data from 112C to 112C (1 bytes)
	.db $23

; Data from 112D to 112E (2 bytes)
	.db $36 $AC

; Data from 112F to 1131 (3 bytes)
	.db $21 $04 $00

; Data from 1132 to 1132 (1 bytes)
	.db $09

; Data from 1133 to 1133 (1 bytes)
	.db $EB

; Data from 1134 to 1136 (3 bytes)
	.db $3A $2A $C0

; Data from 1137 to 1137 (1 bytes)
	.db $12

; Data from 1138 to 113A (3 bytes)
	.db $21 $05 $00

; Data from 113B to 113B (1 bytes)
	.db $09

; Data from 113C to 113D (2 bytes)
	.db $36 $FE

; Data from 113E to 1140 (3 bytes)
	.db $C3 $67 $08

; Data from 1141 to 1143 (3 bytes)
_engine_storage_manager_erase:
	.db $CD $6D $08

; Data from 1144 to 1144 (1 bytes)
	.db $E5

; Data from 1145 to 1147 (3 bytes)
	.db $CD $52 $08

; Data from 1148 to 1148 (1 bytes)
	.db $C1

; Data from 1149 to 1149 (1 bytes)
	.db $69

; Data from 114A to 114A (1 bytes)
	.db $60

; Data from 114B to 114B (1 bytes)
	.db $AF

; Data from 114C to 114C (1 bytes)
	.db $77

; Data from 114D to 114D (1 bytes)
	.db $23

; Data from 114E to 114E (1 bytes)
	.db $77

; Data from 114F to 114F (1 bytes)
	.db $23

; Data from 1150 to 1150 (1 bytes)
	.db $AF

; Data from 1151 to 1151 (1 bytes)
	.db $77

; Data from 1152 to 1152 (1 bytes)
	.db $23

; Data from 1153 to 1153 (1 bytes)
	.db $77

; Data from 1154 to 1156 (3 bytes)
	.db $21 $04 $00

; Data from 1157 to 1157 (1 bytes)
	.db $09

; Data from 1158 to 1159 (2 bytes)
	.db $36 $00

; Data from 115A to 115C (3 bytes)
	.db $21 $05 $00

; Data from 115D to 115D (1 bytes)
	.db $09

; Data from 115E to 115F (2 bytes)
	.db $36 $FE

; Data from 1160 to 1162 (3 bytes)
	.db $C3 $67 $08
