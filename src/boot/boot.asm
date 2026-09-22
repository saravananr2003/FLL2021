bits 16
org 0x7C00

start:
    ; Set up segments
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00 ; Stack grows downwards from where we are loaded

    ; Print welcome message
    mov si, welcome_msg
    call print_string

    ; Print DOS compatibility mode message
    mov si, dos_msg
    call print_string

    ; Halt the system
.halt:
    cli
    hlt
    jmp .halt

; Routine to print a null-terminated string pointed to by SI
print_string:
    mov ah, 0x0E ; BIOS teletype function
.loop:
    lodsb        ; Load next character from SI into AL, increment SI
    test al, al  ; Check if it's the null terminator
    jz .done
    int 0x10     ; Call BIOS video interrupt
    jmp .loop
.done:
    ret

; Data section
welcome_msg db 'Starting SoonaPaana O/S...', 0x0D, 0x0A, 0
dos_msg db 'Initializing DOS compatibility layer...', 0x0D, 0x0A, 0

; Boot sector padding and magic number
times 510-($-$$) db 0
dw 0xAA55
