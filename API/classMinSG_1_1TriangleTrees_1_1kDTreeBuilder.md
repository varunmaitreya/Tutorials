---
api_location: "MinSG/Ext/TriangleTrees/kDTreeBuilder.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|TriangleTrees:namespaceMinSG_1_1TriangleTrees"
category: "MinSG"
keywords: trianglesPerNode, allowedBBEnlargement, kDTreeBuilder, buildTriangleTree
layout: api
permalink: classMinSG_1_1TriangleTrees_1_1kDTreeBuilder
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "kDTreeBuilder"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [MinSG::TriangleTrees::Builder](classMinSG_1_1TriangleTrees_1_1Builder)


## Description



Class that creates a [kDTree](classMinSG_1_1TriangleTrees_1_1kDTree) .



**Author**: Benjamin Eikel



**Date**: 2009-06-29





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[kDTreeBuilder](#classMinSG_1_1TriangleTrees_1_1kDTreeBuilder_1a247bb84138d47b086c445053a6919966)**(std::size_t _trianglesPerNode, float _allowedBBEnlargement) |
|  | |
| [TriangleTree](classMinSG_1_1TriangleTrees_1_1TriangleTree) * | **[buildTriangleTree](#classMinSG_1_1TriangleTrees_1_1kDTreeBuilder_1abf2c4c6ee26abf09ad5703354bd60bdc)**( [Rendering::Mesh](classRendering_1_1Mesh) * mesh) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> kDTreeBuilder {#classMinSG_1_1TriangleTrees_1_1kDTreeBuilder_1a247bb84138d47b086c445053a6919966}

| public | inline | explicit |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[kDTreeBuilder](#classMinSG_1_1TriangleTrees_1_1kDTreeBuilder_1a247bb84138d47b086c445053a6919966)**( | std::size_t | **_trianglesPerNode**, |
| | float | **_allowedBBEnlargement** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/TriangleTrees/kDTreeBuilder.h:32`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> buildTriangleTree {#classMinSG_1_1TriangleTrees_1_1kDTreeBuilder_1abf2c4c6ee26abf09ad5703354bd60bdc}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [TriangleTree](classMinSG_1_1TriangleTrees_1_1TriangleTree) * **[buildTriangleTree](#classMinSG_1_1TriangleTrees_1_1kDTreeBuilder_1abf2c4c6ee26abf09ad5703354bd60bdc)**( |  [Rendering::Mesh](classRendering_1_1Mesh) * | **mesh** ) |
{: .nohead .nowrap1 .api_doc }



Create an [kDTree](classMinSG_1_1TriangleTrees_1_1kDTree) root by extracting geometry from*mesh*.


#### Parameters
**mesh**
:  Mesh containing geometry.




#### Returns
Root node of constructed [kDTree](classMinSG_1_1TriangleTrees_1_1kDTree) .



*See also*: kDTree::kdTree()





<sub>Defined in `MinSG/Ext/TriangleTrees/kDTreeBuilder.h:43`</sub>{:style="float: right"}

-------------------------------------------------------------------

