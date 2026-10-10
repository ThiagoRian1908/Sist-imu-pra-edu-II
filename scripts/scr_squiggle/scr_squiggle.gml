/// Squigglevision — uso:
///   squiggle_begin();  ...desenhe...  squiggle_end();
/// Opcional: squiggle_config(strength, scale, fps) para mudar o padrão global.

global.__squiggle = {
    strength : 0.5, // deslocamento em pixels
    scale    : 48,   // tamanho das ondas (menor = tremido mais fino)
    fps      : 6,   // trocas de padrão por segundo
    ready    : false,
};

/// @func squiggle_config(strength, [scale], [fps])
function squiggle_config(_strength, _scale = undefined, _fps = undefined)
{
    var _s = global.__squiggle;
    _s.strength = _strength;
    if (_scale != undefined) _s.scale = _scale;
    if (_fps   != undefined) _s.fps   = _fps;
}

/// @func squiggle_begin([strength], [anchor_x], [anchor_y], [sprite])
/// anchor: ponto ao qual o padrão fica "preso" (padrão: x/y da instância)
function squiggle_begin(_strength = undefined, _ax = x, _ay = y, _sprite = sprite_index)
{
    var _s = global.__squiggle;
    if (!_s.ready)
    {
        _s.u_params = shader_get_uniform(shd_squiggle, "u_params");
        _s.u_texel  = shader_get_uniform(shd_squiggle, "u_texel");
        _s.u_origin = shader_get_uniform(shd_squiggle, "u_origin");
        _s.ready = true;
    }

    // tamanho do texel da texture page (todas as pages costumam ter o mesmo tamanho)
    var _tw = 1 / 2048, _th = 1 / 2048;
    if (sprite_exists(_sprite))
    {
        var _tex = sprite_get_texture(_sprite, 0);
        _tw = texture_get_texel_width(_tex);
        _th = texture_get_texel_height(_tex);
    }

    shader_set(shd_squiggle);
    shader_set_uniform_f(_s.u_params, current_time / 1000, _s.fps, _strength ?? _s.strength, _s.scale);
    shader_set_uniform_f(_s.u_texel, _tw, _th);
    shader_set_uniform_f(_s.u_origin, _ax, _ay);
}

function squiggle_end()
{
    shader_reset();
}


/// @func squiggle_layer(layer, [strength])
/// @param {Id.Layer|String} layer    id ou nome da layer
/// @param {Real}            strength opcional; usa o valor global se omitido
function squiggle_layer(_layer, _strength = undefined)
{
    var _lay = is_string(_layer) ? layer_get_id(_layer) : _layer;

    var _ctx = {
        lay      : _lay,
        bg       : layer_background_get_id(_lay), // -1 se não for layer de background
        strength : _strength,
    };

    layer_script_begin(_lay, method(_ctx, function()
    {
        if (event_type != ev_draw || event_number != 0) return;

        // lê o sprite na hora do desenho: se o fundo for trocado em runtime, continua certo
        var _spr = (bg != -1) ? layer_background_get_sprite(bg) : -1;

        // âncora = posição da layer: o padrão acompanha o fundo se ele tiver scroll
        squiggle_begin(strength, layer_get_x(lay), layer_get_y(lay), _spr);
    }));

    layer_script_end(_lay, method(_ctx, function()
    {
        if (event_type == ev_draw && event_number == 0) squiggle_end();
    }));
}

/// @func squiggle_layer_remove(layer)
function squiggle_layer_remove(_layer)
{
    var _lay = is_string(_layer) ? layer_get_id(_layer) : _layer;
    layer_script_begin(_lay, -1);
    layer_script_end(_lay, -1);
}

#region Texto

/// @func squiggle_draw_text(x, y, text)
function squiggle_draw_text(_x, _y, _text)
{
    var _c = draw_get_colour();
    __squiggle_text(_x, _y, _text, -1, -1, 1, 1, 0, _c, _c, _c, _c, draw_get_alpha());
}

/// @func squiggle_draw_text_ext(x, y, text, sep, w)
function squiggle_draw_text_ext(_x, _y, _text, _sep, _w)
{
    var _c = draw_get_colour();
    __squiggle_text(_x, _y, _text, _sep, _w, 1, 1, 0, _c, _c, _c, _c, draw_get_alpha());
}

/// @func squiggle_draw_text_transformed(x, y, text, xscale, yscale, angle)
function squiggle_draw_text_transformed(_x, _y, _text, _xscale, _yscale, _angle)
{
    var _c = draw_get_colour();
    __squiggle_text(_x, _y, _text, -1, -1, _xscale, _yscale, _angle, _c, _c, _c, _c, draw_get_alpha());
}

/// @func squiggle_draw_text_colour(x, y, text, c1, c2, c3, c4, alpha)
function squiggle_draw_text_colour(_x, _y, _text, _c1, _c2, _c3, _c4, _alpha)
{
    __squiggle_text(_x, _y, _text, -1, -1, 1, 1, 0, _c1, _c2, _c3, _c4, _alpha);
}

/// @func squiggle_draw_text_ext_transformed(x, y, text, sep, w, xscale, yscale, angle)
function squiggle_draw_text_ext_transformed(_x, _y, _text, _sep, _w, _xscale, _yscale, _angle)
{
    var _c = draw_get_colour();
    __squiggle_text(_x, _y, _text, _sep, _w, _xscale, _yscale, _angle, _c, _c, _c, _c, draw_get_alpha());
}

/// @func squiggle_draw_text_ext_colour(x, y, text, sep, w, c1, c2, c3, c4, alpha)
function squiggle_draw_text_ext_colour(_x, _y, _text, _sep, _w, _c1, _c2, _c3, _c4, _alpha)
{
    __squiggle_text(_x, _y, _text, _sep, _w, 1, 1, 0, _c1, _c2, _c3, _c4, _alpha);
}

/// @func squiggle_draw_text_transformed_colour(x, y, text, xscale, yscale, angle, c1, c2, c3, c4, alpha)
function squiggle_draw_text_transformed_colour(_x, _y, _text, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha)
{
    __squiggle_text(_x, _y, _text, -1, -1, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
}

/// @func squiggle_draw_text_ext_transformed_colour(x, y, text, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha)
function squiggle_draw_text_ext_transformed_colour(_x, _y, _text, _sep, _w, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha)
{
    __squiggle_text(_x, _y, _text, _sep, _w, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
}

/// Interna: desenha o texto num surface e aplica o squiggle nele
function __squiggle_text(_x, _y, _text, _sep, _w, _xs, _ys, _ang, _c1, _c2, _c3, _c4, _alpha)
{
    static _surf = -1;
    var _pad = 4;

    // tamanho do texto já com escala
    var _sx = abs(_xs), _sy = abs(_ys);
    var _tw = string_width_ext(_text, _sep, _w) * _sx;
    var _th = string_height_ext(_text, _sep, _w) * _sy;
    var _sw = ceil(_tw) + _pad * 2;
    var _sh = ceil(_th) + _pad * 2;

    if (!surface_exists(_surf) || surface_get_width(_surf) < _sw || surface_get_height(_surf) < _sh)
    {
        if (surface_exists(_surf)) surface_free(_surf);
        _surf = surface_create(max(_sw, 64), max(_sh, 64));
    }

    // ponto de âncora conforme o alinhamento atual
    var _ha = draw_get_halign(), _va = draw_get_valign();

    var _ox = 0;
    if (_ha == fa_center) _ox = _tw * 0.5;
    else if (_ha == fa_right) _ox = _tw;

    var _oy = 0;
    if (_va == fa_middle) _oy = _th * 0.5;
    else if (_va == fa_bottom) _oy = _th;

    gpu_push_state();

    // 1) texto no surface, em alpha pré-multiplicado (cores e bordas corretas)
    surface_set_target(_surf);
    draw_clear_alpha(c_black, 0);
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
    draw_text_ext_transformed_colour(_pad + _ox, _pad + _oy, _text, _sep, _w, _sx, _sy, 0, _c1, _c2, _c3, _c4, 1);
    surface_reset_target();

    // 2) posição do canto do surface, com rotação/espelhamento em volta de (x, y)
    var _lx = -(_pad + _ox) * sign(_xs);
    var _ly = -(_pad + _oy) * sign(_ys);
    var _cs = dcos(_ang), _sn = dsin(_ang);
    var _dx = _x + _lx * _cs + _ly * _sn;
    var _dy = _y - _lx * _sn + _ly * _cs;

    // 3) desenha com squiggle, usando o texel do surface
    var _tex = surface_get_texture(_surf);
    gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
    squiggle_begin(undefined, _x, _y, -1);
    shader_set_uniform_f(global.__squiggle.u_texel, texture_get_texel_width(_tex), texture_get_texel_height(_tex));
    var _premul = make_colour_rgb(255 * _alpha, 255 * _alpha, 255 * _alpha);
    draw_surface_ext(_surf, _dx, _dy, sign(_xs), sign(_ys), _ang, _premul, _alpha);
    squiggle_end();

    gpu_pop_state();
}

#endregion