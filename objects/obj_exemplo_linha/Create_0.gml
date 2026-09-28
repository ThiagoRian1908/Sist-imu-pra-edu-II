/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
anim_names = [
		"back", "flat", "elastic", "bounce", "ease",
		"linear",
		"sine_in",    "sine_out",    "sine_inout",
		"quad_in",    "quad_out",    "quad_inout",
		"cubic_in",   "cubic_out",   "cubic_inout",
		"quart_in",   "quart_out",   "quart_inout",
		"quint_in",   "quint_out",   "quint_inout",
		"expo_in",    "expo_out",    "expo_inout",
		"circ_in",    "circ_out",    "circ_inout",
		"back_in",    "back_out",    "back_inout",
		"elastic_in", "elastic_out", "elastic_inout",
		"bounce_in",  "bounce_out",  "bounce_inout"
];

indice          = global.numero;
minha_linha     = anim_names[indice];
tamanho         = 300;
global.numero++;


indo            = false;

timer           = 1;
timer_spd       = 1;
criar           = false;

callback = function()
{
    indo  = !indo;
    criar = false;
}