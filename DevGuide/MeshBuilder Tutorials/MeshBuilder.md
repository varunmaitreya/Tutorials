# Goal of this tutorial


# Creating a box by using PADRend's _MeshBuilder_
A box is made of four quads which are arranged together.
It contains of eight vertecies, which are the corners of the box.
Before building a box we need first to instanciate a _MeshBuilder_ object.
<!--TODO add codesection here -->
The mesh builder is than feed with the eight corners of the box.
Note that the method _addVertex_ takes eight parameters.
The first parameter is the positon of the vertex.
It takes a _Geoemetry.Vec3_.
The second parameter also takes a _Geoemetry.Vec3_ and defines the normal of the vertex.
The following four parameters are responsible for color of the vertex.
It needs to be given in RGBA format.
The last two parameters define the texture coordinates.
When a vertex is added to the _meshBuilder_, it is placed at the end of a list.
The _addVertex_ method returns the index of the vertex within the list.
Initialy the list is empty, so that the first vertex gains index 0.

Now it is time to create the six squares based on the vertecies.
Each is build from two triangles (since triangles are the smalles unit when it comes to computergraphics) and contains four vertecies.
To build a quad we need to tell PADrend which vertecies should result in a quad, based on the vertecies indeces.
 The _MeshBuilder_ offers four method for this purpose.
 
