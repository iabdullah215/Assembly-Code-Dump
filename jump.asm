; Include the IRVINE32 library
INCLUDE Irvine32.inc

.data
message1 db "Jump Example Program", 0Ah, 0
message2 db "EDX is zero", 0Ah, 0
message3 db "EDX is non-zero", 0Ah, 0
message4 db "EDX is greater than ECX", 0Ah, 0
message5 db "EDX is less than or equal to ECX", 0Ah, 0
message6 db "End of Program", 0Ah, 0

.code
main PROC
    ; Display initial message
    mov edx, OFFSET message1
    call WriteString

    ; Initialize registers
    mov edx, 0
    mov ecx, 10

    ; Test for zero using JE (JZ)
    cmp edx, 0
    je ZeroCase  ; Jump if EDX is zero

    ; Test for non-zero using JNE (JNZ)
    cmp edx, 0
    jne NonZeroCase  ; Jump if EDX is not zero

    ; Label for zero case
ZeroCase:
    mov edx, OFFSET message2
    call WriteString
    jmp ContinueCheck

    ; Label for non-zero case
NonZeroCase:
    mov edx, OFFSET message3
    call WriteString

ContinueCheck:
    ; Set EDX to 15 for further comparisons
    mov edx, 15

    ; Test if EDX is greater than ECX using JG (JNLE)
    cmp edx, ecx
    jg GreaterCase  ; Jump if EDX is greater than ECX

    ; Test if EDX is less than or equal to ECX using JLE (JNG)
    cmp edx, ecx
    jle LessEqualCase  ; Jump if EDX is less than or equal to ECX

    ; Label for greater case
GreaterCase:
    mov edx, OFFSET message4
    call WriteString
    jmp EndProgram

    ; Label for less than or equal case
LessEqualCase:
    mov edx, OFFSET message5
    call WriteString

EndProgram:
    ; Display end of program message
    mov edx, OFFSET message6
    call WriteString
    
    ; Exit the program
    call ExitProcess
main ENDP

END main
