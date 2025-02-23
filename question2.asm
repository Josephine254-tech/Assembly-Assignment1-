section .data
    hello db 'Hello, World!',0x0a  ; 'Hello, World!' string with a newline character

section .bss
    buffer resb 128    ; Reserved space for a buffer of 128 bytes

section .text
    global _start

_start:
    ; Write 'Hello, World!' to stdout
    mov eax, 4          ; system call number (sys_write)
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; pointer to string
    mov edx, 13         ; number of bytes to write
    int 0x80            ; call kernel

    ; Exit program
    mov eax, 1          ; system call number (sys_exit)
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel
