<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
         Stanislaw Eppinger (eppinger@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# ScriptedState
This chapter provides an example of a ScriptedState. This tutorial is the addition to the description of PADrend's States. It provides an example of how the states may be implemented in EScript. 

## Implementing a State in EScript

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

The following example simply skips rendering if the node is more than 20 units away from the camera. This is done by just calculating the difference between the given node and the camera node. If this distance is more than 20, the function returns `STATE_SKIP_RENDERING`, otherwise it just returns `STATE_OK` and everything continues as normal.

<!---INCLUDE src=ScriptedState.escript, start=14, end=35--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    var sceneNode = new MinSG.ListNode();
    
    // Define new ScriptedState
    var MyState = new Type(MinSG.ScriptedState);
    MyState.doEnableState @(override) ::= fn(node, rp) {
        var camPos = frameContext.getCamera().getWorldOrigin();
        var nodePos = node.getWorldPosition();
        var diff = (camPos - nodePos).length();
        if(diff > 20) return MinSG.STATE_SKIP_RENDERING;
        return MinSG.STATE_OK;
    };
    
    // create simple cube
    var cube = new MinSG.GeometryNode(Rendering.MeshBuilder.createBox(new Geometry.Box(0,0,0,1,1,1)));
    // add state to cube
    cube += new MyState();
    // add cube to scene
    sceneNode += cube;
    
    // activate scene
    PADrend.registerScene(sceneNode);
    PADrend.selectScene(sceneNode);
<!---END_CODESECTION--->

As you can see implementing a state in EScript is rather easy. For an implementation in C++ you should look at the example provided in the C++ DevGuide.




