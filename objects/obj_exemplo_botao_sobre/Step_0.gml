// Passar o mouse por cima aumenta a escala; tirar volta ao normal.
// Os dois usam a curva selecionada. O tween() já evita recriar enquanto roda.
var _t = global.teste.tempo * game_get_speed(gamespeed_fps);

var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

if (_mouse_sobre) 
{
	tween(id, "image_xscale", 1.5, global.teste.idx, _t);
	tween(id, "image_yscale", 1.5, global.teste.idx, _t);
} else 
{
    tween(id, "image_xscale", 1.0, global.teste.idx, _t);
    tween(id, "image_yscale", 1.0, global.teste.idx, _t);
}
