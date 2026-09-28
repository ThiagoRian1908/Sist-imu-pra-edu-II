maquina_de_estados();

timer_fugindo++;

if (timer_fugindo >= tempo_fugindo)
{
    estado = "fugindo";
    
}


//Voltando ao normal
image_yscale = lerp(image_yscale, 1, 0.1);
image_xscale = lerp(image_xscale, 1, 0.1);