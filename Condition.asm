INCLUDE Irvine32.inc

.data
	
	first DWORD 10;
	second DWORD 20;
	message_one db "Comparing Second with First", 0Ah, 0
	message_two db "Now Comparing First with Second", 0Ah, 0

.code
main PROC
	
	mov eax, first
	mov ebx, second

	cmp eax, ebx
	mov edx, OFFSET message_one
	call WriteString
	
	cmp ebx, eax
	mov edx, OFFSET message_two
	call WriteString

INVOKE ExitProcess, 0
main ENDP
END main
