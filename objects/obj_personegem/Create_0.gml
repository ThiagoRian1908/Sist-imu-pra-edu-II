//Musica
audio_stop_all();
audio_play_sound(snd_musica, 1, 1);

//Fisica
vel = 4;

tempo_lerp = 60 * 1;
timer_lerp = 0;

//Personagem
vidas = 10;
tempo_invencivel = 60;
timer_invencivel = 0;

tempo_acabar = (60 * 60) * 1;
//tempo_acabar = (60) * 1.1;

global.acabou = 0;


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
	
    //Só quando aperta
    var _cima_est, _baixo_est;
    _cima_est = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
    _baixo_est = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
    //Esticando quando anda
    if (_cima_est)
    {
        image_xscale = 0.5;
        image_yscale = 1.8;
    }
    else if (_baixo_est)
    {
        image_xscale = 1.5;
        image_yscale = 0.5;
    }
    
	//Limites
	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
	
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
}

//Desenhando os icones
desenha_icone = function(_imagem = spr_icone_vidas, _vezes = 1, _y = 20)
{

	var _meu_x = 0;
	
	repeat(_vezes)
	{
		draw_sprite_ext(_imagem, 0, 20 + _meu_x, _y, 1, 1, 0, c_white, 0.5);
	
		_meu_x += 25;
	}

	//draw_sprite_ext(spr_icone_escudo, 0, 20, _gui_height - 30, 1, 1, 0, c_white, 0.5);	
	
}

//Colidindo
colisao = function()
{
    if (timer_invencivel > 0) return;
        
        if (place_meeting(x, y, obj_hit))
        {
            if (vidas > 1)
            {
                tremendo(15);
                
                vidas--;
                
                timer_invencivel = tempo_invencivel;
            }
            else 
            {
                //Fazendo o final do jogo
                if (tempo_acabar > 0)
                { 
                    tremendo(50);
            	    game_restart();
                }
                else 
                {
                    instance_create_depth(x, y, +1, obj_cria_sequencias_final);
                    tremendo(50);
                	global.acabou = 1;
                    instance_destroy();
                    with (obj_neutrofilo) 
                    {
                    	instance_destroy();
                    }
                }
                
            }
            
        }
}