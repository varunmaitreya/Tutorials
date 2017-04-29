<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Stanislaw Eppinger (eppinger@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# AlphaTestState
The AlphaTestState deals with alpha values and decides whether to display it or not. To understand this state it's best to take a look at a simple example.

## Simple Example
For this example we will take the example from the TransparencyRenderer and create three different quads displaced from each other with different alpha values.

<!---INCLUDE src=AlphaTestState.escript, start=49, end=51--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    var geo = new MinSG.GeometryNode(buildMesh(1,0,0,0.5));
    var geo2 = new MinSG.GeometryNode(buildMesh(0,1,0,0.3));
    var geo3 = new MinSG.GeometryNode(buildMesh(0,0,1,0.2));
<!---END_CODESECTION--->

To make it more interesting we set the color of the upper left corner of our quads to be (1, 1, 1, 0), i.e. a white color without transparency.

<!---INCLUDE src=AlphaTestState.escript, start=36, end=40--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    
        // Vertex 3:
        mb.position(new Vec3(0,10,0));
        mb.texCoord0(new Vec2(0,0));
        mb.addVertex();
<!---END_CODESECTION--->

The result will look like this:

![Three semitransparent quads](semi_transparent_quads.png)

Due to interpolation of the color value across the quad performed by the GPU, the alpha value decreases from the upper left corner to the bottem right corner of the quads.   
The AlphaTestState is added before the TransparencyRenderer to take effect:

<!---INCLUDE src=AlphaTestState.escript, start=59, end=60--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    sceneNode += new MinSG.AlphaTestState();
    sceneNode += new MinSG.TransparencyRenderer();
<!---END_CODESECTION--->

Now you can go ahead and play around with the Reference Value and the options in the AlphaTestState. In our example we take the GREATER option and set the Reference Value to 0.17 telling the AlphaTestState to only draw pixels with an alpha value higher than 0.17. We can see how the upper left corner of all three quads isn't drawn because the interpolated alpha values are below our Reference Value. You can try out other options and see how the state changes the rendering

![Light states activated](quads_with_alpha_test.png)



