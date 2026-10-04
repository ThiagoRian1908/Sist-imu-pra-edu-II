tempo_criando = 60 * 15;
timer_criando = 0;

criando = function()
{
    var _x = choose(-50, room_width + 50);
    
    if (timer_criando >= tempo_criando)
    {
        instance_create_layer(_x, -40, "Inimigos", obj_celula_B);
        
        timer_criando = 0;
    }
}