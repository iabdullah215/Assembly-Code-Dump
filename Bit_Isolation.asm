INCLUDE Irvine32.inc

.data
    message1 db "Day is: ", 0
    message2 db "Month is: ", 0
    message3 db "Year is: ", 0
    day db 0          
    month db 0        
    year dw 0         

.code
main PROC

    
    mov dl, 00111010b   
    mov dx, 1011010010110010b 

    mov al, dl          ; make a copy of DL
    and al, 00011111b   ; clear bits 5-7
    mov day, al         ; save in day variable

    mov edx, OFFSET message1
    call WriteString
    movzx eax, day      ; move day into EAX with zero extension
    call WriteDec       ; print the day value
    call Crlf

    mov ax, dx          ; make a copy of DX
    shr ax, 5           ; shift right 5 bits
    and al, 00001111b   ; clear bits 4-7
    mov month, al       ; save in month variable

    mov edx, OFFSET message2
    call WriteString
    movzx eax, month    ; move month into EAX with zero extension
    call WriteDec       ; print the month value
    call Crlf

    mov al, dh          ; make a copy of DH (high byte of DX)
    shr al, 1           ; shift right 1 bit
    mov ah, 0           ; clear AH to 0
    add ax, 1980        ; year is relative to 1980
    mov year, ax        ; save in year variable

    mov edx, OFFSET message3
    call WriteString
    movzx eax, year     ; move year into EAX with zero extension
    call WriteDec       ; print the year value
    call Crlf

    INVOKE ExitProcess, 0
main ENDP
END main
