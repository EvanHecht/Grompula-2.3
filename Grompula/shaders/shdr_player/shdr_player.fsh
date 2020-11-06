//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


vec4 getModificationValue()
{


	float diffRed =  0.0 - (v_vColour.r/255.0);
	float diffGreen = 0.68235294117 - (v_vColour.g/255.0);
	float diffBlue = 0.94117647058 - (v_vColour.b/255.0);
	float diffAlpha = -v_vColour.a;
	
	vec4 diffVec = vec4(diffRed, diffGreen, diffBlue, diffAlpha);

	return diffVec;

}


void main()
{
	
	vec4 color = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 modification = getModificationValue();
	
	if(color.r != color.g && color.g != color.b){
		color -= modification;
	}
	
	gl_FragColor = color;
	
}
