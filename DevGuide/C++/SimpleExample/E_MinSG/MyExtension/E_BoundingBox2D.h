// As for all header files, we should prevent multiple includes:
#ifndef E_MY_EXTENSION_BOUNDINGBOX2D_H_
#define E_MY_EXTENSION_BOUNDINGBOX2D_H_

// Include some useful EScript stuff
#include <EScript/EScript.h>
#include <EScript/Objects/ReferenceObject.h>

// include your real class
#include <MinSG/Ext/MyExtension/BoundingBox2D.h>

// Typically the same namespace as your real class, but always pre concatenated with "E_"
namespace E_MinSG {
namespace E_MyExtension {
/*! A binding class must inherit from EScript::ReferenceObject<T> where T is your actual class. 
 * If your class gets more complex, it might be better to use EScript::ReferenceObject<Util::Reference<BoundingBox2D>> (more on that in the bigger example)
 */
class E_BoundingBox2D : public EScript::ReferenceObject<MinSG::MyExtension::BoundingBox2D> {
    //! The human readable name of this type
	ES_PROVIDES_TYPE_NAME(BoundingBox2D)
public:
    //! returns the Type object for this type
    static EScript::Type * getTypeObject();
    //! this function is used to initialize this type, should be called from the ELibMinSGExt.cpp file
    static void init(EScript::Namespace & lib);
    
    //! most simple constructor, just forward all arguments. This will initialize an instance of your class with that parameters.
    template<typename...args> explicit E_BoundingBox2D(args&&... params) : ReferenceObject_t(E_BoundingBox2D::getTypeObject(),std::forward<args>(params)...) {}
    //! destructor
    virtual ~E_BoundingBox2D() {}
};
}
}

//! All conversions must be in the public namespace!
//! Convert an EScript object to the real object, typically you just dereference it.
ES_CONV_EOBJ_TO_OBJ(E_MinSG::E_MyExtension::E_BoundingBox2D, MinSG::MyExtension::BoundingBox2D&, **eObj)
ES_CONV_EOBJ_TO_OBJ(E_MinSG::E_MyExtension::E_BoundingBox2D, MinSG::MyExtension::BoundingBox2D*, &**eObj)
//! Convert real classes to EScript binding class. typically you just create a new instance.
ES_CONV_OBJ_TO_EOBJ(MinSG::MyExtension::BoundingBox2D&, E_MinSG::E_MyExtension::E_BoundingBox2D, new E_MinSG::E_MyExtension::E_BoundingBox2D(obj))
ES_CONV_OBJ_TO_EOBJ(MinSG::MyExtension::BoundingBox2D*, E_MinSG::E_MyExtension::E_BoundingBox2D, new E_MinSG::E_MyExtension::E_BoundingBox2D(obj))

#endif
