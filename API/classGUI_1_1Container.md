---
api_location: "GUI/Components/Container.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "GUI:namespaceGUI"
category: "GUI"
keywords: ContainerRef, firstChild, lastChild, contentsCount, Container, Container, _addChild, _insertAfter, _insertBefore, _removeChild, getFirstChild, getLastChild, childRectChanged, addContent, removeContent, clearContents, destroyContents, getContentsCount, bringChildToFront, getContents, insertAfter, insertBefore, toString, traverseChildren, traverseSubtree, ~Container, displayChildren, copyChildrenTo, doDisplay
layout: api
permalink: classGUI_1_1Container
show_in_toc: false
sidebar: api_sidebar
title: "Container"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [GUI::Component](classGUI_1_1Component)


#### Inherited

* [GUI::Button](classGUI_1_1Button)
* [GUI::Checkbox](classGUI_1_1Checkbox)
* [GUI::Connector](classGUI_1_1Connector)
* [GUI::Connector::ConnectorPoint](classGUI_1_1Connector_1_1ConnectorPoint)
* [GUI::EditorPanel](classGUI_1_1EditorPanel)
* [GUI::ListView](classGUI_1_1ListView)
* [GUI::Menu](classGUI_1_1Menu)
* [GUI::ScrollableContainer](classGUI_1_1ScrollableContainer)
* [GUI::Scrollbar](classGUI_1_1Scrollbar)
* [GUI::Slider](classGUI_1_1Slider)
* [GUI::TabbedPanel](classGUI_1_1TabbedPanel)
* [GUI::TabbedPanel::Tab](classGUI_1_1TabbedPanel_1_1Tab)
* [GUI::Textarea](classGUI_1_1Textarea)
* [GUI::TreeView](classGUI_1_1TreeView)
* [GUI::TreeView::TreeViewEntry](classGUI_1_1TreeView_1_1TreeViewEntry)
* [GUI::Window](classGUI_1_1Window)


## Description





## Public Types

|
| ------: | ----------------- |
|  | |
| typedef [Util::Reference](classUtil_1_1Reference) < [Container](classGUI_1_1Container) > | **[ContainerRef](#classGUI_1_1Container_1a6cec1e4694b85bb99e0a0cd29d6efa77)**  |
{: .nohead .nowrap1 .api_section }


## Protected Attributes

|
| ------: | ----------------- |
|  | |
| [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) | **[firstChild](#classGUI_1_1Container_1a911698f9c996fc273711da8d5aca3e46)**  |
|  | |
| [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) | **[lastChild](#classGUI_1_1Container_1aaaff46f6efae2b95d63e1636d9fd0ab4)**  |
|  | |
| size_t | **[contentsCount](#classGUI_1_1Container_1a0a127b827ae3ee99bc8f7c859b3bfe0d)**  |
{: .nohead .nowrap1 .api_section }


## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[Container](#classGUI_1_1Container_1ad2ebd9a35af52e5a04cfb14f030dfe3b)**( [GUI_Manager](classGUI_1_1GUI%5F%5FManager) & gui,  [flag_t](classGUI_1_1Component#classGUI_1_1Component_1aa86a1fd78119640545900da0f8f620bd)  flags) |
|  | |
|  | **[Container](#classGUI_1_1Container_1a1dc4b5df5b9768b67111cb51739987bc)**( [GUI_Manager](classGUI_1_1GUI%5F%5FManager) & gui, const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & r,  [flag_t](classGUI_1_1Component#classGUI_1_1Component_1aa86a1fd78119640545900da0f8f620bd)  flags) |
|  | |
| void | **[_addChild](#classGUI_1_1Container_1a98ab738521adb0b2a9f214bd8616d6a7)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child) |
|  | |
| void | **[_insertAfter](#classGUI_1_1Container_1ad41a8097db94a1036c2f5b63710e62b5)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child, const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & after) |
|  | |
| void | **[_insertBefore](#classGUI_1_1Container_1aece39fa92c6632208cf74e33d0b22e2a)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child, const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & before) |
|  | |
| void | **[_removeChild](#classGUI_1_1Container_1a5e203d24ec79177e0fced8d40c06aa25)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child) |
|  | |
| [Component](classGUI_1_1Component) * | **[getFirstChild](#classGUI_1_1Container_1a9e4a96a043b4f9073ab1f21d2cf9bae6)**() const |
|  | |
| [Component](classGUI_1_1Component) * | **[getLastChild](#classGUI_1_1Container_1ae343300d42499d6813ddc7d032298d1b)**() const |
|  | |
| void | **[childRectChanged](#classGUI_1_1Container_1ac06b15615aa5b107327c35a473a9478e)**( [Component](classGUI_1_1Component) * c) |
|  | |
| void | **[addContent](#classGUI_1_1Container_1a4ed7c8edeedad4519ad3fb3c5f88112e)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child) |
|  | |
| void | **[removeContent](#classGUI_1_1Container_1ab09f7abd16fc596c3cf5168caf9ddb8c)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child) |
|  | |
| void | **[clearContents](#classGUI_1_1Container_1ade02435bd92bb1984abf4cd5160328ac)**() |
|  | |
| void | **[destroyContents](#classGUI_1_1Container_1a59368bd93f7014ab86c12bc8cba82bb8)**() |
|  | |
| size_t | **[getContentsCount](#classGUI_1_1Container_1a3bea6a1f5786c246bb1f1e73d94a4c50)**() const |
|  | |
| void | **[bringChildToFront](#classGUI_1_1Container_1ac50cb48631f606b1e2d319ba8575645f)**( [Component](classGUI_1_1Component) * c) |
|  | |
| std::vector< [Component](classGUI_1_1Component) * > | **[getContents](#classGUI_1_1Container_1abd5207e58756304fc3bf382392855429)**() |
|  | |
| void | **[insertAfter](#classGUI_1_1Container_1a1051041874c2529972b917b0b1ab1b71)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child, const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & after) |
|  | |
| void | **[insertBefore](#classGUI_1_1Container_1af838dd9e63990602eacd122b1d507b6a)**(const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & child, const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & after) |
|  | |
| std::string | **[toString](#classGUI_1_1Container_1a09bab5d5d42bbc5bf25a0de24e58128b)**() const |
|  | |
| [visitorResult_t](classGUI_1_1Component#classGUI_1_1Component_1afc331644e4e3f97542614f2cd08e4363) | **[traverseChildren](#classGUI_1_1Container_1a8192844ee7ea8dd5a689bba8de80e56f)**( [Visitor](structGUI_1_1Component_1_1Visitor) & v) |
|  | |
| [visitorResult_t](classGUI_1_1Component#classGUI_1_1Component_1afc331644e4e3f97542614f2cd08e4363) | **[traverseSubtree](#classGUI_1_1Container_1ad9c9bf6c481f55b6bc5800abce59f9f9)**( [Visitor](structGUI_1_1Component_1_1Visitor) & v) |
{: .nohead .nowrap1 .api_section }


## Protected Functions

|
| ------: | ----------------- |
|  | |
|  | **[~Container](#classGUI_1_1Container_1a1e1d5603ed9a9932be3a39acf4e7fa72)**() |
|  | |
| void | **[displayChildren](#classGUI_1_1Container_1a81a42e145ae6b1de6814a7daa62aa510)**(const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & region, bool useScissor) |
|  | |
| void | **[copyChildrenTo](#classGUI_1_1Container_1a9ffb040fb997428334f76e36b061862b)**( [Container](classGUI_1_1Container) & target) const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>typedef</small><br/> ContainerRef {#classGUI_1_1Container_1a6cec1e4694b85bb99e0a0cd29d6efa77}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| typedef [Util::Reference](classUtil_1_1Reference) < [Container](classGUI_1_1Container) > **[ContainerRef](#classGUI_1_1Container_1a6cec1e4694b85bb99e0a0cd29d6efa77)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:28`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> firstChild {#classGUI_1_1Container_1a911698f9c996fc273711da8d5aca3e46}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) **[firstChild](#classGUI_1_1Container_1a911698f9c996fc273711da8d5aca3e46)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:85`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> lastChild {#classGUI_1_1Container_1aaaff46f6efae2b95d63e1636d9fd0ab4}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) **[lastChild](#classGUI_1_1Container_1aaaff46f6efae2b95d63e1636d9fd0ab4)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:86`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> contentsCount {#classGUI_1_1Container_1a0a127b827ae3ee99bc8f7c859b3bfe0d}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| size_t **[contentsCount](#classGUI_1_1Container_1a0a127b827ae3ee99bc8f7c859b3bfe0d)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:87`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> Container {#classGUI_1_1Container_1ad2ebd9a35af52e5a04cfb14f030dfe3b}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[Container](#classGUI_1_1Container_1ad2ebd9a35af52e5a04cfb14f030dfe3b)**( |  [GUI_Manager](classGUI_1_1GUI%5F%5FManager) & | **gui**, |
| |  [flag_t](classGUI_1_1Component#classGUI_1_1Component_1aa86a1fd78119640545900da0f8f620bd)  | **flags** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:25`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> Container {#classGUI_1_1Container_1a1dc4b5df5b9768b67111cb51739987bc}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[Container](#classGUI_1_1Container_1a1dc4b5df5b9768b67111cb51739987bc)**( |  [GUI_Manager](classGUI_1_1GUI%5F%5FManager) & | **gui**, |
| | const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & | **r**, |
| |  [flag_t](classGUI_1_1Component#classGUI_1_1Component_1aa86a1fd78119640545900da0f8f620bd)  | **flags** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:26`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> _addChild {#classGUI_1_1Container_1a98ab738521adb0b2a9f214bd8616d6a7}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[_addChild](#classGUI_1_1Container_1a98ab738521adb0b2a9f214bd8616d6a7)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:34`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> _insertAfter {#classGUI_1_1Container_1ad41a8097db94a1036c2f5b63710e62b5}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[_insertAfter](#classGUI_1_1Container_1ad41a8097db94a1036c2f5b63710e62b5)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child**, |
| | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **after** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:35`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> _insertBefore {#classGUI_1_1Container_1aece39fa92c6632208cf74e33d0b22e2a}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[_insertBefore](#classGUI_1_1Container_1aece39fa92c6632208cf74e33d0b22e2a)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child**, |
| | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **before** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:36`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> _removeChild {#classGUI_1_1Container_1a5e203d24ec79177e0fced8d40c06aa25}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[_removeChild](#classGUI_1_1Container_1a5e203d24ec79177e0fced8d40c06aa25)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:37`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getFirstChild {#classGUI_1_1Container_1a9e4a96a043b4f9073ab1f21d2cf9bae6}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Component](classGUI_1_1Component) * **[getFirstChild](#classGUI_1_1Container_1a9e4a96a043b4f9073ab1f21d2cf9bae6)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:39`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getLastChild {#classGUI_1_1Container_1ae343300d42499d6813ddc7d032298d1b}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Component](classGUI_1_1Component) * **[getLastChild](#classGUI_1_1Container_1ae343300d42499d6813ddc7d032298d1b)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:40`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> childRectChanged {#classGUI_1_1Container_1ac06b15615aa5b107327c35a473a9478e}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[childRectChanged](#classGUI_1_1Container_1ac06b15615aa5b107327c35a473a9478e)**( |  [Component](classGUI_1_1Component) * | **c** ) |
{: .nohead .nowrap1 .api_doc }



This is called by a child`c`whenever its rect is changed, it's added or it's removed. The LAYOUT_VALID flag is cleared.



<sub>Defined in `GUI/Components/Container.h:44`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> addContent {#classGUI_1_1Container_1a4ed7c8edeedad4519ad3fb3c5f88112e}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[addContent](#classGUI_1_1Container_1a4ed7c8edeedad4519ad3fb3c5f88112e)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:47`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> removeContent {#classGUI_1_1Container_1ab09f7abd16fc596c3cf5168caf9ddb8c}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[removeContent](#classGUI_1_1Container_1ab09f7abd16fc596c3cf5168caf9ddb8c)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:49`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> clearContents {#classGUI_1_1Container_1ade02435bd92bb1984abf4cd5160328ac}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[clearContents](#classGUI_1_1Container_1ade02435bd92bb1984abf4cd5160328ac)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:51`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> destroyContents {#classGUI_1_1Container_1a59368bd93f7014ab86c12bc8cba82bb8}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[destroyContents](#classGUI_1_1Container_1a59368bd93f7014ab86c12bc8cba82bb8)**( |  ) |
{: .nohead .nowrap1 .api_doc }



Remove all children and mark them for removal . The childrens' subtrees will be dissolved and their attributes will be removed.
> **Note**: this does (or should not) not remove the internal children like scroll bars.






<sub>Defined in `GUI/Components/Container.h:56`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getContentsCount {#classGUI_1_1Container_1a3bea6a1f5786c246bb1f1e73d94a4c50}

| public | const | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| size_t **[getContentsCount](#classGUI_1_1Container_1a3bea6a1f5786c246bb1f1e73d94a4c50)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:59`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> bringChildToFront {#classGUI_1_1Container_1ac50cb48631f606b1e2d319ba8575645f}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[bringChildToFront](#classGUI_1_1Container_1ac50cb48631f606b1e2d319ba8575645f)**( |  [Component](classGUI_1_1Component) * | **c** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:61`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getContents {#classGUI_1_1Container_1abd5207e58756304fc3bf382392855429}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| std::vector< [Component](classGUI_1_1Component) * > **[getContents](#classGUI_1_1Container_1abd5207e58756304fc3bf382392855429)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:63`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> insertAfter {#classGUI_1_1Container_1a1051041874c2529972b917b0b1ab1b71}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[insertAfter](#classGUI_1_1Container_1a1051041874c2529972b917b0b1ab1b71)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child**, |
| | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **after** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:65`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> insertBefore {#classGUI_1_1Container_1af838dd9e63990602eacd122b1d507b6a}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[insertBefore](#classGUI_1_1Container_1af838dd9e63990602eacd122b1d507b6a)**( | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **child**, |
| | const [Ref](classGUI_1_1Component#classGUI_1_1Component_1a9811a53d9b6fcdab386cb3ece74e6bbd) & | **after** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:69`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> toString {#classGUI_1_1Container_1a09bab5d5d42bbc5bf25a0de24e58128b}

| public | const | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| std::string **[toString](#classGUI_1_1Container_1a09bab5d5d42bbc5bf25a0de24e58128b)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:74`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> traverseChildren {#classGUI_1_1Container_1a8192844ee7ea8dd5a689bba8de80e56f}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [visitorResult_t](classGUI_1_1Component#classGUI_1_1Component_1afc331644e4e3f97542614f2cd08e4363) **[traverseChildren](#classGUI_1_1Container_1a8192844ee7ea8dd5a689bba8de80e56f)**( |  [Visitor](structGUI_1_1Component_1_1Visitor) & | **v** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:75`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> traverseSubtree {#classGUI_1_1Container_1ad9c9bf6c481f55b6bc5800abce59f9f9}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [visitorResult_t](classGUI_1_1Component#classGUI_1_1Component_1afc331644e4e3f97542614f2cd08e4363) **[traverseSubtree](#classGUI_1_1Container_1ad9c9bf6c481f55b6bc5800abce59f9f9)**( |  [Visitor](structGUI_1_1Component_1_1Visitor) & | **v** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:76`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~Container {#classGUI_1_1Container_1a1e1d5603ed9a9932be3a39acf4e7fa72}

| protected | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~Container](#classGUI_1_1Container_1a1e1d5603ed9a9932be3a39acf4e7fa72)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:31`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> displayChildren {#classGUI_1_1Container_1a81a42e145ae6b1de6814a7daa62aa510}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[displayChildren](#classGUI_1_1Container_1a81a42e145ae6b1de6814a7daa62aa510)**( | const [Geometry::Rect](namespaceGeometry#namespaceGeometry_1acedeea2f6bddd99f077df6f73901a875) & | **region**, |
| | bool | **useScissor** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:82`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> copyChildrenTo {#classGUI_1_1Container_1a9ffb040fb997428334f76e36b061862b}

| protected | const |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[copyChildrenTo](#classGUI_1_1Container_1a9ffb040fb997428334f76e36b061862b)**( |  [Container](classGUI_1_1Container) & | **target** ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `GUI/Components/Container.h:83`</sub>{:style="float: right"}

-------------------------------------------------------------------

