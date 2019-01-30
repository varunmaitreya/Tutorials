---
api_location: "API/E_Rendering/Shader/E_Uniform.cpp:161:18"
api_type: type
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "Rendering:escript_namespace_Rendering"
category: "Rendering"
keywords: _constructor, getName, getType, getNumValues, getData, isNull, BOOL, VEC2B, VEC3B, VEC4B, FLOAT, VEC2F, VEC3F, VEC4F, INT, VEC2I, VEC3I, VEC4I, MATRIX_2X2F, MATRIX_3X3F, MATRIX_4X4F
layout: e_api
permalink: escript_type_Rendering_Uniform
show_in_toc: true
sidebar: e_api_sidebar
title: "Uniform"
toc: false
---

## Attributes

|
| ------: | ----------------- |
| **BOOL** | |
| **VEC2B** | |
| **VEC3B** | |
| **VEC4B** | |
| **FLOAT** | |
| **VEC2F** | |
| **VEC3F** | |
| **VEC4F** | |
| **INT** | |
| **VEC2I** | |
| **VEC3I** | |
| **VEC4I** | |
| **MATRIX_2X2F** | |
| **MATRIX_3X3F** | |
| **MATRIX_4X4F** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **_constructor**(p0 [, p1 [, p2]]) | [ESMF] new Rendering.Uniform( Uniform \| String name, Number type, Array values)<br/>Depending on type, the type of values in the Array may differ:<br/>Uniform::UNIFORM_BOOL:	Bool<br/>Uniform::UNIFORM_VEC2B:	[x,y] (bool)<br/>Uniform::UNIFORM_VEC3B:	[x,y,z] (bool)<br/>Uniform::UNIFORM_VEC4B:	[x,y,z,w] (bool)<br/>Uniform::UNIFORM_FLOAT:	Number (float)<br/>Uniform::UNIFORM_VEC2F:	[x,y], Vec2 (float)<br/>Uniform::UNIFORM_VEC3F:	[x,y,z], Vec3 (float)<br/>Uniform::UNIFORM_VEC4F:	[x,y,z,w], Vec4 (float), Color4f<br/>Uniform::UNIFORM_INT:	Number (int)<br/>Uniform::UNIFORM_VEC2I:	[x,y], Vec2 (int)<br/>Uniform::UNIFORM_VEC3I:	[x,y,z], Vec3 (int)<br/>Uniform::UNIFORM_VEC4I:	[x,y,z,w], Vec4 (int)<br/>Uniform::UNIFORM_MATRIX_2X2F:	[x\*4] (float)<br/>Uniform::UNIFORM_MATRIX_3X3F:	[x\*9] (float), Matrix3x3<br/>Uniform::UNIFORM_MATRIX_4X4F:	[x\*16] (float), Matrix4x4 |
| **[getName](classRendering_1_1Uniform#classRendering_1_1Uniform_1a4bd18ccacc837b268b5106c715117c40)**() | [ESMF] String Uniform.getName() |
| **[getType](classRendering_1_1Uniform#classRendering_1_1Uniform_1a13acd54b6d43fc371ea7abfc0651da4b)**() | [ESMF] Number Uniform.getType() |
| **[getNumValues](classRendering_1_1Uniform#classRendering_1_1Uniform_1a08383279a4cc6918ee69343d6f3cf19a)**() | [ESMF] Number Uniform.getNumValues() |
| **getData**() | [ESMF] Array Uniform.getData() |
| **[isNull](classRendering_1_1Uniform#classRendering_1_1Uniform_1acf7c196c7d82053688e52d131a654545)**() | [ESMF] Bool Uniform.isNull() |
{: .nohead .nowrap1 }
