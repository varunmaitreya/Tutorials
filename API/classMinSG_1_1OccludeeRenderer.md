---
api_location: "MinSG/Ext/OcclusionCulling/OccludeeRenderer.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG"
category: "MinSG"
keywords: occlusionCullingRenderer, useWireframe, showOriginal, OccludeeRenderer, OccludeeRenderer, OccludeeRenderer, ~OccludeeRenderer, clone, setUseWireframe, getUseWireframe, setShowOriginal, getShowOriginal, doEnableState
layout: api
permalink: classMinSG_1_1OccludeeRenderer
show_in_toc: true
sidebar: api_sidebar
subcategory: "States"
title: "OccludeeRenderer"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [MinSG::State](classMinSG_1_1State)


## Description



Renderer that displays the scene using conservative occlusion culling first. After that the occluded objects are additionally displayed in front. The real work is not done by this class, but by using an occlusion culling renderer.



**Author**: Benjamin Eikel



**Date**: 2011-07-06





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1aadf9ba9d957e915dd83ab18abfefdd98)**() |
|  | |
|  | **[OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1af5c77249e309cce7f3d6ce41e58c8345)**(const [OccludeeRenderer](classMinSG_1_1OccludeeRenderer) & other) |
|  | |
|  | **[OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1a0861cd94d5c7e5f92b0baee6591dc021)**( [OccludeeRenderer](classMinSG_1_1OccludeeRenderer) && void) |
|  | |
|  | **[~OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1a78669e3a4594211932f93a51e1203a02)**() |
|  | |
| [OccludeeRenderer](classMinSG_1_1OccludeeRenderer) * | **[clone](#classMinSG_1_1OccludeeRenderer_1af5813c1e496f353fc8dac47a2e697c24)**() const <br/> Create a duplicate of this [State](classMinSG_1_1State) object. |
|  | |
| void | **[setUseWireframe](#classMinSG_1_1OccludeeRenderer_1a4c8028fd85df5b72c1de20b64099c38d)**(bool b) |
|  | |
| bool | **[getUseWireframe](#classMinSG_1_1OccludeeRenderer_1a458c69082de2ea71db1712a1134a25d6)**() const |
|  | |
| void | **[setShowOriginal](#classMinSG_1_1OccludeeRenderer_1a38d22c999fd9196d0ee24584ad1a893b)**(bool b) |
|  | |
| bool | **[getShowOriginal](#classMinSG_1_1OccludeeRenderer_1a2ebfe7edb00906a82043e0d35f31e176)**() const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> OccludeeRenderer {#classMinSG_1_1OccludeeRenderer_1aadf9ba9d957e915dd83ab18abfefdd98}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1aadf9ba9d957e915dd83ab18abfefdd98)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:32`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> OccludeeRenderer {#classMinSG_1_1OccludeeRenderer_1af5c77249e309cce7f3d6ce41e58c8345}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1af5c77249e309cce7f3d6ce41e58c8345)**( | const [OccludeeRenderer](classMinSG_1_1OccludeeRenderer) & | **other** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:33`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> OccludeeRenderer {#classMinSG_1_1OccludeeRenderer_1a0861cd94d5c7e5f92b0baee6591dc021}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1a0861cd94d5c7e5f92b0baee6591dc021)**( |  [OccludeeRenderer](classMinSG_1_1OccludeeRenderer) && | **void** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:34`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~OccludeeRenderer {#classMinSG_1_1OccludeeRenderer_1a78669e3a4594211932f93a51e1203a02}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~OccludeeRenderer](#classMinSG_1_1OccludeeRenderer_1a78669e3a4594211932f93a51e1203a02)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:35`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> clone {#classMinSG_1_1OccludeeRenderer_1af5813c1e496f353fc8dac47a2e697c24}

| public | const | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [OccludeeRenderer](classMinSG_1_1OccludeeRenderer) * **[clone](#classMinSG_1_1OccludeeRenderer_1af5813c1e496f353fc8dac47a2e697c24)**( |  ) const |
{: .nohead .nowrap1 .api_doc }

Create a duplicate of this [State](classMinSG_1_1State) object.





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:37`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> setUseWireframe {#classMinSG_1_1OccludeeRenderer_1a4c8028fd85df5b72c1de20b64099c38d}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[setUseWireframe](#classMinSG_1_1OccludeeRenderer_1a4c8028fd85df5b72c1de20b64099c38d)**( | bool | **b** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:39`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getUseWireframe {#classMinSG_1_1OccludeeRenderer_1a458c69082de2ea71db1712a1134a25d6}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[getUseWireframe](#classMinSG_1_1OccludeeRenderer_1a458c69082de2ea71db1712a1134a25d6)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:40`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> setShowOriginal {#classMinSG_1_1OccludeeRenderer_1a38d22c999fd9196d0ee24584ad1a893b}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[setShowOriginal](#classMinSG_1_1OccludeeRenderer_1a38d22c999fd9196d0ee24584ad1a893b)**( | bool | **b** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:42`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getShowOriginal {#classMinSG_1_1OccludeeRenderer_1a2ebfe7edb00906a82043e0d35f31e176}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[getShowOriginal](#classMinSG_1_1OccludeeRenderer_1a2ebfe7edb00906a82043e0d35f31e176)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/OcclusionCulling/OccludeeRenderer.h:43`</sub>{:style="float: right"}

-------------------------------------------------------------------

