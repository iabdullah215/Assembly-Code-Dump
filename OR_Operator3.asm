.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
; No data declaration needed for this example
.code
main PROC
    ; Assume AL contains some value that we want to check if it's not zero

    ; OR AL with itself
    or al, al

    ; Jump to label IsNotZero if the result of the OR operation is not zero
    jnz IsNotZero

    ; If AL is zero, continue processing here
    ; ...

IsNotZero:
    ; If AL is not zero, handle the case here
    ; ...

    ; Exit the program
    push 0
    call ExitProcess
main ENDP
END main
