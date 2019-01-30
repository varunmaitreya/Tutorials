---
api_location: "API/E_MinSG/Ext/BlueSurfels/E_LibBlueSurfels.cpp:43:23"
api_type: namespace
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "MinSG:escript_namespace_MinSG"
category: "MinSG"
keywords: _constructor, getSize, setSize, _constructor, getCount, setCount, _constructor, getCountFactor, setCountFactor, getSizeFactor, setSizeFactor, _constructor, getBlend, setBlend, _constructor, getReferencePoint, setReferencePoint, _constructor, getHideSurfels, setHideSurfels, getFixSurfels, setFixSurfels, getProgressiveMinimalMinimalVertexDistances, getMinimalVertexDistances, getMedianOfNthClosestNeighbours, differentialDomainAnalysis, getPrefixForRadius, getRadiusForPrefix, computeSurfelPacking, computeRelPixelSize, radiusToSize, sizeToRadius, CENTER_BB, CLOSEST_BB, CLOSEST_SURFEL, FARTHEST_BB
layout: e_api
order: 1
permalink: escript_namespace_MinSG_BlueSurfels
show_in_toc: true
sidebar: e_api_sidebar
subcategory: "BlueSurfels"
title: "BlueSurfels"
toc: false
---

## Types

|
| ------- | ----------------- |
| type | [AbstractSurfelStrategy](escript_type_MinSG_BlueSurfels_AbstractSurfelStrategy) |
| type | [AdaptiveStrategy](escript_type_MinSG_BlueSurfels_AdaptiveStrategy) |
| type | [FoveatedStrategy](escript_type_MinSG_BlueSurfels_FoveatedStrategy) |
| type | [ShaderStrategy](escript_type_MinSG_BlueSurfels_ShaderStrategy) |
| type | [AbstractSurfelSampler](escript_type_MinSG_BlueSurfels_AbstractSurfelSampler) |
| type | [GreedyCluster](escript_type_MinSG_BlueSurfels_GreedyCluster) |
| type | [ProgressiveSampler](escript_type_MinSG_BlueSurfels_ProgressiveSampler) |
| type | [RandomSampler](escript_type_MinSG_BlueSurfels_RandomSampler) |
| type | [ScriptedSampler](escript_type_MinSG_BlueSurfels_ScriptedSampler) |
{: .nohead }

## Attributes

|
| ------: | ----------------- |
| **CENTER_BB** | |
| **CLOSEST_BB** | |
| **CLOSEST_SURFEL** | |
| **FARTHEST_BB** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **_constructor**() | [ESMF] new FixedSizeStrategy |
| **getSize**() |  |
| **setSize**(p0) |  |
| **_constructor**() | [ESMF] new FixedCountStrategy |
| **getCount**() |  |
| **setCount**(p0) |  |
| **_constructor**() | [ESMF] new FactorStrategy |
| **getCountFactor**() |  |
| **setCountFactor**(p0) |  |
| **getSizeFactor**() |  |
| **setSizeFactor**(p0) |  |
| **_constructor**() | [ESMF] new BlendStrategy |
| **getBlend**() |  |
| **setBlend**(p0) |  |
| **_constructor**() | [ESMF] new FixedCountStrategy |
| **getReferencePoint**() |  |
| **setReferencePoint**(p0) |  |
| **_constructor**() | [ESMF] new DebugStrategy |
| **getHideSurfels**() |  |
| **setHideSurfels**(p0) |  |
| **[getFixSurfels](classMinSG_1_1BlueSurfels_1_1DebugStrategy#classMinSG_1_1BlueSurfels_1_1DebugStrategy_1a507088cd98467dfccaf2f222ecb1a841)**() |  |
| **[setFixSurfels](classMinSG_1_1BlueSurfels_1_1DebugStrategy#classMinSG_1_1BlueSurfels_1_1DebugStrategy_1a9bad476421b2bc6f79fbfe78cd942191)**(p0) |  |
| **[getProgressiveMinimalMinimalVertexDistances](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1ac20a18549ae0f794d8248e41aad1b1d8)**(p0) | [Number\*] MinSG.BlueSurfels.getProgressiveMinimalMinimalVertexDistances(Rendering.Mesh) |
| **[getMinimalVertexDistances](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1a242c42f5130d986422cbc82f60cfe0f2)**(p0, p1) | [Number\*] MinSG.BlueSurfels.getMinimalVertexDistances(Rendering.Mesh,int) |
| **[getMedianOfNthClosestNeighbours](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1a42755909b74e14f84856a836c4ea221c)**(p0, p1, p2) | [ESMF] Number MinSG.BlueSurfels.getMedianOfNthClosestNeighbours(Rendering::Mesh&amp; mesh, size_t prefixLength, size_t nThNeighbour) |
| **[differentialDomainAnalysis](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1a4a7a968840e853cf2228374b8ea25045)**(p0, p1 [, p2 [, p3 [, p4]]]) | [ESF] Bitmap Experiments.differentialDomainAnalysis(Mesh, Number diff_max, [Number resolution, [Number count, [Bool geodetic]]]) |
| **[getPrefixForRadius](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1a37962540ba257ebe5722afd5b78d4426)**(p0, p1) | [ESMF] Number MinSG.BlueSurfels.getPrefixForRadius(float radius, float packing) |
| **[getRadiusForPrefix](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1a753ba04014f0cc577996ee36093893fc)**(p0, p1) | [ESMF] Number MinSG.BlueSurfels.getRadiusForPrefix(uint32_t prefix, float packing) |
| **[computeSurfelPacking](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1abb357761ddb53b27f7a20378cee0b461)**(p0) | [ESMF] Number MinSG.BlueSurfels.computeSurfelPacking(Rendering.Mesh) |
| **[computeRelPixelSize](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1a402f91e1226a77df3b7fd913fbf5bce3)**(p0, p1 [, p2]) | [ESMF] Number MinSG.BlueSurfels.computeRelPixelSize(MinSG::FrameContext &amp; context, MinSG::Node \* node) |
| **[radiusToSize](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1ad56bf3ee4a27fe1e989d952ed89d518f)**(p0, p1) | [ESMF] Number MinSG.BlueSurfels.radiusToSize(float radius, float relPixelSize) |
| **[sizeToRadius](namespaceMinSG_1_1BlueSurfels#namespaceMinSG_1_1BlueSurfels_1ad92204af619ca6f09ef29f6446b4e129)**(p0, p1) | [ESMF] Number MinSG.BlueSurfels.sizeToRadius(float size, float relPixelSize) |
{: .nohead .nowrap1 }
