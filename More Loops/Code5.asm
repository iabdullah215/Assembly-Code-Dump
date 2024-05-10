; EAX = -val2 + 7 - val3 + val1

.DATA
val1 DWORD 5           ; Example value for val1
val2 DWORD 10          ; Example value for val2
val3 DWORD 3           ; Example value for val3

.CODE
main PROC
    mov eax, val1       ; Load val1 into EAX
    add eax, 7          ; Add 7 to EAX
    sub eax, val2       ; Subtract val2 from EAX
    sub eax, val3       ; Subtract val3 from EAX

    ; EAX now holds the result of -val2 + 7 - val3 + val1

    ; Exit code
    ret
main ENDP
