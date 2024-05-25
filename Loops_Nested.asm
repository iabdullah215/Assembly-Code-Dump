INCLUDE Irvine32.inc

.data
    message1 db "Hi! from the Outer Loop", 0
    message2 db "Hi! from the Inner Loop", 0

.code
main PROC
    mov ecx, 2  ; Outer Loop Counter

LoopNumberOne:

    PUSH ECX
    mov edx, OFFSET message1
    call WriteString
    call Crlf

    mov ecx, 2  ; Inner Loop Counter

    LoopNumberTwo:
        
        mov edx, OFFSET message2
        call WriteString
        call Crlf

        loop LoopNumberTwo

    POP ECX

    loop LoopNumberOne

    INVOKE ExitProcess, 0
main ENDP
END main
