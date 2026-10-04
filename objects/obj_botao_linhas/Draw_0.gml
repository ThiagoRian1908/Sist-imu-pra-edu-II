//Se desenhando
draw_self();

//Definindo a fonte
draw_set_font(fnt_botao);

//Alinhando
draw_set_halign(1);
draw_set_valign(1);


//Definindo a cor
draw_set_colour(c_white);

//Escrevendo
//draw_text(x, y, texto);
draw_text_transformed(x, y, texto, escala_texto, escala_texto, image_angle);


//Voltando ao normal
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_colour(-1);