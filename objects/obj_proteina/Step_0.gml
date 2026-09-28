//Variando a movimentação
direcao_x += random_range(-0.05, 0.05);
direcao_x = clamp(direcao_x, -1, 1);

x += direcao_x;

//Apagando
if (y > room_height + 50)
{
    instance_destroy();
}