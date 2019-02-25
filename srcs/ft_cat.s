	;ft_cat
	;reads files sequentially, writing them to the standard output.
	;void ft_cat(int fd)

%define buff_size 4096
	
global _ft_cat
extern _read
	
section .text

_ft_cat:
	push	rbp		;stack alignement
	mov	rbp, rsp
	lea	rsi, [rel buffer] ;read buffer
	push	r12
	mov	r12, rdi	  ;callee saved
	mov	rdx, buff_size
	mov	rax, 0x2000003	  ;read
	
print_buffer:
	syscall
	cmp	rax, 1		;if error || 0 byte read
	jl	return
        mov	rdi, 1		;stdout
	lea	rsi, [rel buffer]
	mov	rdx, rax
	mov	rax, 0x2000004	;write
	syscall
        cmp	rax, -1		;if error
	je	return
	mov	rdi, r12
	lea	rsi, [rel buffer]
	mov	rdx, buff_size
        mov	rax, 0x2000003	;read
	jmp	print_buffer

return:
	pop	r12
	pop	rbp
	ret
	
section .bss
buffer: resb buff_size
