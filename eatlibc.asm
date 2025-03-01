;DESCRIPTION                : Demonstrates calls made into libc, using NASM to send
;                           : a short text string to stdout with puts().
;Architecture               : X86-64
;CPU                        : Intel® Core™2 Duo CPU T6570 @ 2.10GHz × 2
;NASM                       : 2.14.02
;
;
;------------------------------------------------------------------------------------------------------------------

SECTION .data

EATMSG:   DB "Gibt es was zu essen?",0        ;Notice that this string ends with a 0 not a 10!

;------------------------------------------------------------------------------------------------------------------

SECTION .bss

;------------------------------------------------------------------------------------------------------------------

SECTION .text

EXTERN puts                   ;The simple "put string" routine from libc
GLOBAL main                   ;Required for the linker to find the entry point

main:
PUSH RBP                ;Prolog sets up stack frame
MOV RBP,RSP
;AND RSP,-16 ;for non gcc programs

MOV RDI,EATMSG               ;Put addy of string into RDI
CALL puts                    ;Call libc function for displaying strings
XOR RAX,RAX                  ;Pass a 0 as the program's return value.

POP RBP                 ;Epilogue: Destroy stack frame before returning
RET                     ;Return control to Linux
