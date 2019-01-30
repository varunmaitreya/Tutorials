---
api_location: "API/E_Geometry/E_Quaternion.cpp:29:18"
api_type: type
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "Geometry:escript_namespace_Geometry"
category: "Geometry"
keywords: _constructor, makeRotate, inverse, conjugate, dot, toArray, toMatrix, lerp, slerp, matrixToQuaternion, length, normalize, getX, getY, getZ, getW, setX, setY, setZ, setW, toEuler, eulerToQuaternion
layout: e_api
permalink: escript_type_Geometry_Quaternion
show_in_toc: true
sidebar: e_api_sidebar
title: "Quaternion"
toc: false
---

## Functions

|
| ------: | ----------------- |
| **_constructor**([p0 [, p1 [, p2 [, p3]]]]) | [ESMF] Quaternion new Quaternion([ x,y,z,w \| Quaternion \| Mat3x3\|  Array(x,y,z,w) ]) |
| **makeRotate**(p0, p1 [, p2 [, p3]]) | [ESMF] self E_Quaternion.makeRotate(deg, (Vec3 axis \| x,y,z) ) |
| *****(p0) | [ESMF] E_Quaternion E_Quaternion.\*(number) |
| **/**(p0) | [ESMF] E_Quaternion E_Quaternion./(number) |
| ***=**(p0) | [ESMF] E_Quaternion E_Quaternion.\*=(Number) |
| **/=**(p0) | [ESMF] E_Quaternion E_Quaternion./=(Number) |
| **[inverse](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1a9a0c6f291c667f35156fe85ecb8d2157)**() | [ESMF] E_Quaternion E_Quaternion.inverse() |
| **[conjugate](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1aceb28d990107c3ac41a2359819cc270c)**() | [ESMF] E_Quaternion E_Quaternion.conjugate() |
| **[dot](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1af3133d323632336c6604f5e1a1603e0a)**(p0) | [ESMF] Number E_Quaternion.dot(Quaternion) |
| **toArray**() | [ESMF] Array E_Quaternion.toArray() |
| **[toMatrix](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1af8fd8afaa57e5a63c01543506b04ad56)**() | [ESMF] E_Matrix3x3 E_Quaternion.toMatrix() |
| **[lerp](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1aceb932c23f3d4beece0f92132e27d894)**(p0, p1, p2) | [ESF] (static) E_Quaternion lerp(Quaternion, Quaternion, float) |
| **[slerp](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1a130e4643285d70bea19031bd8b27a57c)**(p0, p1, p2) | [ESF] (static) E_Quaternion slerp(Quaternion, Quaternion, float) |
| **[matrixToQuaternion](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1a62e77a609deea077fbdacf116a0224c3)**(p0) | [ESF] (static) E_Quaternion matrixToQuaternion(Matrix3x3) |
| **[length](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1a0d728c188b01601fcabdff7b981e38b3)**() | [ESMF] number E_Quaternion.length() |
| **[normalize](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1a4a33b0303ac6afc54fcba293e866243e)**() | [ESMF] self E_Quaternion.normalize() |
| **getX**() | [ESMF] number E_Quaternion.getX() |
| **getY**() | [ESMF] number E_Quaternion.getY() |
| **getZ**() | [ESMF] number E_Quaternion.getZ() |
| **getW**() | [ESMF] number E_Quaternion.getW() |
| **setX**(p0) | [ESMF] self E_Quaternion.setX(Number) |
| **setY**(p0) | [ESMF] self E_Quaternion.setY(Number) |
| **setZ**(p0) | [ESMF] self E_Quaternion.setZ(Number) |
| **setW**(p0) | [ESMF] self E_Quaternion.setW(Number) |
| **[toEuler](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1ada2afd75aa55c69a13e48db96a72c3ce)**() | [ESMF] E_Vec3 E_Quaternion.toEuler() |
| **[eulerToQuaternion](classGeometry_1_1Quaternion#classGeometry_1_1Quaternion_1a46f6327db32eadc1f0971c2413ff92d8)**(p0) | [ESF] (static) E_Quaternion eulerToQuaternion(Vec3) |
{: .nohead .nowrap1 }
