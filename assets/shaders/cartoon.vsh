attribute vec4 a_position;
attribute vec2 a_texcoord0;
uniform mat4 u_viewproj;
uniform vec2 u_texcoordDelta;

varying vec4 v_texcoord0;
varying vec4 v_texcoord1;
varying vec4 v_texcoord2;
varying vec4 v_texcoord3;
varying vec4 v_texcoord4;
varying vec4 v_texcoord5;
varying vec4 v_texcoord6;

float scaleoffset = 0.8; //edge detection offset

void main()
{
  float x = u_texcoordDelta.x*scaleoffset;
  float y = u_texcoordDelta.y*scaleoffset;
  vec2 dg1 = vec2( x,y);
  vec2 dg2 = vec2(-x,y);
  vec2 dx  = vec2(x,0.0);
  vec2 dy  = vec2(0.0,y);
  gl_Position = u_viewproj * a_position;
  v_texcoord0=a_texcoord0.xyxy;
  v_texcoord1.xy = v_texcoord0.xy - dy;
  v_texcoord2.xy = v_texcoord0.xy + dy;
  v_texcoord3.xy = v_texcoord0.xy - dx;
  v_texcoord4.xy = v_texcoord0.xy + dx;
  v_texcoord5.xy = v_texcoord0.xy - dg1;
  v_texcoord6.xy = v_texcoord0.xy + dg1;
  v_texcoord1.zw = v_texcoord0.xy - dg2;
  v_texcoord2.zw = v_texcoord0.xy + dg2;

}
