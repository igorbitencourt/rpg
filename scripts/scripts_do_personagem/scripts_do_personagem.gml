// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_personagem_andando(){
//MOVIMENTAÇÃO
	direita = keyboard_check(ord("D"));
	esquerda = keyboard_check(ord("A"));
	cima = keyboard_check(ord("W"));
	baixo = keyboard_check(ord("S"));

	hveloc = (direita - esquerda) * veloc;
	//colisão horizontal
	if place_meeting(x + hveloc, y, obj_parede){
		while !place_meeting(x + sign(hveloc), y, obj_parede) {
			x += sign(hveloc);
		}
		hveloc = 0;
	}
	x += hveloc;



	vveloc = (baixo - cima) * veloc;
	//colisão vertical
	if place_meeting(x, y + vveloc, obj_parede){
		while !place_meeting(x, y + sign(vveloc), obj_parede) {
			y += sign(vveloc);
		}
		vveloc = 0;
	}
	y += vveloc;

//MUDANÇA DE SPRITE

dir = floor((point_direction(x, y, mouse_x, mouse_y) + 45)/90);

if hveloc == 0 and vveloc == 0 {
switch dir {
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
}else {
	switch dir {
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
	if mouse_check_button_pressed(mb_right){
		alarm[0] = 8;
		dash_dir = point_direction(x, y, mouse_x, mouse_y);
		estado = scr_personagem_dash;
	}
}

function scr_personagem_dash(){
	hveloc = lengthdir_x(dash_veloc, dash_dir);
	vveloc = lengthdir_y(dash_veloc, dash_dir);
	
	x += hveloc;
	y += vveloc;
	
	var _inst = instance_create_layer(x, y, "Instances", obj_dash);
	_inst.sprite_index = sprite_index;
}