INCLUDE Irvine32.inc

.data
    first DWORD 10
    second DWORD 20
    message_one db "First Is Greater", 0Ah, 0
    message_two db "Second Is Greater", 0Ah, 0
    message_end db "Code Ended", 0Ah, 0

.code
main PROC
    mov eax, first
    mov ebx, second

    cmp eax, ebx
    jg FirstIsGreater

    mov edx, OFFSET message_two
    call WriteString
    jmp EndMessage

FirstIsGreater:
    mov edx, OFFSET message_one
    call WriteString
    jmp EndMessage

EndMessage:
    mov edx, OFFSET message_end
    call WriteString

    INVOKE ExitProcess, 0
main ENDP

END main
