<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# Texture Mapping
The easiest way to add textures to a certain scene node is by adding a `TextureState` to it. As every state, it is added directly to a node. If the node is rendered, each state is enabled. In the case of `TextureState`s, this means that it will automatically upload the texture to the correct texture unit of the GPU. Therefore the shader can access the texture correctly. If you have not provided an own shader, the default shader will be used, which renders the mesh using color blending and texture mapping. Typically you will therefore set the color to white.

A `TextureState` is created and used the following way:
```
node += new MinSG.TextureState(texture);
```
where node is a `MinSG.Node`, like a `GeometryNode` or `ListNode`. The `texture` variable must hold a valid OpenGL texture, which could be obtain from file via: `Rendering.createTextureFromFile(file)`
> Remember that any node will inherit all states from their ancestors. Therefore if you add a `TextureState` to a `ListNode`, all child nodes will be textured.

The default shader can only texture the mesh correctly, if the vertices have a texture attribute.

## Example
In this simple example we construct a simple quad mesh and add a chess pattern to it:
<!---INCLUDE src=Texturing.escript, start=14, end=63--->
First of all we just declare two static variable in order to access the `Vec2` and `Vec3` classes without using the full name, like `Geometry.Vec3`. Afterwards we define a simple function, which is used to generate a simple mesh. This mesh consists of only four vertices:
```
(0,10,0) --- (10,10,0)
   |             |
   |             |
   |             |
(0,0,0)  --- (10,0,0)
```
Each vertex gets a 2D vector describing the texture coordinate of this vertex. Texture coordinates are given in texture space, therefore the origin (0,0) lies in the bottom left corner and NOT in the top left corner. Furthemore this space is normalized, therefore the top right corner of any texture, regardlessly of the size, has the coordinate (1,1).
If you specify a value that goes beyond the range (0,0) - (1,1), the behavior depends on the settings. By default it is set to `wrap` mode. This means that only the fractional part of a coordinate is used and therefore it 'wraps around'.

In this simple example we just create a chess texture by using a little helper function:
```
var chess = Rendering.createChessTexture(1024, 1024, 64);
```
The first two arguments specify the size of the texture and the last argument specifies the side length of a single chess tile. Afterwards we create a new texture state.

Now we could change the texture unit of this state, by using `setTextureUnit(unit)`. The default shader will only use texture unit 0, but if you provide an own shader, you could of course use all texture units.
