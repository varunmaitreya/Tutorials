/*
 * This file is part of the open source part of the
 * Platform for Algorithm Development and Rendering (PADrend).
 * Web page: http://www.padrend.de/
 * Copyright (C) 2016 Henrik Heine <hheine@mail.uni-paderborn.de>
 * 
 * PADrend consists of an open source part and a proprietary part.
 * The open source part of PADrend is subject to the terms of the Mozilla
 * Public License, v. 2.0. You should have received a copy of the MPL along
 * with this library; see the file LICENSE. If not, you can obtain one at
 * http://mozilla.org/MPL/2.0/.
 */

#include "E_MyExtension.h"
#include "E_BoundingBox2D.h"

namespace E_MinSG {
namespace E_MyExtension {
/*! Initialize your namespace inside of the MinSG namespace.
 *  This init function must be called from the ELibMinSGExt.cpp file
 */
void init(EScript::Namespace & minsg) {
    // Define the MyExtension namespace as a child of the MinSG namespace
    EScript::Namespace * ns = new EScript::Namespace();
    declareConstant(&minsg, "MyExtension", ns);
	
	// Now you should call the init functions of all wrapper classes:
	// E_MyClass::init(*ns);
	
	// Classes from the simple example:
	E_BoundingBox2D::init(*ns);
}
}
}
