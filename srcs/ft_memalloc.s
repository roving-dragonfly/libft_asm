	;ft_memalloc
	;allocs block of size n, then clears it
	;void *ft_memalloc(size_t n)

global _ft_memalloc
extern _malloc
extern _ft_bzero	
	
section .text

_ft_memalloc:
	push	rbp		;stack alignement
	mov	rbp, rsp
	push	rdi		;saves size
	call	_malloc
        mov	r11, rax	;saves addr
	mov	rdi, rax
        pop	rsi
	call	_ft_bzero
	mov	rax, r11	;returns addr
	pop	rbp
	ret
