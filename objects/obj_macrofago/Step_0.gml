//Me destruindo quando a sequência acaba
if (!in_sequence and criando_em_sequencia)
{
    instance_destroy();
}

if (place_meeting(x, y, obj_celula_B))
{
    image_xscale = 1.5;
    image_yscale = 1.5;
}