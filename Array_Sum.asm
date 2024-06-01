.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
arrayW WORD 1000h, 2000h, 3000h
.code
main PROC
    mov esi, OFFSET arrayW
    mov ax, [esi]
    add esi, 2
    add ax, [esi]
    add esi, 2
    add ax, [esi]

    ; Exit the program
    push 0
    call ExitProcess
main ENDP
END main
