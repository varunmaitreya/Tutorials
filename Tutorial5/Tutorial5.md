<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
------------------------------------------------------------------------------------------------->

<--TODO maybe the selection store mechanism can be used somewhere in the tutorial-->

# Goal of this tutorial
This is a further tutorial on functional objects.
We want to animate a part of a diggers arm containing of a joint and a hydraulic cylinder.
In detail we want to work with animated rotations and pointing joints.  

# Assumptions
All previouse tutorial are finished.
PADrend is opened and the scene TODO is loaded.
Infinite ground and dynamic sky are enabled.
The _ObjectFactories_ plugin is activated.

# Adding rotation to the main joint
We start this tutorial by animating the rotation of the arm around the main joints axis.
Open the object placer and drag out a transformation proxy.
Place it somewhere on the ground not too far away from the arm.

<!--TODO Screenshot of this -->

Next up we need to align the transformation proxy with the main joints axis.
Give it some name like TODO
Thankfully PADrend provides us with a functionality that can do the job.
To use this functionality it is very important to select the node that should be aligned and the node that is used for the alignment in the correct order.
Select first the node that should be aligned.
In our case this is the transformation proxy.
Afterwards select the second node.
We want to align the transformation proxy to the main joints axis.
Select the axis while holding down [shift] key, so that both are selected.
Right click to open the context menu.
Select _Node Tools_ and than _Alignment_.
You will find some menu points and a combobox.
You can use the combobox to choose an alignment position within the second node.
Make sure that _BB center_ is selected.

<!--TODO Screenshot min one-->

Click on common position and the transformation proxy will be aligned to the joint axis.  
Next up create a link between the transformation proxy and the node TODO.
Use _transformSnapOffset_ as role name.
Test if the rotation works correctly by rotating the transformation proxy.

# Animating the hydraulic cylinder
For the animation of the hydraulic cylinder we use the _Animation/PointingJoint_ object trait.
The trait can be used to align a node between two anchor points.
One of the anchor points is the mount anchor point.
The nodes top will snap to it.
The second anchor point is the target anchor point.
The nodes bottom will align to it.
When one of the anchor points gets moved by some transformation the node will also move to keep its alignment to the two anchor points.  

## Creating the anchors
First we need to create the anchor points.
Select the anchor tool from the toolbar.
Select the node named TODO.
Open the context menu by a right click.
Select _New Anchor_, name it _lowerMountPoint_ and click _Create_.
Next up the anchor needs a position.
Open the context menu again and locate _[lowerMountPoint]_.
Search for _Positon (relative to bb)_ to position it relative to the nodes bounding box.
Type in [TODO] and press return.
<!--TODO Copy the Anchor to the transformed node-->
In the same manner create an anchor for the upper arm.
Name it _upperMountPoint_ and position it at TODO relative to the bounding box.

## Creating the pointing joint animation
To ensure the animation to work correct, we use transformation proxies to build up the pointing joint animation and connect the cylinder to them later on.
Drag out two transformation proxies and name one _upperMount_ and the other one _lowerMount_.
 
