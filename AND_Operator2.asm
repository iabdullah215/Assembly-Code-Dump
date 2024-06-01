; Even Number Checker

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
wordVal WORD 1234      ; Example integer value
.code
main PROC
    ; Move the integer value into AX
    mov ax, wordVal

    ; AND the lowest bit with 1
    and ax, 1

    ; Jump to label EvenValue if the Zero flag is set
    jz EvenValue

    ; If the Zero flag is not set, the number is odd, continue processing here
    ; ...

EvenValue:
    ; If the Zero flag is set, the number is even, handle the even case here
    ; ...

    ; Exit the program
    push 0
    call ExitProcess
main ENDP
END main
