	;ft_strcat
	;The strncat() function appends not more than n characters from s2, and then adds a terminating `\0'.
	;char *strcat(char *restrict s1, const char *restrict s2);

global _ft_strcat

section .text

_ft_strcat:
        mov	rax, rdi	;returns s1
eos:
	cmp	[rdi], byte 0	;if !*s1
	je	append
	inc	rdi
	jmp	eos
	
append:
	cmp	[rsi], byte 0	;if !*s2
	je	return
	mov	r12, [rsi]
        mov	[rdi], r12
	inc	rdi
	inc	rsi
	jmp	append
	
return:
	mov	[rdi], byte 0
	ret
        
