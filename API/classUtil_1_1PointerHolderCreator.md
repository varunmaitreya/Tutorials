---
api_location: "Util/Factory/Factory.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Util:namespaceUtil"
category: "Util"
keywords: instance, PointerHolderCreator, operator()
layout: api
permalink: classUtil_1_1PointerHolderCreator
show_in_toc: false
sidebar: api_sidebar
template: "template< class ObjectType  > "
title: "PointerHolderCreator"
toc: false
---

| public |
{:.api_label}

## Description

Creator for objects that holds a single instance.

This functor stores a pointer to a single instance of type*ObjectType*. It returns that pointer every time a creation is requested.


#### Parameters
**ObjectType**
:  Concrete type of object that will be pointed to





**Author**: Benjamin Eikel



**Date**: 2012-02-08





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[PointerHolderCreator](#classUtil_1_1PointerHolderCreator_1abc96d9ed4d67035c0b5e63ccfb2ac6d2)**(ObjectType * ptr) |
|  | |
| ObjectType * | **[operator()](#classUtil_1_1PointerHolderCreator_1a00e67df175d8ce6aba5dc99bf18a5d49)**() |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> PointerHolderCreator {#classUtil_1_1PointerHolderCreator_1abc96d9ed4d67035c0b5e63ccfb2ac6d2}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[PointerHolderCreator](#classUtil_1_1PointerHolderCreator_1abc96d9ed4d67035c0b5e63ccfb2ac6d2)**( | ObjectType * | **ptr** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Factory/Factory.h:99`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> operator() {#classUtil_1_1PointerHolderCreator_1a00e67df175d8ce6aba5dc99bf18a5d49}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| ObjectType * **[operator()](#classUtil_1_1PointerHolderCreator_1a00e67df175d8ce6aba5dc99bf18a5d49)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Factory/Factory.h:101`</sub>{:style="float: right"}

-------------------------------------------------------------------

