section .data
    message db "Entrez un calcul: ", 0
    input_buffer db 100, 0
    output_buffer db 100, 0
    newline db 0xA, 0
    output_1 db "Vous avez entrez ce calcul ? ", 0

section .bss
    input_length resb 1

section .text
    global _start

_start:
    ; Afficher le message demandant une saisie
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 18
    int 0x80

    ; Lire la saisie de l'utilisateur
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 100
    int 0x80

    ; Déterminer la longueur de la saisie de l'utilisateur
    mov esi, input_buffer
    xor ecx, ecx
find_length:
    cmp byte [esi + ecx], 0
    je length_found
    inc ecx
    jmp find_length
length_found:
    mov [input_length], ecx

    ; Afficher le message "Vous avez entrez ce calcul ? "
    mov eax, 4
    mov ebx, 1
    mov ecx, output_1
    mov edx, 29 ; Longueur du message "Vous avez entrez ce calcul ? "
    int 0x80

    ; Afficher la saisie de l'utilisateur
    mov eax, 4
    mov ebx, 1
    mov ecx, input_buffer
    mov edx, [input_length]  ; Utiliser la longueur réelle de la saisie
    int 0x80

    ; Ajouter un saut de ligne
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Sortir du programme
    mov eax, 1   ; Code système pour exit
    mov ebx, 0   ; Code de sortie (0 pour succès)
    int 0x80