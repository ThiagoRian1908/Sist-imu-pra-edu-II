function efeito_squash()
{
	xscale = 1;
	yscale = 1;	
}

function efeito_squash_funcionando(_xscale = 1, _yscale = 1)
{
	xscale = _xscale;
	yscale = _yscale;
}

function retorna_squash(qnt = .1)
{
	xscale = lerp(xscale, 1, qnt);
	yscale = lerp(yscale, 1, qnt);
}

function efeito_squash_desenhado()
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);	
}
