/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();


var _x1 = xstart;
var _y1 = ystart;
var _x2 = xstart + tamanho;
var _y2 = _y1;

draw_line_width(_x1, _y1, _x2, _y2, 2);
draw_set_halign(1);
draw_set_valign(1);
draw_text(_x1 + tamanho/2, _y1 + 12, minha_linha);
draw_set_halign(-1);
draw_set_valign(-1);