if (keyboard_check_pressed(vk_space))
{
    if (atual < array_length(texto) - 1)
    {
        //Aumentando o atual
        atual++;
        
    }
    else
    {
        atual = 0;
    }
}
