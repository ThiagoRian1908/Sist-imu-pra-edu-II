//Trocando as páginas
if (keyboard_check_pressed(vk_space))
{
    //Som
    audio_play_sound(snd_tutorial, 1, 0);
    
    //Mudando o frame
    image_index += 1;
    
    //Indo pro jogo
    if (image_index > image_number - 1)
    {
        image_index = 0;
    }
}

