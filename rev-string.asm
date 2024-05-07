; Reversing a string

INCLUDE Irvine32.inc

.data
prompt db "Enter a string: ", 0
buffer db 100 dup(0)
reversed db 100 dup(0)
greeting db "Reversed string: ", 0
newline db 13, 10, 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    
    mov edx, OFFSET buffer
    mov ecx, 100
    call ReadString
    
    mov ecx, 0
    find_length:
        cmp byte [buffer + ecx], 0
        je length_found
        inc ecx
        jmp find_length

    length_found:
    dec ecx
    
    mov esi, OFFSET buffer
    mov edi, OFFSET reversed
    mov ebx, ecx
    
    reverse_loop:
        mov al, [esi + ebx - 1]
        mov [edi + ecx - ebx], al
        dec ebx
        jnz reverse_loop

    mov edx, OFFSET greeting
    call WriteString
    
    mov edx, OFFSET reversed
    call WriteString
    
    mov edx, OFFSET newline
    call WriteString
    
    call ExitProcess

main ENDP
END main
