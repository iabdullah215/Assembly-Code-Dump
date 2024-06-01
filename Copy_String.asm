.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
source BYTE "This is the source string", 0   ; Source string with null terminator
target BYTE SIZEOF source DUP(0)             ; Target array with same size as source
.code
main PROC
    ; Initialize index register (ESI) and loop counter (ECX)
    mov esi, 0
    mov ecx, SIZEOF source

L1:
    ; Get character from source using indexed addressing
    mov al, source[esi]
    
    ; Store the character in the target array
    mov target[esi], al
    
    ; Increment the index register to move to the next character
    inc esi
    
    ; Loop until ECX (loop counter) reaches zero
    loop L1

    ; Exit the program
    push 0
    call ExitProcess
main ENDP
END main
