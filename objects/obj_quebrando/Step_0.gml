//Variando a movimentação
direcao_x += random_range(-0.05, 0.05);
direcao_x = clamp(direcao_x, -1, 1);

x += direcao_x;

image_alpha -= 0.01;

//Apagando
if (y > room_height + 50)
{
    instance_destroy();
}

if (image_alpha <= 0)
{
    instance_destroy();
}