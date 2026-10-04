//Trocando as páginas
if (keyboard_check_pressed(vk_space))
{
    image_index += 1;
    
    //Indo pro jogo
    if (image_index > image_number - 1)
    {
        image_index = 0;
    }
}

