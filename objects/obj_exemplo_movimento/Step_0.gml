//Ao clicar ele vai para o lado oposto da sala
var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);
if (_mouse_sobre) 
{
    if (_mouse_click)
    {
        var _t = global.teste.tempo * game_get_speed(gamespeed_fps);
    	movido = !movido;
    	var _alvo = movido ? destino_x : xstart;
    	tween(id, "x", _alvo, global.teste.idx, _t);
    }
}
