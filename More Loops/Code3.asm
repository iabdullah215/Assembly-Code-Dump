; Reverse a 32-bit big-endian number to little-endian format

.DATA
bigEndian BYTE 12h, 34h, 56h, 78h ; Big-endian representation
littleEndian DWORD ?              ; Placeholder for little-endian result

.CODE
main PROC
    mov eax, DWORD PTR bigEndian ; Load the big-endian number into EAX
    bswap eax                    ; Reverse byte order in EAX
    mov littleEndian, eax        ; Store the result in littleEndian

    ; Exit code
    ret
main ENDP
