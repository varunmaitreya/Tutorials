---
api_location: "API/E_Rendering/ELibRendering.cpp:73:14"
api_type: namespace
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: ""
category: "Rendering"
keywords: setDefaultMeshDataStrategy, getDefaultMeshDataStrategy, getPureLocalStrategy, getDebugStrategy, getStaticDrawReleaseLocalStrategy, getStaticDrawPreserveLocalStrategy, getDynamicVertexStrategy, enableGLErrorChecking, disableGLErrorChecking, checkGLError, getGLTypeString, outputGLInformation, readDepthValue, enableDebugOutput, disableDebugOutput, clusterPoints, drawCoordSys, drawFullScreenRect, drawGrid, drawQuad, drawBox, drawAbsBox, drawRect, drawWireframeBox, drawWireframeRect, drawVector, enable2DMode, disable2DMode, enableInstanceBuffer, disableInstanceBuffer, drawInstances, createTetrahedron, createCube, createOctahedron, createDodecahedron, createIcosahedron, createEdgeSubdivisionSphere, createBox, createDome, createSphere, createDiscSector, createRingSector, createCone, createConicalFrustum, createArrow, createRectangle, createGrid, createHexGrid, createVoxelMesh, createTorus, createMeshFromBitmaps, CULL_BACK, CULL_FRONT, CULL_FRONT_AND_BACK, SHADER_STAGE_VERTEX, SHADER_STAGE_FRAGMENT, SHADER_STAGE_GEOMETRY, SHADER_STAGE_TESS_CONTROL, SHADER_STAGE_TESS_EVALUATION, SHADER_STAGE_COMPUTE, TARGET_ARRAY_BUFFER, TARGET_ATOMIC_COUNTER_BUFFER, TARGET_COPY_READ_BUFFER, TARGET_COPY_WRITE_BUFFER, TARGET_DISPATCH_INDIRECT_BUFFER, TARGET_DRAW_INDIRECT_BUFFER, TARGET_ELEMENT_ARRAY_BUFFER, TARGET_PIXEL_PACK_BUFFER, TARGET_PIXEL_UNPACK_BUFFER, TARGET_QUERY_BUFFER, TARGET_SHADER_STORAGE_BUFFER, TARGET_TEXTURE_BUFFER, TARGET_TRANSFORM_FEEDBACK_BUFFER, TARGET_UNIFORM_BUFFER, USAGE_STREAM_DRAW, USAGE_STREAM_READ, USAGE_STREAM_COPY, USAGE_STATIC_DRAW, USAGE_STATIC_READ, USAGE_STATIC_COPY, USAGE_DYNAMIC_DRAW, USAGE_DYNAMIC_READ, USAGE_DYNAMIC_COPY
layout: e_api
order: 0
permalink: escript_namespace_Rendering
show_in_toc: true
sidebar: e_api_sidebar
title: "Rendering"
toc: false
---

## Namespaces

|
| ------- | ----------------- |
| namespace | [Comparison](escript_namespace_Rendering_Comparison) |
| namespace | [BlendFunc](escript_namespace_Rendering_BlendFunc) |
| namespace | [BlendEquation](escript_namespace_Rendering_BlendEquation) |
| namespace | [TexUnitUsageParameter](escript_namespace_Rendering_TexUnitUsageParameter) |
| namespace | [VertexAttributeIds](escript_namespace_Rendering_VertexAttributeIds) |
{: .nohead }

## Types

|
| ------- | ----------------- |
| type | [StatisticsQuery](escript_type_Rendering_StatisticsQuery) |
| type | [TextRenderer](escript_type_Rendering_TextRenderer) |
| type | [OcclusionQuery](escript_type_Rendering_OcclusionQuery) |
| type | [AlphaTestParameters](escript_type_Rendering_AlphaTestParameters) |
| type | [BlendingParameters](escript_type_Rendering_BlendingParameters) |
| type | [CullFaceParameters](escript_type_Rendering_CullFaceParameters) |
| type | [ImageBindParameters](escript_type_Rendering_ImageBindParameters) |
| type | [LightingParameters](escript_type_Rendering_LightingParameters) |
| type | [MaterialParameters](escript_type_Rendering_MaterialParameters) |
| type | [PointParameters](escript_type_Rendering_PointParameters) |
| type | [PolygonModeParameters](escript_type_Rendering_PolygonModeParameters) |
| type | [ScissorParameters](escript_type_Rendering_ScissorParameters) |
| type | [StencilParameters](escript_type_Rendering_StencilParameters) |
| type | [FBO](escript_type_Rendering_FBO) |
| type | [Texture](escript_type_Rendering_Texture) |
| type | [Shader](escript_type_Rendering_Shader) |
| type | [Uniform](escript_type_Rendering_Uniform) |
| type | [Attribute](escript_type_Rendering_Attribute) |
| type | [Mesh](escript_type_Rendering_Mesh) |
| type | [VertexAccessor](escript_type_Rendering_VertexAccessor) |
| type | [VertexDescription](escript_type_Rendering_VertexDescription) |
| type | [VertexAttributeAccessor](escript_type_Rendering_VertexAttributeAccessor) |
| type | [ColorAttributeAccessor](escript_type_Rendering_ColorAttributeAccessor) |
| type | [NormalAttributeAccessor](escript_type_Rendering_NormalAttributeAccessor) |
| type | [PositionAttributeAccessor](escript_type_Rendering_PositionAttributeAccessor) |
| type | [TexCoordAttributeAccessor](escript_type_Rendering_TexCoordAttributeAccessor) |
| type | [FloatAttributeAccessor](escript_type_Rendering_FloatAttributeAccessor) |
| type | [UIntAttributeAccessor](escript_type_Rendering_UIntAttributeAccessor) |
| type | [BufferObject](escript_type_Rendering_BufferObject) |
| type | [RenderingContext](escript_type_Rendering_RenderingContext) |
| type | [ConnectivityAccessor](escript_type_Rendering_ConnectivityAccessor) |
| type | [MeshBuilder](escript_type_Rendering_MeshBuilder) |
| type | [TriangleAccessor](escript_type_Rendering_TriangleAccessor) |
{: .nohead }

## Attributes

|
| ------: | ----------------- |
| **CULL_BACK** | |
| **CULL_FRONT** | |
| **CULL_FRONT_AND_BACK** | |
| **[SHADER_STAGE_VERTEX](classRendering_1_1ShaderObjectInfo#classRendering_1_1ShaderObjectInfo_1a7932be0823352b096dc47778b3057efb)** | |
| **[SHADER_STAGE_FRAGMENT](classRendering_1_1ShaderObjectInfo#classRendering_1_1ShaderObjectInfo_1aaf4999737c021a740a534e4e44dddecc)** | |
| **[SHADER_STAGE_GEOMETRY](classRendering_1_1ShaderObjectInfo#classRendering_1_1ShaderObjectInfo_1a5c4d1b31828e38195e4c2c9316518b6d)** | |
| **[SHADER_STAGE_TESS_CONTROL](classRendering_1_1ShaderObjectInfo#classRendering_1_1ShaderObjectInfo_1a93e1059d71f13c3b582ea2620632295b)** | |
| **[SHADER_STAGE_TESS_EVALUATION](classRendering_1_1ShaderObjectInfo#classRendering_1_1ShaderObjectInfo_1ae9e7b604228dc134b73da9f1286882ef)** | |
| **[SHADER_STAGE_COMPUTE](classRendering_1_1ShaderObjectInfo#classRendering_1_1ShaderObjectInfo_1ad3ad5db2cb1424b6f3e7e832ebc12ac7)** | |
| **[TARGET_ARRAY_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a7a454115767d27846ac218d2867d4106)** | |
| **[TARGET_ATOMIC_COUNTER_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a18819887f07c67f424f80c1ad360d50d)** | |
| **[TARGET_COPY_READ_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1aa9d622ac99bbcb2cfb6d7318a7b37f38)** | |
| **[TARGET_COPY_WRITE_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a465bf0cd7438ee19716365128a33cf2e)** | |
| **[TARGET_DISPATCH_INDIRECT_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a49519053ce720c68b29ae3a7716759ef)** | |
| **[TARGET_DRAW_INDIRECT_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1aea368c5b429787882e960951448873d6)** | |
| **[TARGET_ELEMENT_ARRAY_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a576d751d2ad30f1a6c2473052383fcb5)** | |
| **[TARGET_PIXEL_PACK_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1af1cea6424582dd1c0d6a43f20398dbd4)** | |
| **[TARGET_PIXEL_UNPACK_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a44ad92c1a310efba303a1ae1721cb194)** | |
| **[TARGET_QUERY_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a5a8d058c4fe809dcafae6979b7baa0a2)** | |
| **[TARGET_SHADER_STORAGE_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a30aeba37b3028d907c5a6d37fe96b465)** | |
| **[TARGET_TEXTURE_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a3acdb69b26f32958da46b6ca03597395)** | |
| **[TARGET_TRANSFORM_FEEDBACK_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1aa4d9a228f113e6f5bf9b9d351cad119d)** | |
| **[TARGET_UNIFORM_BUFFER](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a0aa63a0178f15fb269eef609614efaee)** | |
| **[USAGE_STREAM_DRAW](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1ad4ca8afbdbdd192e608e3ad906db8e5f)** | |
| **[USAGE_STREAM_READ](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1ab5d6bf82deb3b0d0246c52d1964eb309)** | |
| **[USAGE_STREAM_COPY](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a10fdec3ea9be4f40ea8eb6c088d8ec26)** | |
| **[USAGE_STATIC_DRAW](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a9c82a81a2dd2a1054a3e4f57ed8ff026)** | |
| **[USAGE_STATIC_READ](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a306ae96710b44b0900625359c199c9f0)** | |
| **[USAGE_STATIC_COPY](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a15219c7857ae39a39dae1576491e4345)** | |
| **[USAGE_DYNAMIC_DRAW](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1adca74d9fdf14db4adb6eb93ea43b06ba)** | |
| **[USAGE_DYNAMIC_READ](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1a00d44c4391a5a42fda02abde4a382e86)** | |
| **[USAGE_DYNAMIC_COPY](classRendering_1_1BufferObject#classRendering_1_1BufferObject_1ab1c21fe28224345f5ecdcde698878822)** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **setDefaultMeshDataStrategy**(p0) | [ESF] void Rendering.setDefaultMeshDataStrategy(MeshDataStrategy) |
| **getDefaultMeshDataStrategy**() | MeshDataStrategy Rendering.getDefaultMeshDataStrategy() |
| **[getPureLocalStrategy](classRendering_1_1SimpleMeshDataStrategy#classRendering_1_1SimpleMeshDataStrategy_1a076f52ec32eec8fe1143c705c65ef823)**() | MeshDataStrategy Rendering.getPureLocalStrategy() |
| **[getDebugStrategy](classRendering_1_1SimpleMeshDataStrategy#classRendering_1_1SimpleMeshDataStrategy_1a1af3901fb9350c35ea8c5ff8bf17817f)**() | MeshDataStrategy Rendering.getDebugStrategy() |
| **[getStaticDrawReleaseLocalStrategy](classRendering_1_1SimpleMeshDataStrategy#classRendering_1_1SimpleMeshDataStrategy_1a985fdedebfdeaa6d4063b62970d8f53a)**() | MeshDataStrategy Rendering.getStaticDrawReleaseLocalStrategy() |
| **[getStaticDrawPreserveLocalStrategy](classRendering_1_1SimpleMeshDataStrategy#classRendering_1_1SimpleMeshDataStrategy_1a625c18bdce4b6a2c0f6a972a518f87eb)**() | MeshDataStrategy Rendering.getStaticDrawPreserveLocalStrategy() |
| **[getDynamicVertexStrategy](classRendering_1_1SimpleMeshDataStrategy#classRendering_1_1SimpleMeshDataStrategy_1ad38bae3d13a56195a73a24a78f481e61)**() | MeshDataStrategy Rendering.getDynamicVertexStrategy() |
| **[enableGLErrorChecking](namespaceRendering#group%5F%5Fhelper_1gad50bf79ce5f7446d1999f685e8fbd2f9)**() | [ESF] Void Rendering.enableGLErrorChecking() |
| **[disableGLErrorChecking](namespaceRendering#group%5F%5Fhelper_1ga1ddd8dd1c3044f1008eccd26cc75deda)**() | [ESF] Void Rendering.disableGLErrorChecking() |
| **[checkGLError](namespaceRendering#group%5F%5Fhelper_1gae24addf57dfb7555a884a5872820af1b)**() | [ESF] Void Rendering.checkGLError() |
| **[getGLTypeString](namespaceRendering#group%5F%5Fhelper_1ga09c07bc78be39bf190320e943217d21e)**(p0) | [ESF] String Rendering.getGLTypeString(Number) |
| **[outputGLInformation](namespaceRendering#group%5F%5Fhelper_1ga5a363b4eba863b9b687ac4aad2a2f22a)**() | [ESF] Void Rendering.outputGLInformation() |
| **[readDepthValue](namespaceRendering#group%5F%5Fhelper_1gaadf934792d9fa890a45d168c9da9916b)**(p0, p1) | [ESF] Number Rendering.readDepthValue(Number x, Number y) |
| **[enableDebugOutput](namespaceRendering#group%5F%5Fhelper_1ga5b041a52d40350109dd0b8b78a0b4a50)**() | [ESF] Void Rendering.enableDebugOutput() |
| **[disableDebugOutput](namespaceRendering#group%5F%5Fhelper_1gabaed9d4620892c9810fea35f95d513c9)**() | [ESF] Void Rendering.disableDebugOutput() |
| **[clusterPoints](classRendering_1_1StreamerXYZ#classRendering_1_1StreamerXYZ_1add33ceae311245e6781f4030a0d057c6)**(p0, p1) | [ESF] Void Rendering.clusterPoints(file,count) |
| **[drawCoordSys](namespaceRendering#group%5F%5Fdraw_1gaa985f0874a14561f9efeaafa2779fd66)**(p0 [, p1]) | [ESF] Void Rendering.drawCoordSys(RenderingContext, [Number scale]) |
| **[drawFullScreenRect](namespaceRendering#group%5F%5Fdraw_1ga3308893fd224241cc99ce8910af82d65)**(p0) | [ESF] void Rendering.drawFullScreenRect(RenderingContext) |
| **[drawGrid](namespaceRendering#group%5F%5Fdraw_1ga4d5948e45df92892551d828fda7bcfc6)**(p0 [, p1]) | [ESF] void Rendering.drawGrid(RenderingContext, [scale]) |
| **[drawQuad](namespaceRendering#group%5F%5Fdraw_1ga37923b71d8287bf806d02c94b0500041)**(p0, p1, p2, p3, p4 [, p5]) | [ESF] void Rendering.drawQuad(RenderingContext, lower left, lower right, upper right, upper left, [color]) |
| **[drawBox](namespaceRendering#group%5F%5Fdraw_1gacd9971e081cac707bc21c0f5ce88eb61)**(p0, p1 [, p2]) | [ESF] void Rendering.drawBox(RenderingContext, Box, [Color]) |
| **[drawAbsBox](namespaceRendering#group%5F%5Fdraw_1ga6ba69f4252735d4205f9d156d9d17044)**(p0, p1 [, p2]) | [ESF] void Rendering.drawAbsBox(RenderingContext, Box, [Color]) |
| **[drawRect](namespaceRendering#group%5F%5Fdraw_1gaa0eb4af032b587d9bef72a326a7d4c15)**(p0, p1 [, p2]) | [[ESF] void Rendering.drawRect(RenderingContext, Rec, [Color]) |
| **[drawWireframeBox](namespaceRendering#group%5F%5Fdraw_1gaac0741988384a43544577f9744822e11)**(p0, p1 [, p2]) | [[ESF] void Rendering.drawWireframeBox(RenderingContext, Box, [Color]) |
| **[drawWireframeRect](namespaceRendering#group%5F%5Fdraw_1ga60538569b8fc285a66724f518bdb0472)**(p0, p1 [, p2]) | [[ESF] void Rendering.drawWireframeRect(RenderingContext, Rec, [Color]) |
| **[drawVector](namespaceRendering#group%5F%5Fdraw_1ga88f880257330e0b324b4fb5aa80d2dfa)**(p0, p1, p2 [, p3]) | [ESF] void Rendering.drawVector(RenderingContext, Vec3 from, Vec3 to, [Color]) |
| **[enable2DMode](namespaceRendering#group%5F%5Fdraw_1ga4791cf675772274692a04621d7ec9739)**(p0 [, p1]) | [ESF] Void Rendering.enable2DMode(RenderingContext [Geometry.Rect screenRect]) |
| **[disable2DMode](namespaceRendering#group%5F%5Fdraw_1ga3839eb1ebb0ad274be48d21aac6f6335)**(p0) | [ESF] Void Rendering.disable2DMode(RenderingContext) |
| **[enableInstanceBuffer](namespaceRendering#group%5F%5Fdraw_1ga5882bc31abe4ce28f8a979894a2417a9)**(p0, p1, p2, p3) | [ESF] void Rendering.enableInstanceBuffer(RenderingContext, BufferObject positions, location, elements) |
| **[disableInstanceBuffer](namespaceRendering#group%5F%5Fdraw_1ga05668c17e3fd783ec91df82937557532)**(p0, p1, p2, p3) | [ESF] void Rendering.disableInstanceBuffer(RenderingContext, BufferObject positions, location, elements) |
| **[drawInstances](namespaceRendering#group%5F%5Fdraw_1gae927bbb996a56baf739a5d8035a037fc)**(p0, p1, p2, p3, p4) | [ESF] void Rendering.drawInstances(RenderingContext, Mesh, firstElement, elementCount, instanceCount)) |
| **[createTetrahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1ad710a567690d078a186a1632c8aa82af)**([p0]) | [ESF] (static) Mesh Rendering.createTetrahedron() |
| **[createCube](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1abd7e89e31262334cd7610d797e407a92)**([p0]) | [ESF] (static) Mesh Rendering.createCube() |
| **[createOctahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1aff950898ef4ad3b9159b370a8c75f2ba)**([p0]) | [ESF] (static) Mesh Rendering.createOctahedron() |
| **[createDodecahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1ad61c8f5810a4d56fadc20f3af7e83548)**([p0]) | [ESF] (static) Mesh Rendering.createDodecahedron() |
| **[createIcosahedron](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1a90e4deb387c15a3f14f3f02d6dba300f)**([p0]) | [ESF] (static) Mesh Rendering.createIcosahedron() |
| **[createEdgeSubdivisionSphere](namespaceRendering_1_1MeshUtils_1_1PlatonicSolids#namespaceRendering_1_1MeshUtils_1_1PlatonicSolids_1ab6e8d9c02c0b633fe4421e2c39426dbe)**(p0, p1) | [ESF] (static) Mesh Rendering.createEdgeSubdivisionSphere(E_Mesh platonicSolid, Number subdivisions) |
| **[createBox](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1adcabbacfabfe221004d11494c8ef60c0)**(p0, p1) | [ESF] (static) Mesh Rendering.createBox(VertexDescription, Box) |
| **[createDome](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1af7c627bb2e97719739291bef42697831)**(p0 [, p1 [, p2 [, p3 [, p4 [, p5]]]]]) | [ESF] (static) Mesh Rendering.createDome(VertexDescription, radius=100, int horiRes = 40, int vertRes = 40, double halfSphereFraction = 1.0, double imagePercentage = 1.0) |
| **[createSphere](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a276dcbfddaf2a3e66360ab3c4253df17)**(p0, p1, p2, p3) | [ESF] (static) Mesh Rendering.createSphere(VertexDescription, Sphere, inclinationSegments, azimuthSegments) |
| **[createDiscSector](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a21a3ff8668f01e398a984be62515324f)**(p0, p1, p2 [, p3]) | [ESF] (static) Mesh Rendering.createDiscSector(VertexDescription, float radius, uint8_t numSegments, float angle) |
| **[createRingSector](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1ac23e60d0b06f0a52fc99d35e1b971dee)**(p0, p1, p2, p3 [, p4]) | [ESF] (static) Mesh Rendering.createRingSector(VertexDescription, float innerRadius, float outerRadius, uint8_t numSegments, float angle) |
| **[createCone](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a1c81f86476d156fb842570da8a113e4d)**(p0, p1, p2, p3) | [ESF] (static) Mesh Rendering.createCone(VertexDescription, float radius, float height, uint8_t numSegments) |
| **[createConicalFrustum](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a1cac118ebebeeb679262355a4b27168e)**(p0, p1, p2, p3, p4) | [ESF] (static) Mesh Rendering.createConicalFrustum(VertexDescription, float radiusBottom, float radiusTop, float height, uint8_t numSegments) |
| **[createArrow](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a14e9f46ef2ca5ca6d1db5dc3095f4d3a)**(p0, p1, p2) | [ESF] (static) Mesh Rendering.createArrow(VertexDescription, float radius, float length) |
| **[createRectangle](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1ab80567e5cbd0318a3c08a10054d963b0)**(p0, p1 [, p2]) | [ESF] (static) Mesh Rendering.createRectangle(VertexDescription, Rect \| [width,height]) |
| **[createGrid](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a547256af2002a66fee161fe0c93d7ad6)**(p0, p1, p2, p3, p4) | [ESF] (static) Mesh Rendering.createGrid(VertexDescription, float width, float height, uint32_t rows, uint32_t columns) |
| **[createHexGrid](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a5633c20fe3bda852434912b8f3c90a36)**(p0, p1, p2, p3, p4) | [ESF] (static) Mesh Rendering.createHexGrid(VertexDescription, float width, float height, uint32_t rows, uint32_t columns) |
| **[createVoxelMesh](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a486ccc4072aef040c07190d53a2fa301)**(p0, p1, p2) | [ESF] (static) Mesh Rendering.createVoxelMesh(VertexDescription, Util.PixelAccessor voxelBitmap, Number depth) |
| **[createTorus](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a9fac437793f3677ab00265adfa509cad)**(p0, p1, p2, p3, p4) | [ESF] (static) Mesh Rendering.createTorus(VertexDescription, float innerRadius, float outerRadius, uint32_t majorSegments, uint32_t minorSegments) |
| **[createMeshFromBitmaps](namespaceRendering_1_1MeshUtils#namespaceRendering_1_1MeshUtils_1a3f653c2a76a2df80fd785b1cc143d367)**(p0, p1 [, p2 [, p3]]) | [ESF] (static) Mesh Rendering.createMeshFromBitmaps(VertexDescription, Util.PixelAccessor depth, [Util.PixelAccessor color, [Util.PixelAccessor normal]]) |
{: .nohead .nowrap1 }
