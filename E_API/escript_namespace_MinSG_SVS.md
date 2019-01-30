---
api_location: "API/E_MinSG/Ext/ELibMinSGExt.cpp:500:24"
api_type: namespace
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "MinSG:escript_namespace_MinSG"
category: "MinSG"
keywords: createSamplingCamera, transformCamera, createColorTexture, hasVisibilitySphere, retrieveVisibilitySphere, getSphereMemoryUsage, transformSphere, transformSpheresFromWorldToLocal, INTERPOLATION_NEAREST, INTERPOLATION_MAX3, INTERPOLATION_MAXALL, INTERPOLATION_WEIGHTED3
layout: e_api
order: 1
permalink: escript_namespace_MinSG_SVS
show_in_toc: true
sidebar: e_api_sidebar
subcategory: "SVS"
title: "SVS"
toc: false
---

## Types

|
| ------- | ----------------- |
| type | [BudgetRenderer](escript_type_MinSG_SVS_BudgetRenderer) |
| type | [GeometryNodeCollector](escript_type_MinSG_SVS_GeometryNodeCollector) |
| type | [PreprocessingContext](escript_type_MinSG_SVS_PreprocessingContext) |
| type | [Renderer](escript_type_MinSG_SVS_Renderer) |
| type | [SamplePoint](escript_type_MinSG_SVS_SamplePoint) |
| type | [SphereVisualizationRenderer](escript_type_MinSG_SVS_SphereVisualizationRenderer) |
| type | [VisibilitySphere](escript_type_MinSG_SVS_VisibilitySphere) |
{: .nohead }

## Attributes

|
| ------: | ----------------- |
| **INTERPOLATION_NEAREST** | |
| **INTERPOLATION_MAX3** | |
| **INTERPOLATION_MAXALL** | |
| **INTERPOLATION_WEIGHTED3** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **[createSamplingCamera](namespaceMinSG_1_1SVS#namespaceMinSG_1_1SVS_1a981aeb8142fc143de9fc9d46bf1fa81e)**(p0, p1, p2) | [ESF] CameraNodeOrtho SVS.createSamplingCamera(Sphere, Matrix4x4, Number) |
| **[transformCamera](namespaceMinSG_1_1SVS#namespaceMinSG_1_1SVS_1a838f2dc094a0afb62317f216a56a8060)**(p0, p1, p2, p3) | [ESF] Void SVS.transformCamera(AbstractCameraNode, Sphere, Matrix4x4, Vec3) |
| **[createColorTexture](namespaceMinSG_1_1SVS#namespaceMinSG_1_1SVS_1a0e7f6a052c7cdaf2c3f5b4fab08836ec)**(p0, p1, p2, p3) | [ESF] Texture SVS.createColorTexture(Number, Number, VisibilitySphere, Number) |
| **[hasVisibilitySphere](namespaceMinSG_1_1SVS#namespaceMinSG_1_1SVS_1a73ac8673e37748252cd9957d288de031)**(p0) | [ESF] Bool SVS.hasVisibilitySphere(GroupNode) |
| **[retrieveVisibilitySphere](namespaceMinSG_1_1SVS#namespaceMinSG_1_1SVS_1a1d5c7ba2f6c1234b0000d42dcb9b063e)**(p0) | [ESF] VisibilitySphere SVS.retrieveVisibilitySphere(GroupNode) |
| **getSphereMemoryUsage**(p0) | [ESF] Number SVS.getSphereMemoryUsage(GroupNode) |
| **[transformSphere](namespaceMinSG_1_1SVS#namespaceMinSG_1_1SVS_1a4c7da45f2cf4247ff315bc5e6ff7832e)**(p0, p1) | [ESF] Sphere SVS.transformSphere(Sphere, Matrix4x4) |
| **[transformSpheresFromWorldToLocal](namespaceMinSG_1_1SVS#namespaceMinSG_1_1SVS_1ae40287a5ba8192375ef6fbd973fd9fd4)**(p0) | [ESF] Void SVS.transformSpheresFromWorldToLocal(GroupNode) |
{: .nohead .nowrap1 }
