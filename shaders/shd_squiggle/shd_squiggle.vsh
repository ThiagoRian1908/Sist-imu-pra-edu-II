attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vLocalPos;

uniform vec2 u_origin;

void main()
{
    vec4 pos = vec4(in_Position, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * pos;
    v_vColour   = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vLocalPos = (gm_Matrices[MATRIX_WORLD] * pos).xy - u_origin;
}