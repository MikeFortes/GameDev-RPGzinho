/// @description Insert description here
// You can write your code in this editor
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

hvel = (direita - esquerda) * vel;
vvel = (baixo - cima) * vel;

x += hvel;
y += vvel;
