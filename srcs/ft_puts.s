	;ft_puts
	;output a line to a stream
	;int puts(const char *s);

global	_ft_puts

section .text

_ft_puts:
        xor	rdx, rdx	;clean register to store strlen	
	cmp	rdi, 0
	je	null
	jmp	strlen
null:
	mov	rdi, no_ptr	;if null ptr, set specific string
	
strlen:
        cmp	[rdi + rdx], byte 0	;if !*s
	je	print
        inc	rdx
	jmp	strlen
        
print:
	push	rbp
	mov	rbp, rsp
        mov	rax, 0x2000004	;write
	mov	rsi, rdi
        mov	rdi, 1		;stdout
	syscall
        mov	rax, 0x2000004	;write
	mov	rsi, newline
        mov	rdi, 1		;stdout
	mov	rdx, 1
	syscall
	mov	rax, 1
	pop rbp
	ret

section .data

no_ptr: db "(null)", 0
newline: db 10, 0

	
