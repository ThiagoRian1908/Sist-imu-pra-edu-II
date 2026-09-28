//Efeito de virar, o alvo determina qual a nova escala dele
var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);
if (_mouse_sobre) 
{
    if (_mouse_click)
    {
        var _t = global.teste.tempo * game_get_speed(gamespeed_fps);
    	virado = !virado;
    	var _alvo = virado ? -1 : 1;
    	tween(id, "image_xscale", _alvo, global.teste.idx, _t);
    }
}
