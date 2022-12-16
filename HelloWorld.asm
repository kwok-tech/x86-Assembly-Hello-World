; HelloWorld.asm
;
; Author: Jack Kwok
; Date: Dec/15/2022
; Learning x86 Assembly

global _start

section .text:
_start:
    ; unistd_32.h: #define __NR_write                  4  
    mov eax, 0x4 ; Use write syscall

    ; unistd.h: ssize_t write(int fd, const void *buf, size_t count)
    ; return value: populate eax value
    mov ebx, 1              ; stdout as fd
    mov ecx, output         ; output as buf
    mov edx, outputLength   ; outputLength as count
    ; unistd_32.h: #define __NR_getgroups                 80
    int 0x80                ; invoke/run syscall: int-interupt, 0x80 identifer for running syscall
    
    ; unistd_32.h: #define __NR_exit                  1
    mov eax, 0x1            ; exit syscall
    mov ebx, 0              ; return 0 on success
    int 0x80                ; invoke syscall

section .data:
    ;output var name, db define bytes,"" string type, 0xA \n
    output: db "Hello World!", 0xA
    ;nasm link and turn obj understands $- is a length syscall
    outputLength equ $-output


;nasm on linux command line:
;download nasm
; sudo pacman -S nasm
;create obj file using this asm with nasm
; nasm -f elf32 -o HelloWorld.o HelloWorld.asm
;create executable file using object file
; ld -m elf_i386 -o  HelloWorld HelloWorld.o
;run executable
;./HelloWorld
