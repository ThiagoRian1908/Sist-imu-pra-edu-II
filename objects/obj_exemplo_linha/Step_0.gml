/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
timer += timer_spd/60;

if (criar)
{
    instance_create_layer(x, y, layer, obj_exemplo_linha_ghost);
}


if (timer >= 3)
{
    timer = 0;
    criar = true;
    var _posx = indo == false ? xstart + tamanho : xstart;
    
    tween(id, "x", _posx, indice, 90, callback);
}