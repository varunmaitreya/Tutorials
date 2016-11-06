<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# ScriptedState
ScriptedState are states that are written in EScript and can be added to any MinSG Node. Each `ScriptedState` consists of two functions: `doEnableState` and `doDisableState`

When a node is rendered, all its states are activated and therefore the `doEnableState` function is called. In this function you do calculations and you could also modify the node a bit, before it gets finally rendered. For example you could change the mesh of the node. Depending on the return value the rendering could be skipped completely. After rendering, the `onDisableState` function is called and your state should cleanup whatever it has done in the enable function.
Both methods have two parameters: `(Node owner, RenderParam params)`

The `node` parameter of course is the node for which this state is en-/disabled. The second parameter contains some information about the rendering itself. For example, flags and the rendering layers.

The following retun values are allowed for `doEnableState`:
* `MinSG.STATE_OK`: The state was enabled normally and it will be disabled after rendering
* `MinSG.STATE_SKIPPED`: The state is not enabled (e.g. because of an error) and therefore `doDisableState` will not be called
* `MinSG.STATE_SKIP_OTHER_STATES`: The state was enabled, but no further states of this node should be enabled. `doDisableState` will be called for this node
* `MinSG.STATE_SKIP_RENDERING`: Rendering of the node should be skipped (e.g. if the rendering has been handled by this state because it is a renderer). After the call, the state is not active for that node, so `disableState` must not be called for that node.

## Implementing a ScriptedState
Typically you implement such a state by creating a new type that inherits from it. Furthermore you then override the two functions. If possible you should implement it 'stateless', which means that your `ScriptedState` should not have own instance variables that are modified by the methods. You should prevent this, because it might lead to problems if someone (accidentally) adds the same instance to different nodes.

```
var MyState = new Type(MinSG.ScriptedState);
MyState.doEnableState @(override) ::= fn(node, rp) {
  // ...
  return MinSG.STATE_OK;
};
MyState.doDisableState @(override) ::= fn(node, rp) {
  // ...
};
```

## Simple Example
The following example simply skips rendering if the node is more than 20 units away from the camera. This is done by just calculating the difference between the given node and the camera node. If this distance is more than 20, the function returns `STATE_SKIP_RENDERING`, otherwise it just returns `STATE_OK` and everything continues as normal.

<!---INCLUDE src=ScriptedState.escript, start=14, end=35--->

