; A loop to calculate the first 7 Fibonacci numbers

.DATA
fibArr DWORD 7 DUP(0)       ; Array to store Fibonacci numbers
.CODE
main PROC
    mov eax, 1              ; Fib(1)
    mov fibArr[0], eax      ; Store in array
    mov eax, 1              ; Fib(2)
    mov fibArr[4], eax      ; Store in array

    mov ebx, 2              ; Start index from 2
    mov ecx, 5              ; Limit to 7 Fibonacci numbers
    
FibonacciLoop:
    mov eax, fibArr[ebx * 4 - 8] ; Previous Fibonacci number (n-1)
    add eax, fibArr[ebx * 4 - 4] ; Current Fibonacci number (n-2)
    mov fibArr[ebx * 4], eax     ; Store result in array

    inc ebx
    loop FibonacciLoop

    ; Exit code
    ret
main ENDP
