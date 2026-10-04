draw_set_halign(0);
draw_set_valign(0);

draw_set_font(fnt_tutorial);

var _marg = 3;

var _x = x - sprite_width/2 + _marg;
var _y = y - sprite_height/2 + _marg;

var _larg = (sprite_width * 10) - (_marg / 20);

draw_text_ext_transformed(_x, _y, texto[atual], 150, _larg, 0.1, 0.1, 0);

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);