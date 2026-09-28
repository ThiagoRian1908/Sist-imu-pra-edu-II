global.numero = 0;


function teste_setup() 
    {
	//estado compartilhado (criado uma única vez)
	if (!variable_global_exists("teste")) 
    {
		global.teste = 
        {
			idx   : 0,    
			tempo : 1.00,
		};
	}

	//Só vou ter um view ativo por vez.
	static _montado = false;
	if (_montado) return;
	_montado = true;

	//Lista dos textos possíveis 
	var _nomes = 
    [
		"back","flat","elastic","bounce","ease","linear",
		"sine_in","sine_out","sine_inout","quad_in","quad_out","quad_inout",
		"cubic_in","cubic_out","cubic_inout","quart_in","quart_out","quart_inout",
		"quint_in","quint_out","quint_inout","expo_in","expo_out","expo_inout",
		"circ_in","circ_out","circ_inout","back_in","back_out","back_inout",
		"elastic_in","elastic_out","elastic_inout","bounce_in","bounce_out","bounce_inout"
	];

	//Mostrando a lista de opção
	var _opcoes = "";
	for (var i = 0; i < array_length(_nomes); i++) 
    {
		_opcoes += (i > 0 ? "," : "") + _nomes[i] + ":" + string(i);
	}

	show_debug_overlay(true);
	dbg_view("Testes de Tween", true, 60, 80, 360, 320);

	dbg_section("Configuração");
	dbg_drop_down(ref_create(global.teste, "idx"), _opcoes, "Curva");
	dbg_slider(ref_create(global.teste, "tempo"), 0.1, 3, "Duração (s)", 0.1);

	dbg_section("Como testar");
	dbg_text("Botão:     passe / tire o mouse (escala)");
	dbg_text("Movimento: clique para ir / voltar");
	dbg_text("Giro:      clique para virar (xscale)");

	dbg_section("Ações");
	dbg_button("Resetar", function() 
    {
		with (obj_tween) instance_destroy();
		with (obj_teste_botao)     { image_xscale = 1; image_yscale = 1; }
		with (obj_teste_movimento) { x = xstart; y = ystart; movido = false; }
		with (obj_teste_giro)      { image_xscale = 1; virado = false; }
	});
}
