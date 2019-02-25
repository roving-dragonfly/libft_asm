	;ft_strdup
	;allocates sufficient memory for a copy of the string s1, does the copy, and returns a pointer to it.
	;char *strdup(const char *s1);

global _ft_strdup
extern _ft_strlen
extern _malloc

section .text

_ft_strdup:
	push	rbp		;stack alignement
	mov	rbp, rsp
	push	rdi		;saves str
	call	_ft_strlen	;get size to alloc
	inc	rax		;for the terminating null byte
	push	rax		;saves length
	mov	rdi, rax	;set buffer size for malloc
	call	_malloc
        mov	rdi, rax	;dst = malloc(len(s))
	pop	rcx		;sets len
	pop	rsi		;src = str
	cld			;set direction
	rep	movsb
        pop	rbp
	ret
