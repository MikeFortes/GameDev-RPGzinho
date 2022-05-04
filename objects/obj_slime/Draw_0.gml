/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_slime_sombra, 0, x, y + 4);
draw_self();

//espelhamento da imagem
if dest_x < x{
	image_xscale = -1;
}else{
	image_xscale = 1;
}
