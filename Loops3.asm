; In Assembly x86 , Initialize an array of integers with a size of at least 5 elements, as given below. Implement a loop to traverse the array and calculate the sum of all its elements.
; Given Array -> [4, 8, 1, 10, 6]
; Expected Output -> Sum of Array Elements: 29

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
array DWORD 4, 8, 1, 10, 6
_size EQU 5
sum DWORD 0
.code
main PROC
 mov ecx, _size
 lea esi, array
 xor eax, eax
 
loop_start:
 add eax, [esi]
 add esi, 4
 loop loop_start
 
 mov sum, eax
 
 INVOKE ExitProcess, eax
main ENDP
END main
