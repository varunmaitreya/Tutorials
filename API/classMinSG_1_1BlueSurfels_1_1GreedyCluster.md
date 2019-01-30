---
api_location: "MinSG/Ext/BlueSurfels/Samplers/GreedyCluster.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|BlueSurfels:namespaceMinSG_1_1BlueSurfels"
category: "MinSG"
keywords: minRadius, sampleSurfels, setMinRadius, getMinRadius
layout: api
permalink: classMinSG_1_1BlueSurfels_1_1GreedyCluster
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "GreedyCluster"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [MinSG::BlueSurfels::AbstractSurfelSampler](classMinSG_1_1BlueSurfels_1_1AbstractSurfelSampler)


## Description



Computes an exact greedy permutation of the input samples.

Inspired by: Sariel Har-Peled and Manor Mendel Fast Construction of Nets in Low-Dimensional Metrics and Their Applications SIAM Journal on Computing (2006).[https://doi.org/10.1137/s0097539704446281](https://doi.org/10.1137/s0097539704446281)



## Public Functions

|
| ------: | ----------------- |
|  | |
| [Rendering::Mesh](classRendering_1_1Mesh) * | **[sampleSurfels](#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1a04ea1988b194bc50c8ef33a4c1589aa7)**( [Rendering::Mesh](classRendering_1_1Mesh) * sourceMesh) |
|  | |
| void | **[setMinRadius](#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1a904189ac2b52125e0c35acbfb2402633)**(float r) |
|  | |
| float | **[getMinRadius](#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1aef9dc92d6a05880ab2171f6bb3bf8464)**() const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> sampleSurfels {#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1a04ea1988b194bc50c8ef33a4c1589aa7}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Rendering::Mesh](classRendering_1_1Mesh) * **[sampleSurfels](#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1a04ea1988b194bc50c8ef33a4c1589aa7)**( |  [Rendering::Mesh](classRendering_1_1Mesh) * | **sourceMesh** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Samplers/GreedyCluster.h:31`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> setMinRadius {#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1a904189ac2b52125e0c35acbfb2402633}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[setMinRadius](#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1a904189ac2b52125e0c35acbfb2402633)**( | float | **r** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Samplers/GreedyCluster.h:33`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getMinRadius {#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1aef9dc92d6a05880ab2171f6bb3bf8464}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| float **[getMinRadius](#classMinSG_1_1BlueSurfels_1_1GreedyCluster_1aef9dc92d6a05880ab2171f6bb3bf8464)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Samplers/GreedyCluster.h:34`</sub>{:style="float: right"}

-------------------------------------------------------------------

