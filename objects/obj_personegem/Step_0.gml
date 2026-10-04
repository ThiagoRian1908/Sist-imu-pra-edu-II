controla_player();
colisao();

//Mantendo o player vencível
timer_invencivel--;

//Fazendo o jogo acabar
tempo_acabar--;

//Ficando preso
if (place_meeting(x, y, obj_tiro_prende))
{
    image_blend = c_red;
    vel = 0;
}
else 
{
	vel = 3.5;
    image_blend = c_white;
}



if (keyboard_check_pressed(ord("R")))
{
    game_restart();
}


//Mantendo a escala
image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = lerp(image_yscale, 1, 0.1);

