---
api_location: "API/E_MinSG/Core/Nodes/E_Node.cpp:73:18"
api_type: type
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "MinSG:escript_namespace_MinSG"
category: "MinSG"
keywords: display, activate, deactivate, isActive, isDestroyed, getParent, hasParent, getRuntimeId, getWorldBB, getBB, hasFixedBB, removeFixedBB, setFixedBB, createInstance, isInstance, getPrototype, _setPrototype, hasMatrix, hasSRT, getMatrix, getSRT, setMatrix, setSRT, getRelTransformationMatrix, getRelTransformationSRT, getWorldTransformationMatrix, getWorldTransformationSRT, getWorldToLocalMatrix, hasTransformation, hasRelTransformationSRT, setRelTransformation, setWorldTransformation, isTransformationObserved, _enableTransformationObserver, _enableNodeAddedObserver, _enableNodeRemovedObserver, getRenderingLayers, setRenderingLayers, testRenderingLayer, removeStates, hasStates, addState, removeState, getStates, moveRel, moveLocal, reset, setRelRotation, setRelRotation_rad, setRelRotation_deg, resetRelTransformation, rotateRel_rad, rotateRel_deg, rotateLocal_rad, rotateLocal_deg, getWorldOrigin, getWorldPosition, setWorldOrigin, setWorldPosition, getRelOrigin, getRelPosition, setRelOrigin, setRelPosition, rotateToWorldDir, setScale, setRelScaling, scale, getScale, getRelScaling, findNodeAttribute, getNodeAttributes, getNodeAttribute, isClosed, isTempNode, isNodeAttributeSet, removeNodeAttributes, setClosed, setTempNode, setNodeAttribute, unsetNodeAttribute, localDirToWorldDir, localDirToRelDir, localPosToWorldPos, localPosToRelPos, relDirToWorldDir, relDirToLocalDir, relPosToWorldPos, relPosToLocalPos, worldDirToLocalDir, worldDirToRelDir, worldPosToLocalPos, worldPosToRelPos, rotateAroundLocalAxis_deg, rotateAroundLocalAxis_rad, rotateAroundRelAxis_deg, rotateAroundRelAxis_rad, rotateAroundWorldAxis_deg, rotateAroundWorldAxis_rad, getMemoryUsage
layout: e_api
permalink: escript_type_MinSG_Node
show_in_toc: true
sidebar: e_api_sidebar
title: "Node"
toc: false
---

## Functions

|
| ------: | ----------------- |
| **[display](classMinSG_1_1Node#classMinSG_1_1Node_1a1d6696558c7ca0da5927d2add5c09b36)**(p0 [, p1]) | [ESMF] self MinSG.Node.display(FrameContext[,Flags\|RenderingParameter]); |
| **[activate](classMinSG_1_1Node#classMinSG_1_1Node_1aa11473d5739ab97dec3202fc9fde2127)**() | [ESMF] self MinSG.Node.activate() |
| **[deactivate](classMinSG_1_1Node#classMinSG_1_1Node_1ac0f3790a68c898a5eec7bd1b610ad320)**() | [ESMF] self MinSG.Node.deactivate() |
| **[isActive](classMinSG_1_1Node#classMinSG_1_1Node_1a64007b44440d0cca48261d2923fa79d7)**() | [ESMF] bool MinSG.Node.isActive() |
| **[isDestroyed](classMinSG_1_1Node#classMinSG_1_1Node_1a75c055feef03c3c3e539ac8a55fb3f86)**() | [ESMF] bool MinSG.Node.isDestroyed() |
| **[getParent](classMinSG_1_1Node#classMinSG_1_1Node_1a081746364785ba2a0d330e939efefa44)**() | [ESMF] MinSG.GoupNode Node.getParent() |
| **[hasParent](classMinSG_1_1Node#classMinSG_1_1Node_1a939c38aa9508d6a60ff93fc867740970)**() | [ESMF] Bool MinSG.Node.hasParent() |
| **getRuntimeId**() | [ESMF] String Node.getRuntimeId() |
| **[getWorldBB](classMinSG_1_1Node#classMinSG_1_1Node_1a084ccb5514833e166e1c7350105fae1a)**() | [ESMF] Box MinSG.Node.getWorldBB() |
| **[getBB](classMinSG_1_1Node#classMinSG_1_1Node_1a3722e65aa3aa5a6ec6bc0ad721a30207)**() | [ESMF] Box MinSG.Node.getBB() |
| **[hasFixedBB](classMinSG_1_1Node#classMinSG_1_1Node_1a6350deff6940144450aa1bf21528eff4)**() | [ESMF] Bool MinSG.Node.hasFixedBB() |
| **[removeFixedBB](classMinSG_1_1Node#classMinSG_1_1Node_1a37f6568c3f746193fd0fd0bc2f3e665b)**() | [ESMF] self MinSG.Node.removeFixedBB(Box) |
| **[setFixedBB](classMinSG_1_1Node#classMinSG_1_1Node_1a2d5909ebdadd0223d90d4bfccf66abd7)**(p0) | [ESMF] self MinSG.Node.setFixedBB(Box) |
| **[createInstance](classMinSG_1_1Node#classMinSG_1_1Node_1aedf75bdfac152abe16438eeb4b4596d2)**(p0) | [ESF] Node MinSG.Node.createInstance(Node prototype) |
| **[isInstance](classMinSG_1_1Node#classMinSG_1_1Node_1aa3bf1b3a748360fa725aa3a27920dd1f)**() | [ESMF] Bool MinSG.Node.isInstance() |
| **[getPrototype](classMinSG_1_1Node#classMinSG_1_1Node_1ae4f8d2a1e70f0dc70ddd7e0020f1738b)**() | [ESMF] Bool MinSG.Node.getPrototype() |
| **[_setPrototype](classMinSG_1_1Node#classMinSG_1_1Node_1aa35f0cea78dc62f8df9631c9e673c3f0)**(p0) | [ESMF] self MinSG.Node._setPrototype( void\|\|MinSG.Node ) |
| **hasMatrix**() | [ESMF] Bool MinSG.Node.hasMatrix() \deprecated |
| **hasSRT**() | [ESMF] Bool MinSG.Node.hasSRT() \deprecated |
| **getMatrix**() | [ESMF] Matrix4x4 MinSG.Node.getMatrix() \deprecated |
| **getSRT**() | [ESMF] SRT MinSG.Node.getSRT() \deprecated |
| **setMatrix**(p0) | [ESMF] self MinSG.Node.setMatrix(Matrix4x4) \deprecated |
| **setSRT**(p0) | [ESMF] self MinSG.Node.setSRT(SRT) \deprecated |
| **[getRelTransformationMatrix](classMinSG_1_1Node#classMinSG_1_1Node_1a9f8dbb6a28f8ce3e698fedab016fe432)**() | [ESMF] Matrix4x4 MinSG.Node.getRelTransformationMatrix() |
| **[getRelTransformationSRT](classMinSG_1_1Node#classMinSG_1_1Node_1a07f072066bba86cdc5d699a87be89cec)**() | [ESMF] SRT MinSG.Node.getRelTransformationSRT() |
| **[getWorldTransformationMatrix](classMinSG_1_1Node#classMinSG_1_1Node_1ab4a54d268c5c11aac53fef5c23d8eb83)**() | [ESMF] Matrix4x4 MinSG.Node.getWorldTransformationMatrix() |
| **[getWorldTransformationSRT](classMinSG_1_1Node#classMinSG_1_1Node_1aa2060a1fdf24665c6d60b7a8593152ab)**() | [ESMF] SRT MinSG.Node.getWorldTransformationSRT() |
| **[getWorldToLocalMatrix](classMinSG_1_1Node#classMinSG_1_1Node_1a8c465a78ec2bb1439757859dfcf5fbb4)**() | [ESMF] Matrix4x4 MinSG.Node.getWorldToLocalMatrix()() |
| **hasTransformation**() | [ESMF] Bool MinSG.Node.hasTransformation() |
| **[hasRelTransformationSRT](classMinSG_1_1Node#classMinSG_1_1Node_1a79c5acb9ef236e76918602823f2576a1)**() | [ESMF] Bool MinSG.Node.hasRelTransformationSRT() |
| **[setRelTransformation](classMinSG_1_1Node#classMinSG_1_1Node_1a847b2fc7ce4691a6f5ddc2e5d1b22e37)**(p0) | [ESMF] self MinSG.Node.setRelTransformation(Matrix4x4\|SRT) |
| **[setWorldTransformation](classMinSG_1_1Node#classMinSG_1_1Node_1a02a90c67aca2ed0041d11ff472d58c90)**(p0) | [ESMF] slef MinSG.Node.setWorldTransformation(SRT) |
| **[isTransformationObserved](classMinSG_1_1Node#classMinSG_1_1Node_1ac50c064ea5a31d0490c816b38a7d3bc1)**() | [ESMF] Bool MinSG.Node.isTransformationObserved(Vec3) |
| **_enableTransformationObserver**() | [ESMF] self MinSG.Node._enableTransformationObserver()<br/>Adds a ScriptedObserver to the node. This observer calls the Node&apos;s script member function<br/>&apos;onNodeTransformed&apos; when a node in the subtree is transformed.<br/>\note Make sure that a member of that name exists before moving a node; an exception is thrown otherwise. |
| **_enableNodeAddedObserver**() | [ESMF] self MinSG.Node._enableNodeAddedObserver()<br/>Adds a ScriptedObserver to the node. This observer calls the Node&apos;s script member function<br/>&apos;onNodeAdded&apos; when a node in the subtree is added.<br/>\note Make sure that a member of that name exists before moving a node; an exception is thrown otherwise. |
| **_enableNodeRemovedObserver**() | [ESMF] self MinSG.Node._enableNodeRemovedObserver()<br/>Adds a ScriptedObserver to the node. This observer calls the Node&apos;s script member function<br/>&apos;onNodeRemoved&apos; when a node in the subtree is added.<br/>\note Make sure that a member of that name exists before moving a node; an exception is thrown otherwise. |
| **[getRenderingLayers](classMinSG_1_1Node#classMinSG_1_1Node_1a70c1dc754b39b15d01d3264caba41afe)**() | [ESMF] Number MinSG.Node.getRenderingLayers()	 |
| **[setRenderingLayers](classMinSG_1_1Node#classMinSG_1_1Node_1a1f6c3690399250ab873ce230b04534a4)**(p0) | [ESMF] thisEObj MinSG.Node.setRenderingLayers(Number) |
| **[testRenderingLayer](classMinSG_1_1Node#classMinSG_1_1Node_1ace899f0773d1a53f9780ba6ee9ebac47)**(p0) | [ESMF] bool MinSG.Node.testRenderingLayer(Number) |
| **[removeStates](classMinSG_1_1Node#classMinSG_1_1Node_1a566a735f97ec6376ea01c7e1ef89e2a9)**() | [ESMF] self MinSG.Node.removeStates() |
| **[hasStates](classMinSG_1_1Node#classMinSG_1_1Node_1a58c5f5341159c82c264dbce724cdba46)**() | [ESMF] bool MinSG.Node.hasStates() |
| **[addState](classMinSG_1_1Node#classMinSG_1_1Node_1a1e9b5c27a322a6c525ba84d6db04bcb2)**(p0) | [ESMF] self MinSG.Node.addState(State) |
| **[removeState](classMinSG_1_1Node#classMinSG_1_1Node_1aa6d716cb1a9170aa003c7939111f6210)**(p0) | [ESMF] self MinSG.Node.removeState(State) |
| **[getStates](classMinSG_1_1Node#classMinSG_1_1Node_1a9bafd7519431040bda42e619adee711c)**() | [ESMF] Array MinSG.Node.getStates() |
| **[moveRel](classMinSG_1_1Node#classMinSG_1_1Node_1a7fc38fcb54175b2921da39ef38465477)**(p0 [, p1 [, p2]]) | [ESMF] self MinSG.Node.moveRel(Vec3 \| (x,y,z)) |
| **[moveLocal](classMinSG_1_1Node#classMinSG_1_1Node_1a3704f364c7d26a5aee9ee3436c81af76)**(p0 [, p1 [, p2]]) | [ESMF] self MinSG.Node.moveLocal(Vec3 \| (x,y,z)) |
| **reset**() | [ESMF] self MinSG.Node.reset() \deprecated |
| **[setRelRotation](classMinSG_1_1Node#classMinSG_1_1Node_1afddc50c71f79ae3ae1dc087b3ed65aef)**(p0, p1) | [ESMF] self MinSG.Node.setRelRotation(Vec3 dir,Vec3 up) |
| **setRelRotation_rad**(p0, p1 [, p2 [, p3]]) | [ESMF] self MinSG.Node.setRelRotation_rad(float angle, (Vec3\|x,y,z)) \deprecated |
| **setRelRotation_deg**(p0, p1 [, p2 [, p3]]) | [ESMF] self MinSG.Node.setRelRotation_deg(float deg, (Vec3\|x,y,z)) \deprecated |
| **[resetRelTransformation](classMinSG_1_1Node#classMinSG_1_1Node_1ad5abb99432208b16edd09047a9b136c0)**() | [ESMF] self MinSG.Node.resetRelTransformation() |
| **rotateRel_rad**(p0, p1 [, p2 [, p3]]) | [ESMF] self MinSG.Node.rotateRel_rad(float angle, (Vec3\|x,y,z)) |
| **rotateRel_deg**(p0, p1 [, p2 [, p3]]) | [ESMF] self MinSG.Node.rotateRel_deg(float deg, (Vec3\|x,y,z)) |
| **rotateLocal_rad**(p0, p1 [, p2 [, p3]]) | [ESMF] self MinSG.Node.rotateLocal_rad(float angle, (Vec3\|x,y,z)) |
| **rotateLocal_deg**(p0, p1 [, p2 [, p3]]) | [ESMF] self MinSG.Node.rotateLocal_deg(float deg, (Vec3\|x,y,z)) |
| **[getWorldOrigin](classMinSG_1_1Node#classMinSG_1_1Node_1a706c8ae72b2ac61f323c3dbc859a7c8d)**() | [ESMF] Vec3 MinSG.Node.getWorldOrigin() |
| **getWorldPosition**() | [ESMF] Vec3 MinSG.Node.getWorldPosition() \deprecated |
| **[setWorldOrigin](classMinSG_1_1Node#classMinSG_1_1Node_1a5dc4f9fb8c59b91dd8e422b30c8548f2)**(p0) | [ESMF] self MinSG.Node.setWorldOrigin(Vec3) |
| **setWorldPosition**(p0) | [ESMF] self MinSG.Node.setWorldPosition(Vec3) \deprecated |
| **[getRelOrigin](classMinSG_1_1Node#classMinSG_1_1Node_1a6d91bc61df566c8381b1473a3fc9745f)**() | [ESMF] Vec3 MinSG.Node.getRelOrigin() |
| **getRelPosition**() | [ESMF] Vec3 MinSG.Node.getRelPosition() |
| **[setRelOrigin](classMinSG_1_1Node#classMinSG_1_1Node_1a30399b62e73814cae20d8ba5c51a1ba2)**(p0) | [ESMF] self MinSG.Node.setRelOrigin(Vec3) |
| **setRelPosition**(p0) | [ESMF] self MinSG.Node.setRelPosition(Vec3) |
| **[rotateToWorldDir](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1aa00b8d06e76e321376702883bf439ebc)**(p0) | [ESMF] self MinSG.Node.rotateToWorldDir(Vec3 dir) |
| **setScale**(p0) | [ESMF] self MinSG.Node.setScale(number) \deprecated |
| **[setRelScaling](classMinSG_1_1Node#classMinSG_1_1Node_1a268f6518b5fd89adec0ee2ce55cde7f7)**(p0) | [ESMF] self MinSG.Node.setRelScaling(number) |
| **[scale](classMinSG_1_1Node#classMinSG_1_1Node_1afdda915e662c22f508533f9cd2822689)**(p0) | [ESMF] self MinSG.Node.scale(number) |
| **getScale**() | [ESMF] number MinSG.Node.getScale()	\deprecated |
| **[getRelScaling](classMinSG_1_1Node#classMinSG_1_1Node_1a7ed81d89afafb79253f257d3859b68a5)**() | [ESMF] number MinSG.Node.getRelScaling() |
| **findNodeAttribute**(p0) | [ESMF] Object MinSG.Node.findNodeAttribute(string key) |
| **getNodeAttributes**() | [ESMF] Map MinSG.Node.getNodeAttributes() |
| **getNodeAttribute**(p0) | [ESMF] Object MinSG.Node.getNodeAttribute(string key) |
| **[isClosed](classMinSG_1_1Node#classMinSG_1_1Node_1a898544e041c8b46e6d8642f673b095ef)**() | [ESMF] Bool MinSG.Node.isClosed() |
| **[isTempNode](classMinSG_1_1Node#classMinSG_1_1Node_1a580901042ef5b54fc4cc7b1e77326a0e)**() | [ESMF] Bool MinSG.Node.isTempNode() |
| **isNodeAttributeSet**(p0) | [ESMF] self MinSG.Node.isNodeAttributeSet(string key) |
| **removeNodeAttributes**() | [ESMF] self MinSG.Node.removeNodeAttributes() |
| **[setClosed](classMinSG_1_1Node#classMinSG_1_1Node_1ab7a5a243d3f9ab56582a00f546ee2983)**(p0) | [ESMF] self MinSG.Node.setClosed(bool active) |
| **[setTempNode](classMinSG_1_1Node#classMinSG_1_1Node_1a710dd9e050c7be422247b3a69ef8378c)**(p0) | [ESMF] self MinSG.Node.setTempNode(bool) |
| **setNodeAttribute**(p0, p1) | [ESMF] self MinSG.Node.setNodeAttribute(string key,value) |
| **unsetNodeAttribute**(p0) | [ESMF] bool MinSG.Node.unsetNodeAttribute(string key) |
| **[localDirToWorldDir](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1afa46a596d9ca12fab02f96472edf1e92)**(p0) | [ESMF] Vec3 MinSG.Node.localDirToWorldDir(Vec3) |
| **[localDirToRelDir](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1a695b6003a5e9344fab194813aea48cd1)**(p0) | [ESMF] Vec3 MinSG.Node.localDirToRelDir(Vec3) |
| **[localPosToWorldPos](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1a97da44fea11e89a079f20e1a93b861ce)**(p0) | [ESMF] Vec3 MinSG.Node.localPosToWorldPos(Vec3) |
| **[localPosToRelPos](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1aa34a09d72dc08bdca05c8053ac2f0a77)**(p0) | [ESMF] Vec3 MinSG.Node.localPosToRelPos(Vec3) |
| **[relDirToWorldDir](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1a7a71118adbe983a5446c1f31f8d06e6e)**(p0) | [ESMF] Vec3 MinSG.Node.relDirToWorldDir(Vec3) |
| **[relDirToLocalDir](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1ad5918ef96fb5416581721cf6d2835f4a)**(p0) | [ESMF] Vec3 MinSG.Node.relDirToLocalDir(Vec3) |
| **[relPosToWorldPos](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1ac32158521f1219af7b5736326699ed93)**(p0) | [ESMF] Vec3 MinSG.Node.relPosToWorldPos(Vec3) |
| **[relPosToLocalPos](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1a47232ff92fcfd2e3c60be9df12dfb0f7)**(p0) | [ESMF] Vec3 MinSG.Node.relPosToLocalPos(Vec3) |
| **[worldDirToLocalDir](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1a09ed5a2f09a3ca21b888f25dbabbba9f)**(p0) | [ESMF] Vec3 MinSG.Node.worldDirToLocalDir(Vec3) |
| **[worldDirToRelDir](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1a03824de63cce1da08a198c10c2171e80)**(p0) | [ESMF] Vec3 MinSG.Node.worldDirToRelDir(Vec3) |
| **[worldPosToLocalPos](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1a00753571c7420dc896a7b22001697afe)**(p0) | [ESMF] Vec3 MinSG.Node.worldPosToLocalPos(Vec3) |
| **[worldPosToRelPos](namespaceMinSG_1_1Transformations#namespaceMinSG_1_1Transformations_1acb59b9947778d194587e13b4f2ac6797)**(p0) | [ESMF] Vec3 MinSG.Node.worldPosToRelPos(Vec3) |
| **rotateAroundLocalAxis_deg**(p0, p1) | [ESMF] self MinSG.Node.rotateAroundLocalAxis_deg(Number,Line3) |
| **rotateAroundLocalAxis_rad**(p0, p1) | [ESMF] self MinSG.Node.rotateAroundLocalAxis_rad(Number,Line3) |
| **rotateAroundRelAxis_deg**(p0, p1) | [ESMF] self MinSG.Node.rotateAroundRelAxis_deg(Number,Line3) |
| **rotateAroundRelAxis_rad**(p0, p1) | [ESMF] self MinSG.Node.rotateAroundRelAxis_rad(Number,Line3) |
| **rotateAroundWorldAxis_deg**(p0, p1) | [ESMF] self MinSG.Node.rotateAroundWorldAxis_deg(Number,Line3) |
| **rotateAroundWorldAxis_rad**(p0, p1) | [ESMF] self MinSG.Node.rotateAroundWorldAxis_rad(Number,Line3) |
| **[getMemoryUsage](classMinSG_1_1Node#classMinSG_1_1Node_1ab1b9d312b3dd5b6a4c55232ada7e26ee)**() | [ESMF] Number MinSG.Node.getMemoryUsage() |
{: .nohead .nowrap1 }
