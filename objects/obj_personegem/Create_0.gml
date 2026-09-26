//Fisica
vel = 3.5;

//Controlando o player
controla_player = function()
{
	var _cima, _baixo, _esq, _dire;
	
	_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	
	_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	
	_esq = keyboard_check(ord("A")) or keyboard_check(vk_left);
	
	_dire = keyboard_check(ord("D")) or keyboard_check(vk_right);
	
	
	//Movimento
	var velh = (_dire - _esq) * vel;
	
	x += velh;
	
	var velv = (_baixo - _cima) * vel;
	
	y += velv;
	
	//Limites
	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
	
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
}

//Colidindo
colisao = function()
{
    if (place_meeting(x, y, obj_hit))
    {
        game_restart();
    }
}