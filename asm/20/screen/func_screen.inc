; Data from 1655 to 1657 (3 bytes)
_screen_func_screen_load:
	.db $CD $2B $08

; Data from 1658 to 165A (3 bytes)
	.db $CD $A2 $0A

; Data from 165B to 165D (3 bytes)
	.db $CD $E3 $0A

; Data from 165E to 1660 (3 bytes)
	.db $CD $51 $0B

; Data from 1661 to 1663 (3 bytes)
	.db $21 $06 $0C

; Data from 1664 to 1664 (1 bytes)
	.db $E5

; Data from 1665 to 1667 (3 bytes)
	.db $21 $B9 $16

; Data from 1668 to 1668 (1 bytes)
	.db $E5

; Data from 1669 to 166B (3 bytes)
	.db $CD $E9 $0D

; Data from 166C to 166C (1 bytes)
	.db $F1

; Data from 166D to 166F (3 bytes)
	.db $21 $14 $0C

; Data from 1670 to 1670 (1 bytes)
	.db $E3

; Data from 1671 to 1673 (3 bytes)
	.db $21 $C0 $16

; Data from 1674 to 1674 (1 bytes)
	.db $E5

; Data from 1675 to 1677 (3 bytes)
	.db $CD $E9 $0D

; Data from 1678 to 1678 (1 bytes)
	.db $F1

; Data from 1679 to 1679 (1 bytes)
	.db $F1

; Data from 167A to 167C (3 bytes)
	.db $21 $B8 $16

; Data from 167D to 167D (1 bytes)
	.db $56

; Data from 167E to 1680 (3 bytes)
	.db $21 $B7 $16

; Data from 1681 to 1681 (1 bytes)
	.db $5E

; Data from 1682 to 1682 (1 bytes)
	.db $D5

; Data from 1683 to 1685 (3 bytes)
	.db $21 $C7 $16

; Data from 1686 to 1686 (1 bytes)
	.db $E5

; Data from 1687 to 1689 (3 bytes)
	.db $CD $E9 $0D

; Data from 168A to 168A (1 bytes)
	.db $F1

; Data from 168B to 168B (1 bytes)
	.db $F1

; Data from 168C to 168E (3 bytes)
	.db $21 $B8 $16

; Data from 168F to 168F (1 bytes)
	.db $46

; Data from 1690 to 1692 (3 bytes)
	.db $3A $B7 $16

; Data from 1693 to 1694 (2 bytes)
	.db $C6 $07

; Data from 1695 to 1695 (1 bytes)
	.db $4F

; Data from 1696 to 1696 (1 bytes)
	.db $C5

; Data from 1697 to 1699 (3 bytes)
	.db $21 $CC $16

; Data from 169A to 169A (1 bytes)
	.db $E5

; Data from 169B to 169D (3 bytes)
	.db $CD $E9 $0D

; Data from 169E to 169E (1 bytes)
	.db $F1

; Data from 169F to 169F (1 bytes)
	.db $F1

; Data from 16A0 to 16A2 (3 bytes)
	.db $21 $B8 $16

; Data from 16A3 to 16A3 (1 bytes)
	.db $46

; Data from 16A4 to 16A6 (3 bytes)
	.db $3A $B7 $16

; Data from 16A7 to 16A8 (2 bytes)
	.db $C6 $0E

; Data from 16A9 to 16A9 (1 bytes)
	.db $4F

; Data from 16AA to 16AA (1 bytes)
	.db $C5

; Data from 16AB to 16AD (3 bytes)
	.db $21 $D1 $16

; Data from 16AE to 16AE (1 bytes)
	.db $E5

; Data from 16AF to 16B1 (3 bytes)
	.db $CD $E9 $0D

; Data from 16B2 to 16B2 (1 bytes)
	.db $F1

; Data from 16B3 to 16B3 (1 bytes)
	.db $F1

; Data from 16B4 to 16B6 (3 bytes)
	.db $C3 $25 $08

; Data from 16B7 to 16B7 (1 bytes)
	.db $04

; Data from 16B8 to 16B8 (1 bytes)
	.db $14

; Data from 16B9 to 16BF (7 bytes)
	.db $52 $45 $43 $4F $52 $44 $00

; Data from 16C0 to 16C6 (7 bytes)
	.db $43 $4F $56 $45 $52 $53 $00

; Data from 16C7 to 16CB (5 bytes)
	.db $31 $39 $38 $34 $00

; Data from 16CC to 16D0 (5 bytes)
	.db $31 $39 $38 $36 $00

; Data from 16D1 to 16D5 (5 bytes)
	.db $31 $39 $38 $38 $00

; Data from 16D6 to 16D6 (1 bytes)
_screen_func_screen_update:
	.db $C1

; Data from 16D7 to 16D7 (1 bytes)
	.db $E1

; Data from 16D8 to 16D8 (1 bytes)
	.db $E5

; Data from 16D9 to 16D9 (1 bytes)
	.db $C5

; Data from 16DA to 16DB (2 bytes)
	.db $36 $08

; Data from 16DC to 16DC (1 bytes)
	ret
