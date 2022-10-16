/// @description Insert description here
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

hveloc = (direita - esquerda) * veloc;
x += hveloc;

vveloc = (baixo - cima) * veloc;
y += vveloc;




