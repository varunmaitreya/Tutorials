---
api_location: "MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|BlueSurfels:namespaceMinSG_1_1BlueSurfels"
category: "MinSG"
keywords: priority, enabled, AbstractSurfelStrategy, ~AbstractSurfelStrategy, prepare, update, beforeRendering, afterRendering, getPriority, setEnabled, isEnabled
layout: api
permalink: classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "AbstractSurfelStrategy"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [Util::ReferenceCounter](classUtil_1_1ReferenceCounter)


#### Inherited

* [MinSG::BlueSurfels::AdaptiveStrategy](classMinSG_1_1BlueSurfels_1_1AdaptiveStrategy)
* [MinSG::BlueSurfels::BlendStrategy](classMinSG_1_1BlueSurfels_1_1BlendStrategy)
* [MinSG::BlueSurfels::DebugStrategy](classMinSG_1_1BlueSurfels_1_1DebugStrategy)
* [MinSG::BlueSurfels::FactorStrategy](classMinSG_1_1BlueSurfels_1_1FactorStrategy)
* [MinSG::BlueSurfels::FixedCountStrategy](classMinSG_1_1BlueSurfels_1_1FixedCountStrategy)
* [MinSG::BlueSurfels::FixedSizeStrategy](classMinSG_1_1BlueSurfels_1_1FixedSizeStrategy)
* [MinSG::BlueSurfels::FoveatedStrategy](classMinSG_1_1BlueSurfels_1_1FoveatedStrategy)
* [MinSG::BlueSurfels::ReferencePointStrategy](classMinSG_1_1BlueSurfels_1_1ReferencePointStrategy)
* [MinSG::BlueSurfels::ShaderStrategy](classMinSG_1_1BlueSurfels_1_1ShaderStrategy)


## Description





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[AbstractSurfelStrategy](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a28e5b914c2701ec0f89fabb3dbade906)**(float priority) |
|  | |
|  | **[~AbstractSurfelStrategy](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a035fffff406229656590878f85170a39)**() |
|  | |
| bool | **[prepare](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a0a9ea3dff3651213e3ae3c0a366261d6)**( [MinSG::FrameContext](classMinSG_1_1FrameContext) & context,  [MinSG::Node](classMinSG_1_1Node) * node) |
|  | |
| bool | **[update](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1ae9c8cc7eb23f3de2a3aec216bc148e56)**( [MinSG::FrameContext](classMinSG_1_1FrameContext) & context,  [MinSG::Node](classMinSG_1_1Node) * node,  [SurfelObject](structMinSG_1_1BlueSurfels_1_1SurfelObject) & surfel) |
|  | |
| bool | **[beforeRendering](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a9466960ca11976292b2ca2ec148dfacd)**( [MinSG::FrameContext](classMinSG_1_1FrameContext) & context) |
|  | |
| void | **[afterRendering](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1af0f27bbfeb335711651750726eb6891c)**( [MinSG::FrameContext](classMinSG_1_1FrameContext) & context) |
|  | |
| float | **[getPriority](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1aaa99c2a1bee71f7d1c9d9e311570fb7b)**() const |
|  | |
| void | **[setEnabled](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a64bf9c0f2eecd581d8dec76a4b32f0f6)**(bool v) |
|  | |
| bool | **[isEnabled](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1af72a28b486ab513f701a55de975e15a9)**() const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> AbstractSurfelStrategy {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a28e5b914c2701ec0f89fabb3dbade906}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[AbstractSurfelStrategy](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a28e5b914c2701ec0f89fabb3dbade906)**( | float | **priority** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:56`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~AbstractSurfelStrategy {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a035fffff406229656590878f85170a39}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~AbstractSurfelStrategy](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a035fffff406229656590878f85170a39)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:58`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> prepare {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a0a9ea3dff3651213e3ae3c0a366261d6}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[prepare](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a0a9ea3dff3651213e3ae3c0a366261d6)**( |  [MinSG::FrameContext](classMinSG_1_1FrameContext) & | **context**, |
| |  [MinSG::Node](classMinSG_1_1Node) * | **node** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:59`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> update {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1ae9c8cc7eb23f3de2a3aec216bc148e56}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[update](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1ae9c8cc7eb23f3de2a3aec216bc148e56)**( |  [MinSG::FrameContext](classMinSG_1_1FrameContext) & | **context**, |
| |  [MinSG::Node](classMinSG_1_1Node) * | **node**, |
| |  [SurfelObject](structMinSG_1_1BlueSurfels_1_1SurfelObject) & | **surfel** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:60`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> beforeRendering {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a9466960ca11976292b2ca2ec148dfacd}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[beforeRendering](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a9466960ca11976292b2ca2ec148dfacd)**( |  [MinSG::FrameContext](classMinSG_1_1FrameContext) & | **context** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:61`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> afterRendering {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1af0f27bbfeb335711651750726eb6891c}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[afterRendering](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1af0f27bbfeb335711651750726eb6891c)**( |  [MinSG::FrameContext](classMinSG_1_1FrameContext) & | **context** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:62`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getPriority {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1aaa99c2a1bee71f7d1c9d9e311570fb7b}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| float **[getPriority](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1aaa99c2a1bee71f7d1c9d9e311570fb7b)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:64`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> setEnabled {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a64bf9c0f2eecd581d8dec76a4b32f0f6}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[setEnabled](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1a64bf9c0f2eecd581d8dec76a4b32f0f6)**( | bool | **v** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:65`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> isEnabled {#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1af72a28b486ab513f701a55de975e15a9}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[isEnabled](#classMinSG_1_1BlueSurfels_1_1AbstractSurfelStrategy_1af72a28b486ab513f701a55de975e15a9)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/BlueSurfels/Strategies/AbstractSurfelStrategy.h:66`</sub>{:style="float: right"}

-------------------------------------------------------------------

