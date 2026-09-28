/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

draw_set_halign(1);
draw_set_valign(1);
draw_set_font(fnt_exemplo_botao);
draw_text_transformed(x, y, texto, escala_txt, escala_txt, image_angle);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
