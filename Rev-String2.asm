.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
aName BYTE "Kip Irvine", 0          ; Original string with null terminator
nameSize = SIZEOF aName - 1         ; Size of the string excluding the null terminator
.code
main PROC

    ; Push the name on the stack
    mov ecx, nameSize               ; Set ECX to the size of the string
    mov esi, 0                      ; Initialize index register to 0

L1:
    movzx eax, aName[esi]           ; Move character from aName to EAX (zero-extended)
    push eax                        ; Push the character onto the stack
    inc esi                         ; Move to the next character
    loop L1                         ; Repeat until all characters are pushed

    ; Pop the name from the stack, in reverse, and store in the aName array
    mov ecx, nameSize               ; Reset ECX to the size of the string
    mov esi, 0                      ; Reset index register to 0

L2:
    pop eax                         ; Pop character from stack into EAX
    mov aName[esi], al              ; Store the character back into aName
    inc esi                         ; Move to the next character
    loop L2                         ; Repeat until all characters are popped

    ; Exit the program
    push 0
    call ExitProcess
main ENDP
END main
