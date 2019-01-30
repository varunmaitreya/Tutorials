---
api_location: "MinSG/Ext/ParticleSystem/ParticleAffectors.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG"
category: "MinSG"
keywords: ParticleAnimator, ~ParticleAnimator, doExecute
layout: api
permalink: classMinSG_1_1ParticleAnimator
show_in_toc: false
sidebar: api_sidebar
title: "ParticleAnimator"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [MinSG::ParticleAffector](classMinSG_1_1ParticleAffector)


## Description



This is the most important affector. Without it, the particle system won't do anything.



## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[ParticleAnimator](#classMinSG_1_1ParticleAnimator_1a0d5e6df2192703deeda722c331d9b81b)**( [ParticleSystemNode](classMinSG_1_1ParticleSystemNode) * node) |
|  | |
|  | **[~ParticleAnimator](#classMinSG_1_1ParticleAnimator_1a4ed541c2388e5ea0ce8845f4df46d404)**() |
|  | |
| [AbstractBehaviour::behaviourResult_t](classMinSG_1_1Behavior#classMinSG_1_1Behavior_1afbd60a8df73dc581d2d00a1483f630ef) | **[doExecute](#classMinSG_1_1ParticleAnimator_1a7689263050da97d8aa23188f5269a4e4)**() |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> ParticleAnimator {#classMinSG_1_1ParticleAnimator_1a0d5e6df2192703deeda722c331d9b81b}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[ParticleAnimator](#classMinSG_1_1ParticleAnimator_1a0d5e6df2192703deeda722c331d9b81b)**( |  [ParticleSystemNode](classMinSG_1_1ParticleSystemNode) * | **node** ) |
{: .nohead .nowrap1 .api_doc }



empty



<sub>Defined in `MinSG/Ext/ParticleSystem/ParticleAffectors.h:63`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~ParticleAnimator {#classMinSG_1_1ParticleAnimator_1a4ed541c2388e5ea0ce8845f4df46d404}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~ParticleAnimator](#classMinSG_1_1ParticleAnimator_1a4ed541c2388e5ea0ce8845f4df46d404)**( |  ) |
{: .nohead .nowrap1 .api_doc }



empty



<sub>Defined in `MinSG/Ext/ParticleSystem/ParticleAffectors.h:65`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> doExecute {#classMinSG_1_1ParticleAnimator_1a7689263050da97d8aa23188f5269a4e4}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [AbstractBehaviour::behaviourResult_t](classMinSG_1_1Behavior#classMinSG_1_1Behavior_1afbd60a8df73dc581d2d00a1483f630ef) **[doExecute](#classMinSG_1_1ParticleAnimator_1a7689263050da97d8aa23188f5269a4e4)**( |  ) |
{: .nohead .nowrap1 .api_doc }



Just calls the animate & collect particles function of the particle system.



<sub>Defined in `MinSG/Ext/ParticleSystem/ParticleAffectors.h:71`</sub>{:style="float: right"}

-------------------------------------------------------------------

