<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Stanislaw Eppinger (eppinger@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# State

This chapter provides an example of how to implement a State in C++ with bindings to EScript and how to use this state in EScript.. This tutorial is the addition to the description of PADrend's States. 

## Implementing a State in C++

In this example we will implement the same state as in the EScript example, i.e. a state which skips rendering if the node, which this state is assigned to, is more than 20 units away from the camera. We call this state `MyState`. We need to inherit from the base class `State` and override the `doEnableState()` method. For didactical purposes we also override the `doDisableState()` method although we don't need to since we don't have to clean anyhting up in our example. The header file which will be added to the `MinSG/Ext/MyState` folder looks like this: 

<!---INCLUDE src=MyState.h, start=12, end=22--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    namespace MinSG {
    
        class MyState : public State {
          PROVIDES_TYPE_NAME(MyState)
        public:
          State::stateResult_t doEnableState(FrameContext & context, Node * node, const RenderParam & rp) override;
          void doDisableState(FrameContext & context,Node *, const RenderParam & rp) override;
          MyState * clone() const override;
        };
    
    }
<!---END_CODESECTION--->

In the same folder we'll add the source file, which implements our overridden methods and the actual logic:

<!---INCLUDE src=MyState.cpp, start=14, end=28--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    State::stateResult_t MyState::doEnableState(FrameContext & context, Node * node, const RenderParam & rp){
      auto camPos = context.getCamera()->getWorldOrigin();
      auto nodePos = node->getWorldPosition();
      auto diff = (camPos - nodePos).length();
      if (diff > 20) return State::stateResult_t::STATE_SKIP_RENDERING;
      return State::stateResult_t::STATE_OK;
    }
    
    void MyState::doDisableState(FrameContext & context, Node * node, const RenderParam & rp) {
      //Clean up everything you have done in doEnableState, e.g. popping shaders from the rendering context
    }
    
    MyState * MyState::clone() const {
      return new MyState(*this);
    }
<!---END_CODESECTION--->

The logic of the `doEnableState()` is the same as in the EScript version. We compute the distance between the camera and the node and if it's higher than 20 we return `STATE_SKIP_RENDERING` and the node will not be rendered. Otherwise `STATE_OK` will be returned and the node will be rendered.  
The next step is to provide the EScript bindings in order to use our state in EScript.

### Providing the EScript Bindings

To be able to use our state in EScript we need to provide the bindings. We will not cover all the details, if you want to know more you should take a look at the SimpleExample in the C++ DevGuide.  
First we will add the `E_MyState` header to the `E_MinSG/Ext/MyState` folder which looks like this: 

<!---INCLUDE src=E_MyState.h, start=23, end=42--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    class E_MyState : public E_State {
            ES_PROVIDES_TYPE_NAME(MyState)
        public:
            template<class, class, class> friend class Util::PolymorphicWrapperCreator;
    
            static EScript::Type* getTypeObject();
            static void init(EScript::Namespace & lib);
    
            virtual ~E_MyState();
    
            const MinSG::MyState * operator*()const	{	return static_cast<const MinSG::MyState*>(ref().get());	}
            MinSG::MyState * operator*()	{	return static_cast<MinSG::MyState*>(ref().get());	}
    
        protected:
            E_MyState(MinSG::MyState * obj, EScript::Type * type=nullptr);
    };
    
    }
    
    ES_CONV_EOBJ_TO_OBJ(E_MinSG::E_MyState, MinSG::MyState*, **eObj)
<!---END_CODESECTION--->

Note the two Macros `ES_PROVIDES_TYPE_NAME(MyState)` and `ES_CONV_EOBJ_TO_OBJ(...)` which need to be used in order to provide the name of the class and the conversion.  
Now we need to add the source file to the same folder and implement the `init()` method which provides the name and methods of our class to EScript:

<!---INCLUDE src=E_MyState.cpp, start=32, end=41--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    void E_MyState::init(EScript::Namespace & lib) {
      // E_MyState ---|> E_State ---|> Object
      EScript::Type * typeObject = E_MyState::getTypeObject();
      declareConstant(&lib,getClassName(),typeObject);
      
      //! [ESMF] new MinSG.MyState()
      ES_CTOR(typeObject,0,0,EScript::create(new MinSG::MyState))
    
      addFactory<MinSG::MyState,E_MyState>();
    }
<!---END_CODESECTION--->

For further information about providing the EScript binding process you should read the SimpleExample tutorial in the C++ DevGuide. It seems very complicated at first but what you basically do is copying and working example and replace the name of the class with your class name.

### Using the state

Now we can go ahead and instantiate our state in EScript:

```
var ourState = new MinSG.MyState();
```

This state can be handled as every other state and e.g. be added to a particular node.
