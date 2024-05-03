; Increment/Add to the register/pointer

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
someData BYTE 01h, 02h, 03h, 04h
.code
Main PROC
 mov ebx, OFFSET someData ;Load the base address of someData into ebx
 
 mov al, [ebx] ; Load the first element (BYTE) into al
 inc ebx ; Move to the next element
 
 mov al, [ebx] ; Load the second element (BYTE) into al
 add ebx, 2 ; Move two elements forward
 
 mov al, [ebx] ; Load the fourth element (BYTE) into al
 
 invoke ExitProcess, 0 ; Exit the program
Main ENDP
END Main
