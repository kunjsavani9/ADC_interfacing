;; 8051 Assembly Program to Generate 2 kHz Square Wave on P1.4 using Timer 0

;ORG 0000H
    ;MOV TMOD, #01H      ; Set Timer 0 in Mode 1 (16-bit timer mode)
;START:
    ;MOV TL0, #0F0H      ; Load TL0 with low byte
    ;MOV TH0, #0FH       ; Load TH0 with high byte (for 2 kHz delay)
    ;SETB TR0            ; Start Timer 0
;WAIT:
    ;JNB TF0, WAIT       ; Wait for Timer 0 overflow
    ;CLR TR0             ; Stop Timer 0
    ;CLR TF0             ; Clear Timer 0 overflow flag
    ;CPL P1.4            ; Toggle P1.4 to generate square wave
    ;SJMP START          ; Repeat the process

;END

; 8051 Assembly Program for Counter 1 in Mode 2 with External Clock on T1 (P3.5)

;
; 8051 Assembly Program for Counter 1 in Mode 2 with External Clock on T1 (P3.5)

;ORG 0000H
    ;MOV TMOD, #60H      ; Set Timer 1 in Mode 2 (8-bit auto-reload counter)
    ;MOV TL1, #00H       ; Start count from 0H
    ;MOV TH1, #00H       ; Auto-reload value = 0H
    ;SETB TR1            ; Start Counter 1

;COUNT:
    ;MOV A, TL1          ; Load TL1 value into Accumulator
    ;MOV P2, A           ; Display TL1 value on Port 2 (connected to 8 LEDs)
    ;SJMP COUNT          ; Keep checking and updating the value

;END

;ORG 0000H       ; Start of the program
;MOV TMOD, #20H ; Timer 1, Mode 2 (8-bit auto-reload)
;MOV TH1, #-12  ; Set Timer 1 reload value for 2400 baud rate
;MOV SCON, #50H ; Serial Mode 1, 8-bit data, 1 stop bit, REN enabled
;SETB TR1        ; Start Timer 1

;MAIN:
    ;MOV A, #"Y"
    ;ACALL TRANSFER
    ;MOV A, #"E"
    ;ACALL TRANSFER
    ;MOV A, #"S"
    ;ACALL TRANSFER
    ;SJMP MAIN  ; Repeat continuously

;TRANSFER:
    ;MOV SBUF, A  ; Move data to Serial Buffer
;WAIT:
    ;JNB TI, WAIT ; Wait for transmission to complete
    ;CLR TI       ; Clear the TI flag for next transmission
    ;RET

;END

;ORG 0000H       ; Start of the program
;MOV TMOD, #20H ; Timer 1, Mode 2 (8-bit auto-reload)
;MOV TH1, #-12  ; Set Timer 1 reload value for 2400 baud rate
;MOV SCON, #50H ; Serial Mode 1, 8-bit data, 1 stop bit, REN enabled
;SETB TR1        ; Start Timer 1

;MAIN:
    ;MOV A, #"Y"
    ;ACALL TRANSFER
    ;MOV A, #"E"
    ;ACALL TRANSFER
    ;MOV A, #"S"
    ;ACALL TRANSFER
    ;SJMP MAIN  ; Repeat continuously

;TRANSFER:
    ;MOV SBUF, A  ; Move data to Serial Buffer
;WAIT:
    ;JNB TI, WAIT ; Wait for transmission to complete
    ;CLR TI       ; Clear the TI flag for next transmission
    ;RET

;END

;ORG 0000H       ; Start of the program
;MOV TMOD, #20H ; Timer 1, Mode 2 (8-bit auto-reload)
;MOV TH1, #-12  ; Set Timer 1 reload value for 2400 baud rate
;MOV SCON, #50H ; Serial Mode 1, 8-bit data, 1 stop bit, REN enabled
;SETB TR1        ; Start Timer 1

;MAIN:
    ;MOV A, P1  ; Read data from Port 1
    ;ACALL TRANSFER
    ;SJMP MAIN  ; Repeat continuously

;TRANSFER:
    ;MOV SBUF, A  ; Move data to Serial Buffer
;WAIT:
    ;JNB TI, WAIT ; Wait for transmission to complete
    ;CLR TI       ; Clear the TI flag for next transmission
    ;RET

;END

;ORG 0000H       ; Start of the program
;MOV TMOD, #20H ; Timer 1, Mode 2 (8-bit auto-reload)
;MOV TH1, #-12  ; Set Timer 1 reload value for 2400 baud rate
;MOV SCON, #50H ; Serial Mode 1, 8-bit data, 1 stop bit, REN enabled
;SETB TR1        ; Start Timer 1

;MAIN:
    ;JNB RI, MAIN ; Wait until data is received
    ;CLR RI       ; Clear the RI flag for next reception
    ;MOV A, SBUF  ; Move received data to accumulator
    ;MOV P0, A    ; Transfer data to Port 0
    ;MOV P2, A    ; Transfer data to Port 2
    ;SJMP MAIN    ; Repeat continuously

;END

;ORG 0000H       ; Start of the program
;MOV P0, #00H   ; Initialize Port 0 to turn off all LEDs

;MAIN:
    ;MOV A, #50H  ; Read data from Port 1 (or any input port)
    ;MOV P0, A  ; Send data to Port 0 to control LEDs
    ;SJMP MAIN  ; Repeat continuously

;END

;ORG 0000H       ; Start of the program
;MOV P1, #00H   ; Initialize Port 1 to 0

;; Lookup table for 7-segment display (Common Cathode)
;LOOKUP:
    ;DB 3FH  ; 0
    ;DB 06H  ; 1
    ;DB 5BH  ; 2
    ;DB 4FH  ; 3
    ;DB 66H  ; 4
    ;DB 6DH  ; 5
    ;DB 7DH  ; 6
    ;DB 07H  ; 7
    ;DB 7FH  ; 8
    ;DB 6FH  ; 9

;MAIN:
    ;MOV A, #01H  ; Read data from Port 2 (or any input port)
    ;MOV DPTR, #LOOKUP
    ;MOVC A, @A+DPTR
    ;MOV P1, A  ; Send data to Port 1 to control 7-segment display
    ;SJMP MAIN  ; Repeat continuously

;END

;ORG 0000H       ; Start of the program
;MOV P0, #00H   ; Initialize Port 0 to 0

;; Turn on and off LED on P0.0 with delay
;LED_BLINK:
    ;SETB P0.0   ; Turn ON LED on P0.0
    ;ACALL DELAY ; Call delay subroutine
    ;CLR P0.0    ; Turn OFF LED on P0.0
    ;ACALL DELAY ; Call delay subroutine
    ;SJMP LED_BLINK

;; Display number sequence 1-2-3-4-5 on Port 0 with delay
;NUMBER_SEQUENCE:
    ;MOV A, #01H
    ;MOV P0, A
    ;ACALL DELAY
    ;MOV A, #02H
    ;MOV P0, A
    ;ACALL DELAY
    ;MOV A, #03H
    ;MOV P0, A
    ;ACALL DELAY
    ;MOV A, #04H
    ;MOV P0, A
    ;ACALL DELAY
    ;MOV A, #05H
    ;MOV P0, A
    ;ACALL DELAY
    ;SJMP NUMBER_SEQUENCE

;; Delay subroutine
;DELAY:
    ;MOV R7, #0FFH
;D1: MOV R6, #0FFH
;D2: DJNZ R6, D2
    ;DJNZ R7, D1
    ;RET

;END

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
