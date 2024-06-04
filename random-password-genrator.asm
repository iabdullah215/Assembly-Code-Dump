INCLUDE Irvine32.inc
.data
 password BYTE 50 DUP(?)
 passwordLength DWORD ?
 passwordComplexity DWORD ?
 passwordStrength DWORD ?
 uppercase BYTE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 lowercase BYTE 'abcdefghijklmnopqrstuvwxyz'
 numbers BYTE '0123456789'
 specialChars BYTE '!@#$%^&*()_+-={}:<>?'
 allChars BYTE 0
 sprompt BYTE "Enter Desired Password Length: ", 0
 smenu BYTE " ~~~~~~~~~~ MENU ~~~~~~~~~~", 0
 smenu1 BYTE "1. UPPER CASE", 0
 smenu2 BYTE "2. MIXED CASE (lowercase + uppercase)", 0
 smenu3 BYTE "3. ALPHA NUMERIC (mixed case + numbers)", 0
 smenu4 BYTE "4. ALPHA NUMERIC + SPECIAL CHARACTER", 0
 soption BYTE "Choose Complexity (1-4): ", 0
 spassword BYTE "PASSWORD GENERATED: ", 0
 sstrengthMenu BYTE " ~~~~~~~~~~ STRENGTH MENU ~~~~~~~~~~", 0
 sstrength1 BYTE "1. WEAK", 0
 sstrength2 BYTE "2. MEDIUM", 0
 sstrength3 BYTE "3. STRONG", 0
 sstrengthOption BYTE "Choose Strength (1-3): ", 0
.code
start PROC
 mov edx, OFFSET sstrengthMenu
 call WriteString
 call Crlf
 mov edx, OFFSET sstrength1
 call WriteString
 call Crlf
 mov edx, OFFSET sstrength2
 call WriteString
 call Crlf
 mov edx, OFFSET sstrength3
 call WriteString
 call Crlf
 call Crlf
 mov edx, OFFSET sstrengthOption
 call WriteString
 call Crlf
 call ReadInt
 mov passwordStrength, eax

 ; Set password length based on strength
 cmp passwordStrength, 1
 je weakPassword
 cmp passwordStrength, 2
 je mediumPassword
 cmp passwordStrength, 3
 je strongPassword

weakPassword:
 mov passwordLength, 6
 jmp getComplexity

mediumPassword:
 mov passwordLength, 10
 jmp getComplexity

strongPassword:
 mov passwordLength, 16

getComplexity:
 mov edx, OFFSET smenu
 call WriteString
 call Crlf
 mov edx, OFFSET smenu1
 call WriteString
 call Crlf
 mov edx, OFFSET smenu2
 call WriteString
 call Crlf
 mov edx, OFFSET smenu3
 call WriteString
 call Crlf
 mov edx, OFFSET smenu4
 call WriteString
 call Crlf
 call Crlf
 mov edx, OFFSET soption
 call WriteString
 call Crlf
 call ReadInt
 mov passwordComplexity, eax

 mov esi, offset password
 mov ecx, passwordLength
generatePassword:
 call GenerateRandomChar
 mov [esi], al
 inc esi
 loop generatePassword
 mov byte ptr [esi], 0 ; Null-terminate the string
 call Crlf
 mov edx, OFFSET spassword
 call WriteString
 mov edx, offset password
 call WriteString
 call Crlf
 invoke ExitProcess, 0
start ENDP

GenerateRandomChar PROC
 mov eax, passwordComplexity
 cmp eax, 1
 je uppercaseOnly
 cmp eax, 2
 je mixedCase
 cmp eax, 3
 je mixedCaseNumbers
 cmp eax, 4
 je allCharacters
 jmp GenerateRandomChar ; add this to avoid infinite loop

uppercaseOnly:
 mov eax, 26
 call RandomRange
 add eax, offset uppercase
 mov al, [eax]
 ret

mixedCase:
 mov eax, 52
 call RandomRange
 cmp eax, 26
 jl uppercaseOnlyProc
 sub eax, 26
 add eax, offset lowercase
 mov al, [eax]
 ret

mixedCaseNumbers:
 mov eax, 62
 call RandomRange
 cmp eax, 26
 jl uppercaseOnlyProc
 cmp eax, 52
 jl lowercaseOnlyProc
 sub eax, 52
 add eax, offset numbers
 mov al, [eax]
 ret

allCharacters:
 mov eax, 94
 call RandomRange
 cmp eax, 26
 jl uppercaseOnlyProc
 cmp eax, 52
 jl lowercaseOnlyProc
 cmp eax, 62
 jl numbersOnlyProc
 sub eax, 62
 add eax, offset specialChars
 mov al, [eax]
 ret

uppercaseOnlyProc:
 mov eax, 26
 call RandomRange
 add eax, offset uppercase
 mov al, [eax]
 ret

lowercaseOnlyProc:
 mov eax, 26
 call RandomRange
 add eax, offset lowercase
 mov al, [eax]
 ret

numbersOnlyProc:
 mov eax, 10
 call RandomRange
 add eax, offset numbers
 mov al, [eax]
 ret

GenerateRandomChar ENDP
END start
