---
api_location: "Rendering/MeshUtils/QuadtreeMeshBuilder.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Rendering:namespaceRendering|MeshUtils:namespaceRendering_1_1MeshUtils|QuadtreeMeshBuilder:classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder"
category: "Rendering"
keywords: depth, minDepth, maxDepth, disruptionFactor, DepthSplitFunction, operator()
layout: api
permalink: classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1DepthSplitFunction
show_in_toc: false
sidebar: api_sidebar
subcategory: "Meshes"
title: "DepthSplitFunction"
toc: false
---

| public |
{:.api_label}

## Description

Split function that only uses the depth values.



## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[DepthSplitFunction](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1DepthSplitFunction_1ae271df29eeeacecd5eb0c28068360c1c)**( [Util::Reference](classUtil_1_1Reference) < [Util::PixelAccessor](classUtil_1_1PixelAccessor) > depthAccessor, float depthDisruption) |
|  | |
| bool | **[operator()](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1DepthSplitFunction_1a7dda87f8eec97a9a8bf7fcd551190477)**( [QuadTree](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1QuadTree) * node) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> DepthSplitFunction {#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1DepthSplitFunction_1ae271df29eeeacecd5eb0c28068360c1c}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[DepthSplitFunction](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1DepthSplitFunction_1ae271df29eeeacecd5eb0c28068360c1c)**( |  [Util::Reference](classUtil_1_1Reference) < [Util::PixelAccessor](classUtil_1_1PixelAccessor) > | **depthAccessor**, |
| | float | **depthDisruption** |
|   ) |
{: .nohead .nowrap1 .api_doc }



Default constructor. The minimum and maximum depth values are initialized here.


#### Parameters
**depthAccessor**
:  Access to the depth values



**depthDisruption**
:  This factor is multiplied with the depth range. If a difference larger than the result is found between two depth values, a split will be performed.







<sub>Defined in `Rendering/MeshUtils/QuadtreeMeshBuilder.h:164`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> operator() {#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1DepthSplitFunction_1a7dda87f8eec97a9a8bf7fcd551190477}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[operator()](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1DepthSplitFunction_1a7dda87f8eec97a9a8bf7fcd551190477)**( |  [QuadTree](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1QuadTree) * | **node** ) |
{: .nohead .nowrap1 .api_doc }



Determine whether the specified quad tree node shall be split. Only the depth values are used by this function.


#### Parameters
**node**
:  Quad tree node that is to be analyzed




#### Returns
`true`if the specified quad tree node should be split,`false`otherwise





<sub>Defined in `Rendering/MeshUtils/QuadtreeMeshBuilder.h:173`</sub>{:style="float: right"}

-------------------------------------------------------------------

