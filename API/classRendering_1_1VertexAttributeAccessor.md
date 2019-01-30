---
api_location: "Rendering/Mesh/VertexAttributeAccessors.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Rendering:namespaceRendering"
category: "Rendering"
keywords: vData, attribute, vertexSize, dataPtr, VertexAttributeAccessor, assertRange, assertNumValues, ~VertexAttributeAccessor, checkRange, getAttribute, _ptr, throwRangeError
layout: api
permalink: classRendering_1_1VertexAttributeAccessor
show_in_toc: true
sidebar: api_sidebar
subcategory: "Meshes"
title: "VertexAttributeAccessor"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [Util::ReferenceCounter](classUtil_1_1ReferenceCounter)


#### Inherited

* [Rendering::ColorAttributeAccessor](classRendering_1_1ColorAttributeAccessor)
* [Rendering::FloatAttributeAccessor](classRendering_1_1FloatAttributeAccessor)
* [Rendering::NormalAttributeAccessor](classRendering_1_1NormalAttributeAccessor)
* [Rendering::PositionAttributeAccessor](classRendering_1_1PositionAttributeAccessor)
* [Rendering::TexCoordAttributeAccessor](classRendering_1_1TexCoordAttributeAccessor)
* [Rendering::UIntAttributeAccessor](classRendering_1_1UIntAttributeAccessor)


## Description



Base class of all VertexAttributeAccessor-classes.
> **Note**: A [VertexAttributeAccessor](classRendering_1_1VertexAttributeAccessor) only stays valid as long as the referenced [MeshVertexData](classRendering_1_1MeshVertexData) is not altered externally!






## Protected Functions

|
| ------: | ----------------- |
|  | |
|  | **[VertexAttributeAccessor](#classRendering_1_1VertexAttributeAccessor_1add8c51ae82f3b26fc89a1df9b0d00d76)**( [MeshVertexData](classRendering_1_1MeshVertexData) & _vData,  [VertexAttribute](classRendering_1_1VertexAttribute)  _attribute) |
|  | |
| void | **[assertRange](#classRendering_1_1VertexAttributeAccessor_1af6bed641c1b10b66f5e7783ec4889f03)**(uint32_t index) const |
|  | |
| void | **[assertNumValues](#classRendering_1_1VertexAttributeAccessor_1a0a5e865197ec5301e69397386b29f0b6)**(uint32_t index, uint32_t count) const |
{: .nohead .nowrap1 .api_section }


## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[~VertexAttributeAccessor](#classRendering_1_1VertexAttributeAccessor_1ac1b61f59d55a05d30189425fc8af386e)**() |
|  | |
| bool | **[checkRange](#classRendering_1_1VertexAttributeAccessor_1a9426190a0f221fa7d4f87e2d929e5cce)**(uint32_t index) const |
|  | |
| const [VertexAttribute](classRendering_1_1VertexAttribute) & | **[getAttribute](#classRendering_1_1VertexAttributeAccessor_1a065126d87df0422d28ab0c5b8ba78445)**() const |
| template< typename number_t  >  | |
| number_t * | **[_ptr](#classRendering_1_1VertexAttributeAccessor_1a9e039d213b5c7b893a6e70370fd26209)**(uint32_t index) const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> VertexAttributeAccessor {#classRendering_1_1VertexAttributeAccessor_1add8c51ae82f3b26fc89a1df9b0d00d76}

| protected | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[VertexAttributeAccessor](#classRendering_1_1VertexAttributeAccessor_1add8c51ae82f3b26fc89a1df9b0d00d76)**( |  [MeshVertexData](classRendering_1_1MeshVertexData) & | **_vData**, |
| |  [VertexAttribute](classRendering_1_1VertexAttribute)  | **_attribute** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Rendering/Mesh/VertexAttributeAccessors.h:41`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> assertRange {#classRendering_1_1VertexAttributeAccessor_1af6bed641c1b10b66f5e7783ec4889f03}

| protected | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[assertRange](#classRendering_1_1VertexAttributeAccessor_1af6bed641c1b10b66f5e7783ec4889f03)**( | uint32_t | **index** ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Rendering/Mesh/VertexAttributeAccessors.h:46`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> assertNumValues {#classRendering_1_1VertexAttributeAccessor_1a0a5e865197ec5301e69397386b29f0b6}

| protected | const |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[assertNumValues](#classRendering_1_1VertexAttributeAccessor_1a0a5e865197ec5301e69397386b29f0b6)**( | uint32_t | **index**, |
| | uint32_t | **count** |
|   ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Rendering/Mesh/VertexAttributeAccessors.h:47`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~VertexAttributeAccessor {#classRendering_1_1VertexAttributeAccessor_1ac1b61f59d55a05d30189425fc8af386e}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~VertexAttributeAccessor](#classRendering_1_1VertexAttributeAccessor_1ac1b61f59d55a05d30189425fc8af386e)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Rendering/Mesh/VertexAttributeAccessors.h:49`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> checkRange {#classRendering_1_1VertexAttributeAccessor_1a9426190a0f221fa7d4f87e2d929e5cce}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[checkRange](#classRendering_1_1VertexAttributeAccessor_1a9426190a0f221fa7d4f87e2d929e5cce)**( | uint32_t | **index** ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Rendering/Mesh/VertexAttributeAccessors.h:51`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getAttribute {#classRendering_1_1VertexAttributeAccessor_1a065126d87df0422d28ab0c5b8ba78445}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [VertexAttribute](classRendering_1_1VertexAttribute) & **[getAttribute](#classRendering_1_1VertexAttributeAccessor_1a065126d87df0422d28ab0c5b8ba78445)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Rendering/Mesh/VertexAttributeAccessors.h:52`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> _ptr {#classRendering_1_1VertexAttributeAccessor_1a9e039d213b5c7b893a6e70370fd26209}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
| template< typename number_t  > |
| number_t * **[_ptr](#classRendering_1_1VertexAttributeAccessor_1a9e039d213b5c7b893a6e70370fd26209)**( | uint32_t | **index** ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Rendering/Mesh/VertexAttributeAccessors.h:55`</sub>{:style="float: right"}

-------------------------------------------------------------------

