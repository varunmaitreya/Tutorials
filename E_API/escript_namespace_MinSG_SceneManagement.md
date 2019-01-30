---
api_location: "API/E_MinSG/SceneManagement/E_SceneManagement.cpp:40:23"
api_type: namespace
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: "MinSG:escript_namespace_MinSG"
category: "MinSG"
keywords: createImportContext, loadCOLLADA, loadMinSGFile, loadMinSGString, saveCOLLADA, saveMeshesInSubtreeAsPLY, saveMeshesInSubtreeAsMMF, saveMinSGFile, saveMinSGString, IMPORT_OPTION_NONE, IMPORT_OPTION_REUSE_EXISTING_STATES, IMPORT_OPTION_DAE_INVERT_TRANSPARENCY, IMPORT_OPTION_USE_TEXTURE_REGISTRY, IMPORT_OPTION_USE_MESH_HASHING_REGISTRY, IMPORT_OPTION_USE_MESH_REGISTRY
layout: e_api
order: 1
permalink: escript_namespace_MinSG_SceneManagement
show_in_toc: true
sidebar: e_api_sidebar
subcategory: "SceneManagement"
title: "SceneManagement"
toc: false
---

## Types

|
| ------- | ----------------- |
| type | [ImportContext](escript_type_MinSG_SceneManagement_ImportContext) |
| type | [SceneManager](escript_type_MinSG_SceneManagement_SceneManager) |
{: .nohead }

## Attributes

|
| ------: | ----------------- |
| **[IMPORT_OPTION_NONE](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a75177bee2edd7cb6c8dca72b4c1c8e47)** | |
| **[IMPORT_OPTION_REUSE_EXISTING_STATES](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a1f873f83ca3d2dd69477a88c324f9d54)** | |
| **[IMPORT_OPTION_DAE_INVERT_TRANSPARENCY](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1abb314e6851c58d54511b47dbb4ba6d8b)** | |
| **[IMPORT_OPTION_USE_TEXTURE_REGISTRY](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a790e00c05bc32d70d86c1ec3a45678ff)** | |
| **[IMPORT_OPTION_USE_MESH_HASHING_REGISTRY](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a943df254a845424c80e05089a7ab3828)** | |
| **[IMPORT_OPTION_USE_MESH_REGISTRY](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a3bf5f3d04e635ef35be5c1b5df8bcf15)** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **[createImportContext](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1ae978c133b0deb5627da01e27a1d70591)**(p0 [, p1]) | [ESMF] ImportContext MinSG.SceneManagement.createImportContext( SceneManager, options = 0) |
| **[loadCOLLADA](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1ad6b8b2b26f9dc0dd75f9cd0506b6769d)**(p0, p1 [, p2]) | [ESMF] GroupNode sceneManager.loadCOLLADA( importContext,filename \|\| SceneManager, filename, [importOptions]) |
| **[loadMinSGFile](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a962a0e5f83d5b324853faf34f857304a)**(p0, p1 [, p2]) | [ESMF] Array\|false MinSG.SceneManagement.loadMinSGFile( importContext,filename \|\| SceneManager,filename, [importOptions] ) |
| **loadMinSGString**(p0, p1) | [ESMF] Array\|false MinSG.SceneManagement.loadMinSGString(ImportContext, String) |
| **saveCOLLADA**(p0, p1) | [ESF] bool sceneManager.saveCOLLADA(filename, root) |
| **[saveMeshesInSubtreeAsPLY](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a8ccbc2af58576a8520448f3851ab36f3)**(p0, p1 [, p2]) | [ESMF] void MinSG.SceneManagement.saveMeshesInSubtreeAsPLY(rootNode, dirName [,saveRegisteredNodes=false]) |
| **[saveMeshesInSubtreeAsMMF](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a07471ff034b048f9d8d7b4c17c0505bf)**(p0, p1 [, p2]) | [ESMF] void MinSG.SceneManagement.saveMeshesInSubtreeAsMMF(rootNode, dirName [,saveRegisteredNodes=false]) |
| **[saveMinSGFile](namespaceMinSG_1_1SceneManagement#namespaceMinSG_1_1SceneManagement_1a9e86b99f5e0606d3e7f83ad64286cf7a)**(p0, p1, p2) | [ESF] void MinSG.SceneManagement.saveMinSGFile(sceneManager, filename, Array nodes)  |
| **saveMinSGString**(p0, p1) | [ESF] String\|false MinSG.SceneManagement.saveMinSGString(sceneManager,Array nodes)  |
{: .nohead .nowrap1 }
