#Goal of this tutorial
In this tutorial you will learn how to manipulate scenes.

#Preparation
So lets start.
Load scene _szene1.minsg_.
Activate the toolbar by pressing <!--TODO which key is needed?-->
#PADrend menu overview

#Node selection
In PADrend parts of the geometry (e.g. a single tree) are seen to be nodes within a hierarchical scene-graph. 
Nodes can be manipulated in different ways (e.g moving them or resizing them).
Before you can manipulate a node you need first to select it.
There are a few selection techniques which will be explained in this part.
The simplest way how you can select a single node is to press and hold the control key (ctrl) and click on the node you want to select.
The node will get a white transparent bounding box around showing you that it is now selected.
Also a black description field will appear above the node.
It provides you with information about the node.
In our case you should see the instance of the node, the node type (here GeometryNode) and the number of triangles it consists of.
If you want to select more than one node hold also down the shift key and click on another node.
To deselect perform a right click on the scene and choose _Unselect all_ from the context menu. 

Another way of selecting nodes via mouse is by using the selection tool.
You can find the selection tool in the toolbar.
With help of the tool you can select nodes by pulling a rectangle with the mouse, similar as if you would select files in your filebrowser.
You can choose between two settings.
In the first one a node is only selected if it is fully within the rectangle.
The second one also selects nodes that only intersect the rectangle.
Activate one of the settings and try to select some nodes.
If you want to select some nodes in addition hold down shift and select them.
For deselecting some nodes hold down _alt_ and use the rectangle to determine which to deselect.  

You can also use the context menu to select nodes.
Open it by a right click on the scene.
Open _Select Node_ and choose either the root node or a child from the children list.
With the children list you can traverse the scene-graph node by node.

#Scene manipulation
Now you know how to select a node.
Lets start to manipulate the scene a bit.
You can perform the following tools either on a single node or a group of nodes.
Select some node (e.g. the pig).

##Moving nodes (translation)
To move the node around select the move tool.
You are faced with a three dimensional coordinate cross which appears at the center of the node.
Click on one of its axis and move the mouse in order to move the node.
As soon as you start moving the mouse another black description field will appear.
It tells you about how many units you translate have translated the node along each axis.
The value is alway related to the last position of the node.
If you want to move in two directions at a time you can use the the quarter circles between the axis.

##Rotating nodes
Select the rotation tool.
You can find it right beside the move tool.
Again a coordinate cross appears but this time it has some rings around it.
The rings are the three rotation axis.
The center of the coordinate cross defines the center of rotation.
By default it is set to the middle of the node so that the node rotates around its center.
Now its up to you.
Try some rotations and differ the center to get a feeling for it.

##Scaling nodes
If you want to change the size of your node you can do it with help of the scaling tool.
Select it and you will see some cones around the currently selected node. 
The cones show the direction of the scaling.
When you for example choose the cone on the top of the node it will change its size to the top and also to the sides but its bottom stays where it is.
Select a cone and move it with the mouse.
If you move the cone away from the node it will get bigger, if you move it towards the node it will get smaller.

##Deleting nodes from a scene
To delete a node from the scene simply press [del].
This operation can not be undone by [ctrl] + [z].

##Adding nodes from presets
You can also add nodes to the scene.
Lets try to add a new cube to the scene.
Open the scene editor and go to the object placer tab.
In the tree view expand the _BuiltIn_ item.
You can add a new cube via drag and drop.
Click on _Cube_ and hold down the left mouse button.
Drag to the position on the ground where you want to place the cube and release the mouse button.
You can manipulate the newly created cube in the ways described above.


