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
The node will get a white transparent bounding box around it.
In this way you can see that it is now selected.
If you want to select more than one node hold also down the shift key and click on another node.
To unselect perform a rightclick on the scene and choose _Unselect all_ from the context menu. 
<!-- TODO ctrl alt to deselect--> 

Another way of selecting nodes via mouse is by using the selection tool.
You can find the selection tool in the toolbar.
With help of the tool you can select nodes by pulling a rectangle with the mouse, similar as if you would select files in your filebrowser.
You can choose between two settings.
In the first one a node is only selected if it is fully within the rectangle.
The second one also selects nodes that only intersect the rectangle.
Activate one of the settings and try to select some nodes.
If you want to select some nodes in addition hold down shift and select them.
For unselecting some nodes hold down _alt_ and use the rectangle to determine which to unselect.  

You can also use the context menu to select nodes.
Open it by a rightclick on the scene.
Open _Select Node_ and choose either the root node or a child from the children list.
With the children list you can traverse the scene-graph node by node.


