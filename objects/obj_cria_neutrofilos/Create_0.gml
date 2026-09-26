tempo_criando = 60 * 10;
timer_criando = 0;

criando = function()
{
    var _x = random_range(30, room_width - 30);
    
    if (timer_criando >= tempo_criando)
    {
        instance_create_layer(_x, -40, "Inimigos", obj_neutrofilo);
        
        timer_criando = 0;
    }
}