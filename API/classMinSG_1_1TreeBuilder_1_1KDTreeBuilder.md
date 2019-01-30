---
api_location: "MinSG/Ext/TreeBuilder/KDTreeBuilder.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|TreeBuilder:namespaceMinSG_1_1TreeBuilder"
category: "MinSG"
keywords: KDTreeBuilder, ~KDTreeBuilder, split
layout: api
permalink: classMinSG_1_1TreeBuilder_1_1KDTreeBuilder
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "KDTreeBuilder"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [MinSG::TreeBuilder::AbstractTreeBuilder](classMinSG_1_1TreeBuilder_1_1AbstractTreeBuilder)


## Description





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[KDTreeBuilder](#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1aa65027adfb7aefbda3519151956c4434)**( [Util::GenericAttributeMap](classUtil_1_1GenericAttributeMap) & options) |
|  | |
|  | **[~KDTreeBuilder](#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1aa1552806e72c7605880a8209ff325d86)**() |
{: .nohead .nowrap1 .api_section }


## Protected Functions

|
| ------: | ----------------- |
|  | |
| [list_t](classMinSG_1_1TreeBuilder_1_1AbstractTreeBuilder#classMinSG_1_1TreeBuilder_1_1AbstractTreeBuilder_1a4d08192ec6664e44803fec38be3c5dbf) | **[split](#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1acf21fc99806170a2fcbbc4ab3f1522e4)**( [NodeWrapper](structMinSG_1_1TreeBuilder_1_1AbstractTreeBuilder_1_1NodeWrapper) & source) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> KDTreeBuilder {#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1aa65027adfb7aefbda3519151956c4434}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[KDTreeBuilder](#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1aa65027adfb7aefbda3519151956c4434)**( |  [Util::GenericAttributeMap](classUtil_1_1GenericAttributeMap) & | **options** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/TreeBuilder/KDTreeBuilder.h:25`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~KDTreeBuilder {#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1aa1552806e72c7605880a8209ff325d86}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~KDTreeBuilder](#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1aa1552806e72c7605880a8209ff325d86)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/TreeBuilder/KDTreeBuilder.h:26`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> split {#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1acf21fc99806170a2fcbbc4ab3f1522e4}

| protected | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [list_t](classMinSG_1_1TreeBuilder_1_1AbstractTreeBuilder#classMinSG_1_1TreeBuilder_1_1AbstractTreeBuilder_1a4d08192ec6664e44803fec38be3c5dbf) **[split](#classMinSG_1_1TreeBuilder_1_1KDTreeBuilder_1acf21fc99806170a2fcbbc4ab3f1522e4)**( |  [NodeWrapper](structMinSG_1_1TreeBuilder_1_1AbstractTreeBuilder_1_1NodeWrapper) & | **source** ) |
{: .nohead .nowrap1 .api_doc }



method to split the source should not set up the relationships between source an new created group nodes



<sub>Defined in `MinSG/Ext/TreeBuilder/KDTreeBuilder.h:30`</sub>{:style="float: right"}

-------------------------------------------------------------------

