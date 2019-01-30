---
api_location: "Rendering/MeshUtils/QuadtreeMeshBuilder.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Rendering:namespaceRendering|MeshUtils:namespaceRendering_1_1MeshUtils|QuadtreeMeshBuilder:classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder"
category: "Rendering"
keywords: stencil, StencilSplitFunction, operator()
layout: api
permalink: classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1StencilSplitFunction
show_in_toc: false
sidebar: api_sidebar
subcategory: "Meshes"
title: "StencilSplitFunction"
toc: false
---

| public |
{:.api_label}

## Description

Split function that only uses the stencil values.



## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[StencilSplitFunction](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1StencilSplitFunction_1ac53268fc52f6865aabc61f72d51be582)**( [Util::Reference](classUtil_1_1Reference) < [Util::PixelAccessor](classUtil_1_1PixelAccessor) > stencilAccessor) |
|  | |
| bool | **[operator()](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1StencilSplitFunction_1a6421ea7b6321bfa14aea38869f92a9fa)**( [QuadTree](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1QuadTree) * node) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> StencilSplitFunction {#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1StencilSplitFunction_1ac53268fc52f6865aabc61f72d51be582}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[StencilSplitFunction](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1StencilSplitFunction_1ac53268fc52f6865aabc61f72d51be582)**( |  [Util::Reference](classUtil_1_1Reference) < [Util::PixelAccessor](classUtil_1_1PixelAccessor) > | **stencilAccessor** ) |
{: .nohead .nowrap1 .api_doc }




#### Parameters
**stencilAccessor**
:  Access to the stencil values







<sub>Defined in `Rendering/MeshUtils/QuadtreeMeshBuilder.h:214`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> operator() {#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1StencilSplitFunction_1a6421ea7b6321bfa14aea38869f92a9fa}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[operator()](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1StencilSplitFunction_1a6421ea7b6321bfa14aea38869f92a9fa)**( |  [QuadTree](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1QuadTree) * | **node** ) |
{: .nohead .nowrap1 .api_doc }



Determine whether the specified quad tree node shall be split. Only the stencil values are used by this function.


#### Parameters
**node**
:  Quad tree node that is to be analyzed




#### Returns
`true`if the specified quad tree node should be split,`false`otherwise





<sub>Defined in `Rendering/MeshUtils/QuadtreeMeshBuilder.h:223`</sub>{:style="float: right"}

-------------------------------------------------------------------

