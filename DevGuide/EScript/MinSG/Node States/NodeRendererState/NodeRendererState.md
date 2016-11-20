<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Stanislaw Eppinger (eppinger@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# NodeRendererState
The NodeRendererState is similar to a normal state. The difference is that this state needs to overload the `displayNode()` instead of the `doEnableState()` and that it calls the `displayNode()`method on all children of a node. The NodeRendererState acts as a renderer who handles the rendering of all the children. When registered at a node its `displayNode()` method will be called instead of the node's `display()` method. That way the state is able to provide its own rendering method for every node of the subtree.


## Rendering Channels
The NodeRendererState can be assigned to different rendering channels. What are rendering channels? The rendering of a node can happen in different channels. By default a node is assigned to the *default channel*, but it can also be assigned to the *approximation channel*. Then a node will only be rendered by the corresponding renderer. All nodes in the default channel will only be rendered by a renderer responsible for the default channel. The same goes for the approximation channel. 

## Simple Example
In this example we will create two cubes and attach our own NodeRendererState which let's them flicker.  
First of all we create the cubes and displace one.

<!---INCLUDE src=NodeRendererState.escript, start=15, end=16--->

Now we create our own NodeRendererState and overload the `displayNode` method.

<!---INCLUDE src=NodeRendererState.escript, start=20, end=32--->

The method has two parameters: `(Node owner, RenderParam params)`. The `node` parameter is the node on which the method is called and `param` contains further information about the rendering, e.g. the current rendering channel in which this node is in.  
Our `displayNode()` method creates a random number between 0 and 10. If it's higher than 5 than we return `MinSG.FrameContext.PASS_ON` which means that we pass the further rendering of the node to the node itself, i.e. the node calls its `display()` method afterwards. If it's lower or equal than 5 then we return `MinSG.FrameContext.NODE_HANDLED` which means that the rendering of the node has been handled and the `display()` method of the node will not be called afterwards.  
Note that we also could have called `node.display(frameContext)` instead of returning `MinSG.FrameContext.PASS_ON`.

At the end of the example we are creating the list node and adding our cubes and NoderRendererState to it. 

<!---INCLUDE src=NodeRendererState.escript, start=35, end=41--->

The resulting effect is that the cubes will start flickering. Note that both cubes are flickering because our renderer traverses the whole subtree of the list node and calls our overloaded `displayNode()` on every descendent node.

We could also assign our renderer to the approximation channel. To do that we create the renderer in the following way: 

```
    var flickerRenderer = new MyRendererState(MinSG.FrameContext.APPROXIMATION_CHANNEL);
```

Now our renderer will only consider nodes which are in this rendering channel. Try it out and you will see that the cubes are not flickering anymore because they are assigned to the default channel by default.


