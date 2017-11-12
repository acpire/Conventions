;(int x, int y, float z, float r, double t, char e); 
extern   printf
%if win64
global _f
%else
global _f_cdecl
global _f_stdcall
global _f_fastcall
%endif

section .data
text: db "%f", "0"
section .TEXT

%if win64
_f:
sub esp, 40
movq xmm4, [rsp+80]
mov al, [rsp+88]
cvtsi2ss xmm0, ecx
cvtsi2ss xmm1, edx
cvtsd2ss xmm4, xmm4
cvtsi2ss xmm5, eax
addss xmm1,xmm0
addss xmm1, xmm2
addss xmm1, xmm3
addss xmm1, xmm4
addss xmm1, xmm5
mov rcx, text
call printf
add esp, 40
ret
%else
_f_cdecl:
mov eax, [esp+4]
mov edx, [esp+8]
cvtsi2ss xmm0, eax
cvtsi2ss xmm1, edx
movss xmm2, [esp+12]
movss xmm3, [esp+16]
cvtsd2ss xmm4, [esp+20]
xor eax, eax
mov al, [esp+28]
cvtsi2ss xmm5, eax
addss xmm0, xmm1
addss xmm0, xmm2
addss xmm0, xmm3
addss xmm0, xmm4
addss xmm0, xmm5
sub esp, 8
movss [esp+4], xmm0
mov eax, text
mov [esp], eax
call printf
add esp, 8
ret
_f_stdcall:
mov eax, [esp+4]
mov edx, [esp+8]
cvtsi2ss xmm0, eax
cvtsi2ss xmm1, edx
movss xmm2, [esp+12]
movss xmm3, [esp+16]
cvtsd2ss xmm4, [esp+20]
xor eax, eax
mov al, [esp+28]
cvtsi2ss xmm5, eax
addss xmm0, xmm1
addss xmm0, xmm2
addss xmm0, xmm3
addss xmm0, xmm4
addss xmm0, xmm5
sub esp, 8
movss [esp+4], xmm0
mov eax, text
mov [esp], eax
call printf
add esp, 8
ret 26
_f_fastcall:
mov eax, ecx
cvtsi2ss xmm0, eax
cvtsi2ss xmm1, edx
movss xmm2, [esp+4]
movss xmm3, [esp+8]
cvtsd2ss xmm4, [esp+12]
xor eax, eax
mov al, [esp+20]
cvtsi2ss xmm5, eax
addss xmm0, xmm1
addss xmm0, xmm2
addss xmm0, xmm3
addss xmm0, xmm4
addss xmm0, xmm5
sub esp, 8
movss [esp+4], xmm0
mov eax, text
mov [esp], eax
call printf
add esp, 8
ret 26
%endif
