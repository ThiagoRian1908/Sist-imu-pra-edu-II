//Voltando ao normal
image_yscale = lerp(image_yscale, 1, 0.1);
image_xscale = lerp(image_xscale, 1, 0.1);

if (place_meeting(x, y, obj_celula_T))
{
    sprite_index = spr_celula_T_memoria;
}