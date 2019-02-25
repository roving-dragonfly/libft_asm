	;ft_strlen
	;computes the length of the string s.
	;size_t strlen(const char *s);

global _ft_strlen
	
section .text

_ft_strlen:
	push	rbp
	mov	rbp, rsp
        mov	al, byte 0	;set the termination condition
	mov	rcx, -1		;strings instructions decrement rcx
	cld
        repne	scasb		;while *s al++
	not	rcx
	dec	rcx
	mov	rax, rcx
	pop	rbp
	ret
	
