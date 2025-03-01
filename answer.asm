;DESCRIPTION                : Demonstrates calls made into libc, using NASM to send
;                           : a short text string to stdout with printf().
;Architecture               : X86-64
;CPU                        : Intel® Core™2 Duo CPU T6570 @ 2.10GHz × 2
;NASM                       : 2.14.02
;GCC                        : gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
;
;
;------------------------------------------------------------------------------------------------------------------

SECTION .data

ANSWERMSG DB "The answer is %d ... or is it %d? Hello Michael, Vsauce here! The answer is 0x%x!",10,0
ANSWERNUM DD 42

;------------------------------------------------------------------------------------------------------------------

SECTION .bss

;------------------------------------------------------------------------------------------------------------------

SECTION .text

EXTERN printf
GLOBAL main

main:
;First line was initialy and errenously POP RBP,which caused a seg fault!!!!!!
PUSH RBP         ;Prolog
MOV RBP,RSP

MOV RAX,0       ;Count of vector regs ... here,0

MOV RDI,ANSWERMSG     ;Message/format string goes in RDI
MOV RSI,[ANSWERNUM]   ;2nd arg in RSI
MOV RDX,43            ;3rd arg in RDX. You can use a numeric literal
MOV RCX,42            ;4th arg in RCX. Show this one in hex
MOV RAX,0             ;This tells printf no vector params are coming
CALL printf           ;Call printf()

XOR RAX,RAX
POP RBP               ;Epilog
RET
