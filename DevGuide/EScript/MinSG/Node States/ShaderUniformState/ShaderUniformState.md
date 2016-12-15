<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Stanislaw Eppinger (eppinger@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# ShaderUniformState
In PADrend it is possible to set the uniform variables directly via the shader state or through the *ShaderUniformState*. The question might arise: Why having a second state to set uniform variables when you can set them directly in the shader state? One answer could be: When the *ShaderUniformState* is placed after the shader state you can overwrite existing uniform values. 

Let's take a look at an example which does exactly that. 

## Simple Example
This example is similar to the example in the *ShaderState* tutorial. We create a sphere, a chess texture and a shader which will map the chess texture on the sphere. Additionally we expand the fragment shader with a boolean value *showTexture* which determines whether the texture should be shown or not.

<!---INCLUDE src=ShaderUniformState.escript, start=32, end=41--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    var fragmentShaderCode = "
    uniform sampler2D chessTexture;
    uniform bool showTexture;
    
    void main(void) {
        vec2 uv = gl_TexCoord[0].st;
        vec4 result = vec4(1, 0.5, 0.5, 1);
        if (showTexture) result = texture2D(chessTexture, uv);
        gl_FragColor = result;
    }
<!---END_CODESECTION--->

Then we set the uniform values in our shader directly. Our shader will show the texture by default, that's why we set the *showTexture* uniform to true.

<!---INCLUDE src=ShaderUniformState.escript, start=47, end=50--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    // Our chess texture is bound to texture unit 0
    shaderState.setUniform("chessTexture", Rendering.Uniform.INT, [0]);
    // Set the showTexture uniform to true in the shader
    shaderState.setUniform("showTexture", Rendering.Uniform.BOOL, [true]);
<!---END_CODESECTION--->

Afterwards we create our ShaderUniformState and set the *showTexture* uniform to false.

<!---INCLUDE src=ShaderUniformState.escript, start=53, end=54--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    var uniformState = new MinSG.ShaderUniformState();
    uniformState.setUniform("showTexture", Rendering.Uniform.BOOL, [false]);
<!---END_CODESECTION--->

To see our ShaderUniformState taking effect we need to add it to the geometry node after our shader state.

<!---INCLUDE src=ShaderUniformState.escript, start=58, end=59--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    geo += shaderState;
    geo += uniformState;
<!---END_CODESECTION--->

The result will look like this:

![Untextured Sphere](pinkSphere.png)

The sphere will be untextured because our ShaderUniformState sets the *showTexture* uniform to false. When we disable the state or move it before the shader state the sphere will get a chess texture:

![Untextured Sphere](texturedSphere.png)



