# Shader example: Heightmap
This simple example will render a terrain based on a heightmap. Instead of building a mesh based on the heightmap, the mesh itself is just a regular grid and the heightmap is applied in the vertex shader.
The full example can be found in [Heightmap.escript](Heightmap.escript).

First of all, we define a simple function, which will create a regular grid:
```
// creates a regular grid of the size width*height. Each single grid cell has a size of tileSize*tileSize
var makeGrid = fn(Number width, Number height, Number tileSize = 1) {
	var xTiles = width / tileSize; // number of tiles in x direction
	var mb = new Rendering.MeshBuilder();
	mb.color(new Util.Color4f(1, 1, 1, 1));
	for(var y=0; y<height; y+=tileSize) {
		for(var x=0; x<width; x+=tileSize) {
			mb.position(new Vec3(x * tileSize, 0, y * tileSize));
			mb.texCoord0(new Vec2(x / width, y / height));
			var id = mb.addVertex();
			if(x > 0 && y > 0) {
				mb.addQuad(id, id - xTiles, id - xTiles - 1, id - 1);
			}
		}
	}
	return mb.buildMesh();
};
```
For each vertex we basically only need the position and the texture coordinate. The y-component of each vertex will be modified inside of the vertex shader. The texture coordinate is used to access the correct pixel of the heightmap.

The vertex shader looks like this:
```
uniform sampler2D heightmap;
uniform float scale = 1.0;
uniform float offset = 0.0;

varying float normalizedHeight;
varying float height;

void main(void) {
	normalizedHeight = texture2D(heightmap, gl_MultiTexCoord0.st).r;
	height = offset + scale * normalizedHeight;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	vec4 pos = ftransform();
	pos.y += height;
	gl_Position = pos;
}
```
First of all we look up the corresponding pixel from the texture and use the value as a height. We use two uniforms in order to scale and offset this height value.

The fragment shader is a bit shorter:
```
varying float normalizedHeight;
varying float height;

void main(void) {
	gl_FragColor = vec4(normalizedHeight, normalizedHeight, normalizedHeight, 1);
}
```
Here we just set the color based on the height of each fragment.

The final result looks like this:
![Heightmap](Heightmap.jpg)
