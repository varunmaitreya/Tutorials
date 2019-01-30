---
api_location: "API/E_GUI/E_GUI_Manager.cpp:40:31"
api_type: type
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "GUI:escript_namespace_GUI"
category: "GUI"
keywords: _constructor, enableMouseButtonListener, closeAllMenus, createButton, createContainer, createCheckbox, createConnector, createEditorPanel, createIcon, createImage, createHSplitter, createLabel, createListView, createMenu, createNextRow, createNextColumn, createPanel, createSlider, createTab, createTabbedPanel, createTextarea, createTextfield, createTreeView, createTreeViewEntry, createWindow, createVSplitter, createHSplitter, disableLazyRendering, display, enableLazyRendering, getComponentAtPos, getDebugMode, getScreenRect, getDefaultFont, handleEvent, setWindow, isCurrentlyEnabled, isLazyRenderingEnabled, loadImage, markForRemoval, registerWindow, setActiveComponent, setDebugMode, setDefaultColor, setDefaultFont, setDefaultShape, registerMouseCursor, setGlobalValue, unregisterWindow, unselectAll, _createPanelNextRow, _createPanelNextColumn, _createGridShape, _createRectShape, _createRect3dShape, _createShadowedRectShape, _createOuterRectShadowShape, _createTriangleSelectorShape, _createRounded3dRectShape, _createSmoothConnectorShape, _createTriangleAtCornerShape, _createStraightLineShape, getNullShape, createCheckBox, createTextField
layout: e_api
permalink: escript_type_GUI_GUI_Manager
show_in_toc: true
sidebar: e_api_sidebar
title: "GUI_Manager"
toc: false
---

## Attributes

|
| ------: | ----------------- |
| **createCheckBox** | |
| **createTextField** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **_constructor**([p0]) | [ESF] GUI_Manager new GUI.GUI_Manager( [EventContext] ) |
| **enableMouseButtonListener**(p0) | [ESMF] void GUI_Manager.enableMouseButtonListener(Component) |
| **[closeAllMenus](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a03e61831d4b8a39a612ffbc7aed00bdb)**() | [ESMF] self GUI_Manager.closeAllMenus() |
| **[createButton](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1ac6865f670811e98a5bf07fe062d17fdc)**([p0 [, p1 [, p2 [, p3]]]]) | [ESMF] GUI_Manager.createButton( [w,h[,text[,flags]]] ) |
| **[createContainer](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a6923f2254ee7a8dd29c8246f578821e0)**(p0, p1 [, p2]) | [ESMF] GUI_Manager.createContainer(w,h[,flags]) |
| **[createCheckbox](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a9027b160913528a2d9eab57229205b00)**([p0 [, p1 [, p2]]]) | [ESMF] GUI_Manager.createCheckbox( [text,[checked,[flags]]]) |
| **[createConnector](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a558448af64d5314546b866361b429d19)**([p0]) | \deprecated<br/>[ESMF] GUI_Manager.createConnector( [flags] ) |
| **[createEditorPanel](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a0ce8c28854a08fe11d6f6bc8163e482c)**([p0]) | [ESMF] GUI_Manager.createEditorPanel( [flags] ) |
| **[createIcon](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a32e071bcd1a1b8bb5d57a46d517de231)**(p0, p1 [, p2]) | [ESMF] GUI_Manager.createIcon( Image\|ImageData,Rect imageRect,[,flags] ) |
| **[createImage](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1ae8898c3a7d158fc027f345ecfebc4cbc)**(p0 [, p1 [, p2]]) | [ESMF] GUI_Manager.createImage( (w,h[,flags]) \| Bitmap ) |
| **[createHSplitter](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a54144315e0fe610027785fe553061607)**([p0]) | [ESMF] GUI_Manager.createHSplitter([flags]) |
| **[createLabel](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1acebfe20d87e463a496eee5e164a1c83a)**([p0 [, p1 [, p2 [, p3]]]]) | [ESMF] GUI_Manager.createLabel(w,h,text,[flags] \| &quot;text&quot;[,flags] ) |
| **[createListView](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a8e98ab42c2260f11102ea75c6e3af713)**([p0]) | [ESMF] GUI_Manager.createListView( [flags] ) |
| **[createMenu](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a765cb58fde28afcfe8e9fe02a6888001)**([p0]) | [ESMF] GUI_Manager.createMenu( [flags] ) |
| **[createNextRow](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1aadd068777b550f4729ea9e97a5f897c3)**([p0]) | [ESMF] GUI_Manager.createNextColumn( [flags] ) |
| **[createNextColumn](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a833dfa1ed29b751813a45aff366335f3)**([p0]) | [ESMF] GUI_Manager.createNextColumn( [flags] ) |
| **[createPanel](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a8a5a94af818f5540153d451acdaf1acb)**([p0 [, p1 [, p2]]]) | [ESMF] GUI_Manager.createPanel( [w,h,[,flags]] \| [flags] ) |
| **[createSlider](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1ac6ac8ea75d6da45d08d201c60bcf2dd1)**(p0, p1, p2, p3 [, p4 [, p5]]) | [ESMF] GUI_Manager.createSlider(w,h,min,max,[steps,[flags]]) |
| **createTab**(p0, p1) | [ESMF] GUI_Manager.createTab(title,clientArea) |
| **[createTabbedPanel](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1af43a19e0c798663c35c1bd174ad64f16)**([p0 [, p1 [, p2]]]) | [ESMF] GUI_Manager.createTabbedPanel([w,h,[flags]]) |
| **[createTextarea](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1aeb5eeba537c5c0d9b439598f665ffdc8)**([p0 [, p1]]) | [ESMF] GUI_Manager.createTextarea([text[,flags]]) |
| **[createTextfield](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1afb68ea53173027cbb8d6a8a0464f2065)**(p0, p1 [, p2 [, p3]]) | [ESMF] GUI_Manager.createTextfield(w,h,[text[,flags]]) |
| **[createTreeView](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a2c5b41680e1463129d590fdb893d57a5)**(p0, p1 [, p2]) | \deprecated<br/>[ESMF] GUI_Manager.createTreeView(w,h,[flags]) |
| **[createTreeViewEntry](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a689304a305b13b2032aa70a67be44ad0)**(p0) | [ESMF] TreeViewEntry GUI_Manager.createTreeViewEntry(Component) |
| **[createWindow](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1aac1a7bff0a2f100037c341694bc2eeb1)**(p0, p1 [, p2 [, p3]]) | [ESMF] GUI_Manager.createWindow(w,h,[text,[flags]]) |
| **[createVSplitter](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1ab747e58fd6c7997439b2a23206d03350)**([p0]) | [ESMF] GUI_Manager.createVSplitter([flags]) |
| **[createHSplitter](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a54144315e0fe610027785fe553061607)**([p0]) | [ESMF] GUI_Manager.createHSplitter([flags]) |
| **[disableLazyRendering](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1ae3b92d433a28082522beca5297a3a6b4)**() | [ESMF] GUI_Manager.disableLazyRendering( ) |
| **[display](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1afbb6ea14b3c84dcd4b81abfd6f5ce637)**() | [ESMF] serl GUI_Manager.display() |
| **[enableLazyRendering](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a7c16b9e4f125c23d1f25cf54dd49dd19)**() | [ESMF] GUI_Manager.enableLazyRendering( ) |
| **[getComponentAtPos](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1aed80168f4e3e32fec7eb421ac0609689)**(p0) | [ESMF] Component GUI_Manager.getComponentAtPos(Geometry.Vec2 pos) |
| **[getDebugMode](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a736c5a573c3980272a9bf91c22183db0)**() | [ESMF] Number GUI_Manager.getDebugMode() |
| **[getScreenRect](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a0dc166c4dd7e4c48ff771a4bad60504c)**() | [ESMF] Rect GUI_Manager.getScreenRect() |
| **[getDefaultFont](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a56f59c52cf9cb9b4c1993216944a3704)**(p0) | [ESMF] AbstractFont GUI_Manager.getDefaultFont(Number id)<br/>\todo change the resulting type into the actual type |
| **[handleEvent](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1aaa777f7281f01cffea1c586e17189b57)**(p0) | [ESMF] int GUI_Manager.handleEvent(Event) |
| **[setWindow](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a65ae780be6c89731ac8937a5879e4bb9)**(p0) | [ESMF] void GUI_Manager.setWindow(Window) |
| **[isCurrentlyEnabled](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1adc05b225b0ccff76996e9a1efdb5bb33)**(p0) | [ESMF] Bool GUI_Manager.isCurrentlyEnabled(Component \* c) |
| **[isLazyRenderingEnabled](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a60ddf3c1ab5c4943c0c83f2679a608cb)**() | [ESMF] Bool GUI_Manager.isLazyRenderingEnabled( ) |
| **loadImage**(p0 [, p1]) | [ESMF] GUI_Manager.loadImage(  filename[,flags]  ) |
| **[markForRemoval](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a107ec5385bc5a1e8ad9edecf61b13875)**(p0) | [ESMF] self GUI_Manager.markForRemoval(Component \* c) |
| **[registerWindow](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1ab9e4c4996c5275e6a5019aa5895aea00)**(p0) | [ESMF] GUI_Manager.registerWindow(Component \* c) |
| **[setActiveComponent](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a96c579038f1709f7dae6a609140312f7)**(p0) | [ESMF] GUI_Manager.setActiveComponent(Component \* c) |
| **[setDebugMode](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a09eeea3962de1632ad76165c03118ccf)**(p0) | [ESMF] self GUI_Manager.setDebugMode(Number level) |
| **[setDefaultColor](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1add945a7bcead3ba0c95bd2d866dc2dc4)**(p0, p1) | [ESMF] self GUI_Manager.setDefaultColor(Number id,Color4) |
| **[setDefaultFont](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a0502ee6c280a8786e9e4e01f47879fa1)**(p0, p1) | [ESMF] self GUI_Manager.setDefaultFont(Number id,AbstractFont) |
| **[setDefaultShape](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a31c119c1dc4a7681b35762619d05349b)**(p0, p1) | [ESMF] self GUI_Manager.setDefaultShape(Number id,AbstractShape) |
| **[registerMouseCursor](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1ad30be86994b2cee2eb364054eb5e43e5)**(p0, p1, p2, p3) |  |
| **[setGlobalValue](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1adab38781325ddb18372b5451edd959cb)**(p0, p1) | [ESMF] self GUI_Manager.setGlobalValue(Number id,Number) |
| **[unregisterWindow](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a4a93ed963d22032dbc53e8a28e1e4a10)**(p0) | [ESMF] GUI_Manager.unregisterWindow(Component \* c) |
| **[unselectAll](classGUI_1_1GUI%5F%5FManager#classGUI_1_1GUI%5F%5FManager_1a0c1610533cdeceaf29f223ab9340634c)**() | self GUI_Manager.unselectAll() |
| **_createPanelNextRow**(p0) | [ESMF] (internal) Component GUI_Manager._createPanelNextRow( spacing ) |
| **_createPanelNextColumn**(p0) | [ESMF] (internal)  Component GUI_Manager._createPanelNextColumn( spacing ) |
| **_createGridShape**(p0, p1, p2, p3, p4, p5) | [ESMF] Shape GUI_Manager._createGridShape( Color4?  _majorColor,Color4? _minorColor,float _hDistance,float _vDistance,int _hNumMinors,int _vNumMinors ) |
| **_createRectShape**(p0, p1, p2) | [ESMF]  Shape GUI_Manager._createRectShape( Color4?  bgColor,Color4? lineColor,bool blend) |
| **_createRect3dShape**(p0, p1, p2 [, p3]) | [ESMF]  Shape GUI_Manager._createRect3dShape( Color4?  bgColor1,Color4? bgColor2,bool blend[,bool invert=false]) |
| **_createShadowedRectShape**(p0, p1, p2) | [ESMF]  Shape GUI_Manager._createShadowedRectShape( Color4?  _bgColor,Color4? _lineColor,bool blend) |
| **_createOuterRectShadowShape**(p0, p1, p2, p3, p4) | [ESMF]  Shape GUI_Manager._createOuterRectShadowShape( float top,float bottom, float left, float right,,Color4 _color) |
| **_createTriangleSelectorShape**(p0) | [ESMF]  Shape GUI_Manager._createTriangleSelectorShape( Color4 color) |
| **_createRounded3dRectShape**(p0, p1, p2 [, p3 [, p4 [, p5 [, p6]]]]) | [ESMF]  Shape GUI_Manager._createRounded3dRectShape( Color4?  _bgColor,Color4? _lineColor,bool blend,float _roundnessTL=2,float _roundnessTR=2,float _roundnessBL=2,float _roundnessBR=2) |
| **_createSmoothConnectorShape**(p0, p1) | [ESMF]  Shape GUI_Manager._createSmoothConnectorShape( Color4?  c, number lineWidth) |
| **_createTriangleAtCornerShape**(p0, p1) | [ESMF]  Shape GUI_Manager._createTriangleAtCornerShape( Color4?  c, number size) |
| **_createStraightLineShape**(p0, p1) | [ESMF]  Shape GUI_Manager._createStraightLineShape( Color4?  c, number lineWidth) |
| **getNullShape**() | [ESMF] Shape GUI_Manager.getNullShape() |
{: .nohead .nowrap1 }
