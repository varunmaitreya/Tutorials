<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->
<!---BEGINN_INDEXSECTION--->
<!---Automaticly generated section. Do not edit!!!--->
# Overview
* 3.5 MinSG: Minimalist Scene Graph
    * 3.5.1 [What is a scene graph](../../3_Development_Guide/5_MinSG:_Minimalist_Scene_Graph/1_What_is_a_scene_graph.md)
    * 3.5.2 [Creating a Scene using MinSG](../../3_Development_Guide/5_MinSG:_Minimalist_Scene_Graph/2_Creating_a_Scene_using_MinSG/Creating_a_Scene_using_MinSG.md)
    * 3.5.3 Node States
    * 3.5.4 [Extending MinSG States using C++](../../3_Development_Guide/5_MinSG:_Minimalist_Scene_Graph/4_Extending_MinSG_States_using_C++/Extending_MinSG_States_using_C++.md)
    * 3.5.5 **Using Observer Traits: Listen to Node Changes**
    * 3.5.6 [Using TreeQueries to query MinSG Nodes](../../3_Development_Guide/5_MinSG:_Minimalist_Scene_Graph/6_Using_TreeQueries_to_query_MinSG_Nodes/Using_TreeQueries_to_query_MinSG_Nodes.md)
<!---END_INDEXSECTION--->

# MinSG Observer Traits
The MinSG observer traits can be used to get notified when a node's subtree has changed in some way.
> The node itself is also part of its subtree!

## `MinSG.NodeAddedObserverTrait`
This trait will add a `MultiProcedure` to a node, which is called whenever a new node is added to the node's subtree. The signature of the function is `onNodeAdded(newNode)`.
You can add this trait to a node then manually add functions to the multiprocedure:
```
Traits.addTrait(node, MinSG.NodeAddedObserverTrait);
node.onNodeAdded += fn(newNode) {
  // do something
};
```
Instead of adding the function manually, you could also pass additional functions to the `addTrait` call:
```
Traits.addTrait(node, MinSG.NodeAddedObserverTrait, fn(newNode) {
    outln(newNode, " was added");
  });
```

## `MinSG.NodeRemovedObserverTrait`
This trait will add a `MultiProcedure` called `onNodeRemoved` to the node.
After a node is removed from the node's subtree, `node.onNodeRemoved(parent, removedNode)` is called. Just like a `NodeAddedObserverTrait`, this trait optionally accepts additional functions passed to the `addTrait` call:
```
Traits.addTrait(node, MinSG.NodeRemovedObserverTrait, fn(parent, removedNode) {
    outln(removedNode, " was removed from ", parent);
  });
```

## `MinSG.TransformationObserverTrait`
This trait will add a `MultiProcedure` called `onNodeTransformed` to the node. Whenever a node of the node's subtree is transformed, `node.onNodeTransformed(transformedNode)` is called.
Just like the last two traits, this trait optionally accepts additional functions passed to the `addTrait` call:
```
Traits.addTrait(node, MinSG.TransformationObserverTrait, fn(transformedNode) {
    outln(transformedNode, " was transformed");
  });
```


