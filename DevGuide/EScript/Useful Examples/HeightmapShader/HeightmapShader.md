<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# Shader example: Heightmap
This simple example will render a terrain based on a heightmap. Instead of building a mesh based on the heightmap, the mesh itself is just a regular grid and the heightmap is applied in the vertex shader.
The full example can be found in [Heightmap.escript](Heightmap.escript).

First of all, we define a simple function, which will create a regular grid:

<!---INCLUDE src=Heightmap.escript, start=18, end=34--->

For each vertex we basically only need the position and the texture coordinate. The y-component of each vertex will be modified inside of the vertex shader. The texture coordinate is used to access the correct pixel of the heightmap.

The vertex shader looks like this:

<!---INCLUDE src=Heightmap.escript, start=47, end=62--->

First of all we look up the corresponding pixel from the texture and use the value as a height. We use two uniforms in order to scale and offset this height value.

The fragment shader is a bit shorter:

<!---INCLUDE src=Heightmap.escript, start=64, end=70--->

Here we just set the color based on the height of each fragment.

The final result looks like this:
![Heightmap](Heightmap.jpg)
