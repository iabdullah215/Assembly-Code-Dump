.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
binaryByte BYTE 6   ; Binary decimal byte to be converted
.code
main PROC
    ; Move the binary decimal byte into AL
    mov al, binaryByte

    ; OR AL with binary 00110000 (set bits 4 and 5)
    or al, 00110000b

    ; Now AL contains the ASCII representation of the digit equivalent to the binary decimal byte.
    ; For example, if binaryByte is 6, after the OR operation, AL will contain the ASCII digit '6'.

    ; Exit the program
    push 0
    call ExitProcess
main ENDP
END main
