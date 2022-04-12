// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_personagem_andando(){
	// Codigo de movimentação e colisão
	direita = keyboard_check(ord("D"));
	cima = keyboard_check(ord("W"));
	esquerda = keyboard_check(ord("A"));
	baixo = keyboard_check(ord("S"));

	hvel = (direita - esquerda);
	vvel = (baixo - cima);
	
	veloc = point_direction(x, y, x + hvel, y + vvel);
	
	if hvel != 0 or vvel != 0{
		vel = 2;
	}else{
		vel = 0;
	}
	
	hvel = lengthdir_x(vel, veloc);
	vvel = lengthdir_y(vel, veloc);

	if place_meeting(x + hvel, y, obj_parede){
		while !place_meeting(x + sign(hvel), y, obj_parede){
			x += sign(hvel);
		}
		hvel = 0;
	}

	x += hvel;

	if place_meeting(x, y + vvel, obj_parede){
		while !place_meeting(x, y + sign(vvel), obj_parede){
			y += sign(vvel);
		}
		vvel = 0;
	}

	y += vvel;

	// Codigo para mudar as sprites

	dir = floor((point_direction(x, y, mouse_x, mouse_y)+45)/90);
	if hvel == 0 and vvel == 0{
		switch dir{
			default:
				sprite_index = spr_personagem_parado_direita;
			break;
			case 1:
				sprite_index = spr_personagem_parado_cima;
			break;
			case 2:
				sprite_index = spr_personagem_parado_esquerda;
			break;
			case 3: 
				sprite_index = spr_personagem_parado_baixo;
			break;
		}
	}else{
			switch dir{
			default:
				sprite_index = spr_personagem_correndo_direita;
			break;
			case 1:
				sprite_index = spr_personagem_correndo_cima;
			break;
			case 2:
				sprite_index = spr_personagem_correndo_esquerda;
			break;
			case 3: 
				sprite_index = spr_personagem_correndo_baixo;
			break;
			}
		}
// dash
	if estamina >= 10{
		if mouse_check_button_pressed(mb_right){
			estamina -= 10;
			alarm[1] = 180;
			alarm[0] = 8;
			dash_dir = point_direction(x, y, mouse_x, mouse_y);
			estado = scr_personagem_dash;	
		}
	}
}

function scr_personagem_dash(){
	hvel = lengthdir_x(dash_veloc, dash_dir);
	vvel = lengthdir_y(dash_veloc, dash_dir);
	
	x += hvel;
	y += vvel;
	
	var _inst =instance_create_layer(x, y, "Instances", obj_dash);
	_inst.sprite_index = sprite_index;
}







