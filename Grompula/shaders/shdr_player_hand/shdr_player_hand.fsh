//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


bool roughlyEqual(float val, float target){
	
	float tolerance = .015;
	if(abs(val - target) <= tolerance) return true;
	else return false;

}

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

	vec4 colorDifference = getModificationValue();
	
	vec4 color = texture2D( gm_BaseTexture, v_vTexcoord );
	if(roughlyEqual(color.r, 0.0) && roughlyEqual(color.g, 0.57647058823) && roughlyEqual(color.b, 0.8)){
		color -= colorDifference;
	}
	
	gl_FragColor = color;
	
}


