section	.text	     ;section can also be 'segment' ...
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
;below two lines part of an API usage scenario to call linux kernels' routine...
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;'system call' call kernel, (int = interrupt)
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg db 'Hello, world!', 0xa  ;string to be printed
; db's b is for BYTE, we can have dw too...
; db = define byte :P

len equ $ - msg     ;length of the string
