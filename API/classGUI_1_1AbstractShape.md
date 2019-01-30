---
api_location: "GUI/Base/AbstractShape.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "GUI:namespaceGUI"
category: "GUI"
keywords: flag_t, ACTIVE, AbstractShape, ~AbstractShape, display, clone
layout: api
permalink: classGUI_1_1AbstractShape
show_in_toc: false
sidebar: api_sidebar
title: "AbstractShape"
toc: false
---

| public | abstract |
{:.api_label}

#### Inherits

* [Util::ReferenceCounter](classUtil_1_1ReferenceCounter)


#### Inherited

* [GUI::AbstractLineShape](classGUI_1_1AbstractLineShape)
* [GUI::CrossShape](classGUI_1_1CrossShape)
* [GUI::GridShape](classGUI_1_1GridShape)
* [GUI::NullShape](classGUI_1_1NullShape)
* [GUI::OuterRectShadowShape](classGUI_1_1OuterRectShadowShape)
* [GUI::Rect3dShape](classGUI_1_1Rect3dShape)
* [GUI::RectShape](classGUI_1_1RectShape)
* [GUI::ResizerShape](classGUI_1_1ResizerShape)
* [GUI::Rounded3dRectShape](classGUI_1_1Rounded3dRectShape)
* [GUI::ScrollableMarkerShape](classGUI_1_1ScrollableMarkerShape)
* [GUI::ShadowedRectShape](classGUI_1_1ShadowedRectShape)
* [GUI::SliderMarkerShape](classGUI_1_1SliderMarkerShape)
* [GUI::TabHeaderShape](classGUI_1_1TabHeaderShape)
* [GUI::TriangleAtCornerShape](classGUI_1_1TriangleAtCornerShape)
* [GUI::TriangleSelectorShape](classGUI_1_1TriangleSelectorShape)


## Description





## Public Types

|
| ------: | ----------------- |
|  | |
| typedef uint16_t | **[flag_t](#classGUI_1_1AbstractShape_1a30ae7217ac48efbb16cf6053706fead5)**  |
{: .nohead .nowrap1 .api_section }


## Public Static Attributes

|
| ------: | ----------------- |
|  | |
| const [flag_t](classGUI_1_1AbstractShape#classGUI_1_1AbstractShape_1a30ae7217ac48efbb16cf6053706fead5) | **[ACTIVE](#classGUI_1_1AbstractShape_1ab05143fca45bd256d692f69dce1e2dfd)**  |
{: .nohead .nowrap1 .api_section }


## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[AbstractShape](#classGUI_1_1AbstractShape_1a704b2769b87072bc493e3c73c41685b4)**() |
|  | |
|  | **[~AbstractShape](#classGUI_1_1AbstractShape_1a5e3ac271b87406cce17ca22a4fd989e6)**() |
|  | |
| void | **[display](#classGUI_1_1AbstractShape_1abf231946c55c8bd4b8054e516f6ece72)**(const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & rect,  [flag_t](classGUI_1_1AbstractShape#classGUI_1_1AbstractShape_1a30ae7217ac48efbb16cf6053706fead5)  flag) |
|  | |
| [AbstractShape](classGUI_1_1AbstractShape) * | **[clone](#classGUI_1_1AbstractShape_1a8d1a760857b7dae8b5c0f48230f09360)**() |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>typedef</small><br/> flag_t {#classGUI_1_1AbstractShape_1a30ae7217ac48efbb16cf6053706fead5}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| typedef uint16_t **[flag_t](#classGUI_1_1AbstractShape_1a30ae7217ac48efbb16cf6053706fead5)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Base/AbstractShape.h:31`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> ACTIVE {#classGUI_1_1AbstractShape_1ab05143fca45bd256d692f69dce1e2dfd}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [flag_t](classGUI_1_1AbstractShape#classGUI_1_1AbstractShape_1a30ae7217ac48efbb16cf6053706fead5) **[ACTIVE](#classGUI_1_1AbstractShape_1ab05143fca45bd256d692f69dce1e2dfd)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Base/AbstractShape.h:33`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> AbstractShape {#classGUI_1_1AbstractShape_1a704b2769b87072bc493e3c73c41685b4}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[AbstractShape](#classGUI_1_1AbstractShape_1a704b2769b87072bc493e3c73c41685b4)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Base/AbstractShape.h:35`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~AbstractShape {#classGUI_1_1AbstractShape_1a5e3ac271b87406cce17ca22a4fd989e6}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~AbstractShape](#classGUI_1_1AbstractShape_1a5e3ac271b87406cce17ca22a4fd989e6)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Base/AbstractShape.h:36`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> display {#classGUI_1_1AbstractShape_1abf231946c55c8bd4b8054e516f6ece72}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[display](#classGUI_1_1AbstractShape_1abf231946c55c8bd4b8054e516f6ece72)**( | const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & | **rect**, |
| |  [flag_t](classGUI_1_1AbstractShape#classGUI_1_1AbstractShape_1a30ae7217ac48efbb16cf6053706fead5)  | **flag** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Base/AbstractShape.h:39`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> clone {#classGUI_1_1AbstractShape_1a8d1a760857b7dae8b5c0f48230f09360}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [AbstractShape](classGUI_1_1AbstractShape) * **[clone](#classGUI_1_1AbstractShape_1a8d1a760857b7dae8b5c0f48230f09360)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Base/AbstractShape.h:40`</sub>{:style="float: right"}

-------------------------------------------------------------------

