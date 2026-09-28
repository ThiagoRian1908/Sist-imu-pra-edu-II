/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_alpha -= 0.05;
image_xscale -= 0.05;
image_yscale = image_xscale;

if (image_alpha <= 0) instance_destroy();