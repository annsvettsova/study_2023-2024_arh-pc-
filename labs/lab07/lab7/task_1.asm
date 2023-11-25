%include 'in_out.asm'
section .data
    msg db "Наименьшее число: ",0h
    a db '52'
    b db '33'
    c db '40'
    smallest db '0'

section .bss
min resb 10
section .text
global _start

_start:
    ; Сравниваем a и b
    mov eax, [a]
    cmp eax, [b]
    jle _compare_c

    ; Если a > b, то a становится наименьшим
    mov eax, [b]
    mov [min], eax
    jmp _end

_compare_c:
    ; Сравниваем наименьшее значение с c
    mov eax, [c]
    cmp eax, [min]
    jle _end

    ; Если c < наименьшего значения, то c становится новым наименьшим
    mov [min], eax

_end:
; Выводим наименьшее значение
mov eax, msg
call sprint ; Вывод сообщения ‘Наименьшее число:’
mov edx,[min]
call iprintLF ; Вывод ‘min(A,B,C)’
call quit

