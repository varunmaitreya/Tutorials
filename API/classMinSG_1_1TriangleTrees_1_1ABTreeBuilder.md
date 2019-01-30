---
api_location: "MinSG/Ext/TriangleTrees/ABTreeBuilder.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|TriangleTrees:namespaceMinSG_1_1TriangleTrees"
category: "MinSG"
keywords: trianglesPerNode, allowedBBEnlargement, ABTreeBuilder, buildTriangleTree
layout: api
permalink: classMinSG_1_1TriangleTrees_1_1ABTreeBuilder
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "ABTreeBuilder"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [MinSG::TriangleTrees::Builder](classMinSG_1_1TriangleTrees_1_1Builder)


## Description



Class that creates a [kDTree](classMinSG_1_1TriangleTrees_1_1kDTree) from a [MinSG](namespaceMinSG) scene given by its root node. It extracts the triangles needed by the [kDTree](classMinSG_1_1TriangleTrees_1_1kDTree) from meshes of the GeometryNodes inside the scene.



**Author**: Benjamin Eikel



**Date**: 2009-06-29





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[ABTreeBuilder](#classMinSG_1_1TriangleTrees_1_1ABTreeBuilder_1aa7e84053233f90d6e55390504795ecbb)**(std::size_t _trianglesPerNode, float _allowedBBEnlargement) |
|  | |
| [TriangleTree](classMinSG_1_1TriangleTrees_1_1TriangleTree) * | **[buildTriangleTree](#classMinSG_1_1TriangleTrees_1_1ABTreeBuilder_1ad71f51753efe3c80dba968025ac7bede)**( [Rendering::Mesh](classRendering_1_1Mesh) * mesh) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> ABTreeBuilder {#classMinSG_1_1TriangleTrees_1_1ABTreeBuilder_1aa7e84053233f90d6e55390504795ecbb}

| public | inline | explicit |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[ABTreeBuilder](#classMinSG_1_1TriangleTrees_1_1ABTreeBuilder_1aa7e84053233f90d6e55390504795ecbb)**( | std::size_t | **_trianglesPerNode**, |
| | float | **_allowedBBEnlargement** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/TriangleTrees/ABTreeBuilder.h:34`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> buildTriangleTree {#classMinSG_1_1TriangleTrees_1_1ABTreeBuilder_1ad71f51753efe3c80dba968025ac7bede}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [TriangleTree](classMinSG_1_1TriangleTrees_1_1TriangleTree) * **[buildTriangleTree](#classMinSG_1_1TriangleTrees_1_1ABTreeBuilder_1ad71f51753efe3c80dba968025ac7bede)**( |  [Rendering::Mesh](classRendering_1_1Mesh) * | **mesh** ) |
{: .nohead .nowrap1 .api_doc }



Create an [ABTree](classMinSG_1_1TriangleTrees_1_1ABTree) root by extracting geometry from*mesh*.


#### Parameters
**mesh**
:  Mesh containing geometry.




#### Returns
Root node of constructed [ABTree](classMinSG_1_1TriangleTrees_1_1ABTree) .



*See also*:  [ABTree::ABTree()](classMinSG_1_1TriangleTrees_1_1ABTree#classMinSG_1_1TriangleTrees_1_1ABTree_1abc3964ee5bd2bcdac1e69d75ac7efa88) 





<sub>Defined in `MinSG/Ext/TriangleTrees/ABTreeBuilder.h:45`</sub>{:style="float: right"}

-------------------------------------------------------------------

