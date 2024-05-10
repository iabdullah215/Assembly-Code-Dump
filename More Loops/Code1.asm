; We need to check if the given byte in AL has even or odd parity using the Parity flag.

.MODEL FLAT, STDCALL
.STACK 4096
.DATA
checkByte BYTE 01110101b
evenParityResult BYTE 0
oddParityResult BYTE 0

.CODE
main PROC
    mov al, checkByte
    test al, al
    jpo OddParity
    jpe EvenParity

EvenParity:
    mov evenParityResult, 1
    jmp End

OddParity:
    mov oddParityResult, 1
    
End:
    ret

main ENDP

; In EvenParity, the evenParityResult variable is set to 1 to indicate even parity was detected.
; In OddParity, the oddParityResult variable is set to 1 to indicate odd parity was detected.
