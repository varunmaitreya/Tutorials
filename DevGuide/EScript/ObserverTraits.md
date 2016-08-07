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
