if (!instance_exists(obj_personegem)) return;

maquina_de_estados();

timer_fugindo++;

if (timer_fugindo >= tempo_fugindo)
{
    estado = "fugindo";
    
}

//Teste
/*
if (keyboard_check_pressed(vk_shift))
{
    var _ang = 255;
    var _index = 0;
    
    repeat (13) 
    {
        var _quebrado = instance_create_layer(x, y, "Inimigos", obj_quebrando);
        _quebrado.direction = _ang;
        _quebrado.image_index = _index;
        
        _ang += 33;
        _index += 1;
    }
    
    
    instance_destroy();
}*/

//Voltando ao normal
image_yscale = lerp(image_yscale, 1, 0.1);
image_xscale = lerp(image_xscale, 1, 0.1);