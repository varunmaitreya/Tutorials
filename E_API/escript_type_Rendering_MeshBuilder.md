---
api_location: "API/E_Rendering/MeshUtils/E_PlatonicSolids.cpp:27:7"
api_type: type
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "Rendering:escript_namespace_Rendering"
category: "Rendering"
keywords: addTetrahedron, addCube, addOctahedron, addDodecahedron, addIcosahedron, addBox, addDome, addSphere, addDiscSector, addRingSector, addCone, addConicalFrustum, addArrow, addRectangle, addGrid, addHexGrid, addVoxelMesh, addTorus, addMeshFromBitmaps, createArrow, createCone, createConicalFrustum, createDiscSector, createDome, createRectangle, createRingSector, createSphere, createBox, createMeshFromBitmaps, createHexGrid, createVoxelMesh, createTorus, _constructor, addIndex, addQuad, addTriangle, addVertex, addMesh, buildMesh, getNextIndex, getTransformation, isEmpty, position, position2D, position4D, normal, color, texCoord0, value, values, valueUInt, valuesUInt, setTransformation
layout: e_api
permalink: escript_type_Rendering_MeshBuilder
show_in_toc: true
sidebar: e_api_sidebar
title: "MeshBuilder"
toc: false
---

## Functions

|
| ------: | ----------------- |
| **[addTetrahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1a72dfdd60b4e0f5db60d4063f59f18d87)**() | [ESMF] thisEObj Rendering.MeshBuilder.addTetrahedron() |
| **[addCube](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1acab6e71e2857cb9069f58e8fcdfdf6bd)**() | [ESMF] thisEObj Rendering.MeshBuilder.addCube() |
| **[addOctahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1ad5e74dd38b07d070cb4344efb8128341)**() | [ESMF] thisEObj Rendering.MeshBuilder.addOctahedron() |
| **[addDodecahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1aa988a16a40793e4a57b247682d1536b2)**() | [ESMF] thisEObj Rendering.MeshBuilder.addDodecahedron() |
| **[addIcosahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1a952d9cbf4636e1f8ef1741da4da158f1)**() | [ESMF] thisEObj Rendering.MeshBuilder.addIcosahedron() |
| **[addBox](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a2183404b9b165fe88049c25436357893)**(p0) | [ESMF] thisEObj Rendering.MeshBuilder.addBox(Box) |
| **[addDome](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1acebb186693c4bc52c27255eae776697a)**([p0 [, p1 [, p2 [, p3 [, p4]]]]]) | [ESMF] thisEObj Rendering.MeshBuilder.addDome(radius=100, int horiRes = 40, int vertRes = 40, double halfSphereFraction = 1.0, double imagePercentage = 1.0) |
| **[addSphere](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a917791c7db3b90fe0d0b91db7c0d67b8)**(p0, p1, p2) | [ESMF] thisEObj Rendering.MeshBuilder.addSphere(Sphere, inclinationSegments, azimuthSegments) |
| **[addDiscSector](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1ab152ac69a2ccdc484b7956f237b69909)**(p0, p1 [, p2]) | [ESMF] thisEObj Rendering.MeshBuilder.addDiscSector(float radius, uint8_t numSegments, float angle) |
| **[addRingSector](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a1dec235ccb060799919c257d3330d576)**(p0, p1, p2 [, p3]) | [ESMF] thisEObj Rendering.MeshBuilder.addRingSector(float innerRadius, float outerRadius, uint8_t numSegments, float angle) |
| **[addCone](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1ab6dcff2f904619df4fa969c0beab41c7)**(p0, p1, p2) | [ESMF] thisEObj Rendering.MeshBuilder.addCone(float radius, float height, uint8_t numSegments) |
| **[addConicalFrustum](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1af9f15408c4eeafc34316cfeb52684f7c)**(p0, p1, p2, p3) | [ESMF] thisEObj Rendering.MeshBuilder.addConicalFrustum(float radiusBottom, float radiusTop, float height, uint8_t numSegments) |
| **[addArrow](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1ae8ca2735dd9c6300781ff429eb2364d3)**(p0, p1) | [ESMF] thisEObj Rendering.MeshBuilder.addArrow(float radius, float length) |
| **[addRectangle](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a892c342c01b71b7e44909bf58e6198c8)**(p0 [, p1]) | [ESMF] thisEObj Rendering.MeshBuilder.addRectangle(Rect \| [width,height]) |
| **[addGrid](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a9e261ae7b8df264a744afdf7bc4776cd)**(p0, p1, p2, p3) | [ESMF] thisEObj Rendering.MeshBuilder.addGrid(float width, float height, uint32_t rows, uint32_t columns) |
| **[addHexGrid](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a1a47780cdc562f708890d4c2ef481c25)**(p0, p1, p2, p3) | [ESMF] thisEObj Rendering.MeshBuilder.addHexGrid(float width, float height, uint32_t rows, uint32_t columns) |
| **[addVoxelMesh](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a3df2ec6de94e282247d1d1b1d4a57f0a)**(p0, p1) | [ESMF] thisEObj Rendering.MeshBuilder.addVoxelMesh(Util.PixelAccessor voxelBitmap, Number depth) |
| **[addTorus](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1af356cac848a1a3e0182f42a87fbc0192)**(p0, p1, p2, p3) | [ESMF] thisEObj Rendering.MeshBuilder.addTorus(float innerRadius, float outerRadius, uint32_t majorSegments, uint32_t minorSegments) |
| **[addMeshFromBitmaps](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a2b78d18d8f0c4963745863e23e80acaf)**(p0 [, p1 [, p2]]) | [ESMF] thisEObj Rendering.MeshBuilder.addMeshFromBitmaps(Util.PixelAccessor depth, [Util.PixelAccessor color, [Util.PixelAccessor normal]]) |
| **[createArrow](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1aa3020488eceff11055993bf8e1b27510)**(p0, p1) | [ESF] (static) Mesh Rendering.MeshBuilder.createArrow(Number radius, Number length) |
| **[createCone](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a496895c2d0d3402907d8910ee9924abc)**(p0, p1, p2) | [ESF] (static) Mesh Rendering.MeshBuilder.createCone(Number radius, Number height, Number segments) |
| **[createConicalFrustum](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1ae8750d101a922490ffa05cbcb8181ce7)**(p0, p1, p2, p3) | [ESF] (static) Mesh Rendering.MeshBuilder.createConicalFrustum(Number radiusBottom, Number radiusTop, Number height, Number segments) |
| **[createDiscSector](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a2190f6a4c599e7b68ead39f7f50db9de)**(p0, p1 [, p2]) | [ESF] (static) Mesh Rendering.MeshBuilder.createDiscSector(Number radius, Number segments, Number angle) |
| **[createDome](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a3c69b26f84cd89f1f26fdecb05ea1b1f)**([p0 [, p1 [, p2 [, p3 [, p4]]]]]) | [ESF] (static) Mesh Rendering.MeshBuilder.createDome(radius=100,<br/>					int horiRes = 40, int vertRes = 40,<br/>					double halfSphereFraction = 1.0,<br/>					double imagePercentage = 1.0) \*/ |
| **[createRectangle](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a632e8d7324e66dd5748970cf301d472b)**(p0, p1 [, p2]) | [ESF] (static) Mesh Rendering.MeshBuilder.createRectangle([VertexDescription],width,height) |
| **[createRingSector](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a4236043ba69e1c8886a958d280822c83)**(p0, p1, p2 [, p3]) | [ESF] (static) Mesh Rendering.MeshBuilder.createRingSector(Number innerRadius, Number outerRadius, Number segments, Number angle) |
| **[createSphere](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1abf8ba4b5d37af9bcf3d4028fc47fa2ef)**(p0, p1) | [ESF] (static) Mesh Rendering.MeshBuilder.createSphere(Number, Number) |
| **[createBox](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1ad4644d03c850539349a795d45d3070ff)**(p0) | [ESF] (static) Mesh Rendering.MeshBuilder.createBox(Box) |
| **[createMeshFromBitmaps](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a1a91e48d111deb7adcce7bfb70d1d94e)**(p0 [, p1 [, p2]]) | [ESMF] new Rendering.MeshBuilder.createMeshFromBitmaps(Util.Bitmap depth[, Util.Bitmap color[, Util.Bitmap normals]]) |
| **[createHexGrid](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1ab47d9acae7640fa3f4ec124c8ec96873)**(p0, p1, p2, p3, p4) | [ESF] (static) Mesh Rendering.MeshBuilder.createHexGrid(VertexDescription, Number width, Number height, Number rows, Number columns) |
| **[createVoxelMesh](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1acfecba6aa1fb288c05749f75f6a2145d)**(p0, p1, p2) | [ESF] (static) Mesh Rendering.MeshBuilder.createVoxelMesh(VertexDescription, Util.PixelAccessor voxelBitmap, Number depth) |
| **[createTorus](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a37f08a0fd4e321202e65af04606bf9cb)**(p0, p1, p2, p3) | [ESF] (static) Mesh Rendering.MeshBuilder.createTorus(Number, Number, Number, Number) |
| **_constructor**([p0]) | [ESMF] new Rendering.MeshBuilder( [VertexDescription] ) |
| **[addIndex](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a3547fe69e0085b944fe77339e76d8934)**(p0) | [ESMF] thisEObj MeshBuilder.addIndex( idx ) |
| **[addQuad](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a85a5af54ec460011d2a97d9a2a36ac94)**(p0, p1, p2, p3) | [ESMF] thisEObj MeshBuilder.addQuad( idx,idx,idx,idx ) |
| **[addTriangle](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a77b906c2fd9f8396367027ddfcedba51)**(p0, p1, p2) | [ESMF] thisEObj MeshBuilder.addSphere( Sphere,inclinationSegments,azimuthSegments )<br/>[ESMF] thisEObj MeshBuilder.addBox( Box )<br/>[ESMF] thisEObj MeshBuilder.addTriangle( idx,idx,idx ) |
| **[addVertex](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1ae9259a147be7f6da7e4772a8649bd062)**([p0 [, p1 [, p2 [, p3 [, p4 [, p5 [, p6 [, p7]]]]]]]]) | [ESMF] Number MeshBuilder.addVertex( [Vec3f pos ,Vec3 normal, float r, g, b, a, float u, v ) |
| **[addMesh](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1af42f605eb46982c46d92a059fca7549e)**(p0) | [ESMF] thisEObj MeshBuilder.addMesh( Mesh ) |
| **[buildMesh](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a4fd60a434bb3704a77556988fdfd9fbf)**() | [ESMF] E_Mesh MeshBuilder.buildMesh() |
| **[getNextIndex](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1abd0161490502206b3fb09df456dac005)**() | int MeshBuilder.getNextIndex() |
| **[getTransformation](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a6e96bc0ba4371c87952d6c8f60150945)**() | Matrix4x4 MeshBuilder.getTransformation() |
| **[isEmpty](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1ac03061c34c5ac0775cdd5d01b46e1ced)**() | bool MeshBuilder.isEmpty() |
| **[position](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1af65d5eda5d70609d28fa3db5f41b556c)**(p0 [, p1]) | [ESMF] thisEObj MeshBuilder.position( Vec3, [String attribute] ) |
| **position2D**(p0 [, p1]) | [ESMF] thisEObj MeshBuilder.position2D(Vec2, [String attribute]) |
| **position4D**(p0 [, p1]) | [ESMF] thisEObj MeshBuilder.position4D(Vec4, [String attribute]) |
| **[normal](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a6bb66a5527bb703440e6786f415f2b3f)**(p0 [, p1]) | [ESMF] thisEObj MeshBuilder.normal( Vec3, [String attribute] ) |
| **[color](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1ad338e7e63af1c21f190e0ddd270fd596)**(p0 [, p1]) | [ESMF] thisEObj MeshBuilder.color( Color4f \| Color4ub, [String attribute] ) |
| **[texCoord0](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1a8a92e09cfaf5d04726cf80746be09c6d)**(p0 [, p1]) | [ESMF] thisEObj MeshBuilder.texCoord0( Vec2, [String attribute] ) |
| **[value](namespaceEScript#namespaceEScript_1ad15f86fc3044adfac5ddfd20e0911628)**(p0, p1) | [ESMF] thisEObj MeshBuilder.value(Number value, String attribute) |
| **values**(p0, p1) | [ESMF] thisEObj MeshBuilder.values(Array values, String attribute) |
| **valueUInt**(p0, p1) | [ESMF] thisEObj MeshBuilder.valueUInt(Number value, String attribute) |
| **valuesUInt**(p0, p1) | [ESMF] thisEObj MeshBuilder.valuesUInt(Array values, String attribute) |
| **[setTransformation](classRendering_1_1MeshUtils_1_1MeshBuilder#classRendering_1_1MeshUtils_1_1MeshBuilder_1ad92513f6b304ab575060b1d2436300a9)**(p0) | [ESMF] thisEObj MeshBuilder.setTransformation( Matrix4x4 \| SRT ) |
{: .nohead .nowrap1 }
