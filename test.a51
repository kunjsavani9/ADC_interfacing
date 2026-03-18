ORG 0000H       ; Start of the program
MOV P0, #00H   ; Initialize Port 0 to 0
MOV P3, #0FH   ; Initialize Port 3 to select each digit

; Lookup table for 7-segment display (Common Cathode)
LOOKUP:
    DB 3FH  ; 0
    DB 06H  ; 1
    DB 5BH  ; 2
    DB 4FH  ; 3

; Display digit sequence 0-1-2-3 continuously
DISPLAY_SEQUENCE:
    MOV DPTR, #LOOKUP
SEQUENCE_LOOP:
    MOV R0, #04H  ; 4 digits to display
NEXT_DIGIT:
    MOV A, R0     ; Select digit control
    CPL A         ; Invert bits for selection
    MOV P3, A     ; Activate digit select on Port 3
    MOV A, R0     ; Load current digit value
    DEC A
    MOVC A, @A+DPTR
    MOV P0, A     ; Output pattern to Port 0
    ACALL DELAY   ; Short delay for persistence
    DJNZ R0, NEXT_DIGIT
    SJMP SEQUENCE_LOOP  ; Repeat continuously

; Delay subroutine
DELAY:
    MOV R7, #0FFH
D1: MOV R6, #0FFH
D2: DJNZ R6, D2
    DJNZ R7, D1
    RET

END
