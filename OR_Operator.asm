.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
byteVal BYTE 01100001b  ; Example byte value
.code
main PROC
    ; Move the byte value into AL
    mov al, byteVal

    ; OR AL with binary 00000100 (set bit 2)
    or al, 00000100b

    ; The Sign, Zero, and Parity flags are modified based on the result of the operation.
    ; If the result is zero, the Zero flag is set. Otherwise, it's cleared.
    ; If the highest bit of the result (Sign bit) is 1, the Sign flag is set. Otherwise, it's cleared.
    ; The Parity flag is set if the number of set bits in the result is even, otherwise, it's cleared.

    ; Exit the program
    push 0
    call ExitProcess
main ENDP
END main
