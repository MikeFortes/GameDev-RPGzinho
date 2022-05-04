// Script assets have changed for v2.3.0 see

// Escolhendo um estado
function scr_slime_escolher_estado(){
	prox_estado = choose(scr_slime_andando, scr_slime_parado);
		if prox_estado = scr_slime_andando{
			estado = scr_slime_andando;
			dest_x = irandom_range(0, room_width);
			dest_y = irandom_range(0, room_height);
		}else if prox_estado = scr_slime_parado{
			estado = scr_slime_parado;
		}
}

function scr_slime_andando(){

}

function scr_slime_parado(){
	image_speed = 0.5;
}
