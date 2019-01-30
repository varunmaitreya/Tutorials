---
api_location: "MinSG/Ext/Evaluator/OccOverheadEvaluator.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|Evaluators:namespaceMinSG_1_1Evaluators"
category: "MinSG"
keywords: renderingTime, renderingFlags, OccOverheadEvaluator, ~OccOverheadEvaluator, beginMeasure, measure, endMeasure
layout: api
permalink: classMinSG_1_1Evaluators_1_1OccOverheadEvaluator
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "OccOverheadEvaluator"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [MinSG::Evaluators::Evaluator](classMinSG_1_1Evaluators_1_1Evaluator)


## Description





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[OccOverheadEvaluator](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1ad083bc52ac19e0da0d44d01ddf6bb8c3)**( [DirectionMode](classMinSG_1_1Evaluators_1_1Evaluator#classMinSG_1_1Evaluators_1_1Evaluator_1addbbec5e92458641beb8a715f7904b1b)  mode) |
|  | |
|  | **[~OccOverheadEvaluator](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a7778d5fbf73bbcd3b02ffaffb4715317)**() |
|  | |
| void | **[beginMeasure](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a1624ac752e9f8a3517b316e5f2a1c4c0)**() |
|  | |
| void | **[measure](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a44a3ed3d2a448f6655a4e937d1e4ab4d)**( [FrameContext](classMinSG_1_1FrameContext) & context,  [Node](classMinSG_1_1Node) & node, const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & r) |
|  | |
| void | **[endMeasure](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a6a427bb44b6fd52eed3d1db89f309279)**( [FrameContext](classMinSG_1_1FrameContext) & context) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> OccOverheadEvaluator {#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1ad083bc52ac19e0da0d44d01ddf6bb8c3}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[OccOverheadEvaluator](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1ad083bc52ac19e0da0d44d01ddf6bb8c3)**( |  [DirectionMode](classMinSG_1_1Evaluators_1_1Evaluator#classMinSG_1_1Evaluators_1_1Evaluator_1addbbec5e92458641beb8a715f7904b1b)  | **mode** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Evaluator/OccOverheadEvaluator.h:30`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~OccOverheadEvaluator {#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a7778d5fbf73bbcd3b02ffaffb4715317}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~OccOverheadEvaluator](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a7778d5fbf73bbcd3b02ffaffb4715317)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Evaluator/OccOverheadEvaluator.h:31`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> beginMeasure {#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a1624ac752e9f8a3517b316e5f2a1c4c0}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[beginMeasure](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a1624ac752e9f8a3517b316e5f2a1c4c0)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Evaluator/OccOverheadEvaluator.h:33`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> measure {#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a44a3ed3d2a448f6655a4e937d1e4ab4d}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[measure](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a44a3ed3d2a448f6655a4e937d1e4ab4d)**( |  [FrameContext](classMinSG_1_1FrameContext) & | **context**, |
| |  [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & | **r** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Evaluator/OccOverheadEvaluator.h:34`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> endMeasure {#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a6a427bb44b6fd52eed3d1db89f309279}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[endMeasure](#classMinSG_1_1Evaluators_1_1OccOverheadEvaluator_1a6a427bb44b6fd52eed3d1db89f309279)**( |  [FrameContext](classMinSG_1_1FrameContext) & | **context** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Evaluator/OccOverheadEvaluator.h:35`</sub>{:style="float: right"}

-------------------------------------------------------------------

