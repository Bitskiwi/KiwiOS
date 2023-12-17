[org 0x7c00]

mov ah, 0x00
mov al, 0x03
int 0x10

mov bx, 0
clear_screen:
    cmp bx, 100
    je clear_screen_exit

    mov ah, 0x06
    int 0x10

    inc bx
    jmp clear_screen
clear_screen_exit:

mov ah, 0x0e
mov bx, string

print_string:
    mov al, [bx]
    cmp al, 0
    je print_string_exit
    int 0x10
    inc bx
    jmp print_string
print_string_exit:

jmp $

string:
    db "testing!", 0

times 510-($-$$) db 0
db 0x55, 0xaa
