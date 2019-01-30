---
api_location: "Rendering/MeshUtils/QuadtreeMeshBuilder.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Rendering:namespaceRendering|MeshUtils:namespaceRendering_1_1MeshUtils|QuadtreeMeshBuilder:classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder"
category: "Rendering"
keywords: functions, MultipleSplitFunction, operator()
layout: api
permalink: classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1MultipleSplitFunction
show_in_toc: false
sidebar: api_sidebar
subcategory: "Meshes"
title: "MultipleSplitFunction"
toc: false
---

| public |
{:.api_label}

## Description

Split function that uses multiple other split functions.



## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[MultipleSplitFunction](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1MultipleSplitFunction_1accebab3948fa19bfbfb0704fd153b8cf)**(std::deque< [split_function_t](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1ae89220f539a0406ae25968e7eae1b433) > splitFunctions) |
|  | |
| bool | **[operator()](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1MultipleSplitFunction_1ae23efa530aedaa3b92a06e8ea1400a1c)**( [QuadTree](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1QuadTree) * node) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> MultipleSplitFunction {#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1MultipleSplitFunction_1accebab3948fa19bfbfb0704fd153b8cf}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[MultipleSplitFunction](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1MultipleSplitFunction_1accebab3948fa19bfbfb0704fd153b8cf)**( | std::deque< [split_function_t](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1ae89220f539a0406ae25968e7eae1b433) > | **splitFunctions** ) |
{: .nohead .nowrap1 .api_doc }




#### Parameters
**splitFunctions**
:  Array of split functions to use







<sub>Defined in `Rendering/MeshUtils/QuadtreeMeshBuilder.h:236`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> operator() {#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1MultipleSplitFunction_1ae23efa530aedaa3b92a06e8ea1400a1c}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[operator()](#classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1MultipleSplitFunction_1ae23efa530aedaa3b92a06e8ea1400a1c)**( |  [QuadTree](classRendering_1_1MeshUtils_1_1QuadtreeMeshBuilder_1_1QuadTree) * | **node** ) |
{: .nohead .nowrap1 .api_doc }



Determine whether the specified quad tree node shall be split. All split functions are used by this function.


#### Parameters
**node**
:  Quad tree node that is to be analyzed




#### Returns
`true`if the specified quad tree node should be split,`false`otherwise





<sub>Defined in `Rendering/MeshUtils/QuadtreeMeshBuilder.h:247`</sub>{:style="float: right"}

-------------------------------------------------------------------

