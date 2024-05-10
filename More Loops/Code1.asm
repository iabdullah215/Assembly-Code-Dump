; We need to check if the given byte in AL has even or odd parity using the Parity flag.

.CODE
main PROC
    mov al, 01110101b       ; Load the byte into AL
    test al, al             ; The TEST instruction sets the Parity flag based on the number of 1 bits in AL
    jpo OddParity           ; Jump if Parity flag is odd
    jpe EvenParity          ; Jump if Parity flag is even

EvenParity:
    ; Code when parity is even
    ; (Implement your own logic here)
    jmp End

OddParity:
    ; Code when parity is odd
    ; (Implement your own logic here)
    
End:
    ; Exit code
    ret
main ENDP
