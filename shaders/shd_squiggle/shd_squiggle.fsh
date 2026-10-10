varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vLocalPos;

uniform vec4 u_params; // x = time, y = fps, z = strength (px), w = scale (px)
uniform vec2 u_texel;

#define PI 3.14159265
#define E  2.71828183

float hash(vec2 p) { return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453); }

float noise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash(i), hash(i + vec2(1.0, 0.0)), f.x),
               mix(hash(i + vec2(0.0, 1.0)), hash(i + vec2(1.0, 1.0)), f.x), f.y);
}

void main()
{
    vec2 offset = mod(floor(u_params.x * u_params.y) * vec2(PI, E), 100.0) * 10.0;
    float angle = noise(v_vLocalPos / u_params.w + offset) * 4.0 * PI;
    vec2 uv = v_vTexcoord + vec2(cos(angle), sin(angle)) * u_params.z * u_texel;
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, uv);
}