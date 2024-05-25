INCLUDE Irvine32.inc

.data
    message db "The Value Of Counter Is: ", 0
    counter DWORD 0

.code
main PROC
    mov ecx, 5

MyFirstLoop:

    mov edx, OFFSET message
    call WriteString

    mov eax, counter
    mov edx, OFFSET counter
    call WriteDec
    call Crlf

    inc counter

    loop MyFirstLoop

    INVOKE ExitProcess, 0
main ENDP
END main
