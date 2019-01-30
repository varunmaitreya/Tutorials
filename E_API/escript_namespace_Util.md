---
api_location: "API/E_Util/ELibUtil.cpp:162:7"
api_type: namespace
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: ""
category: "Util"
keywords: copyFile, createDir, removeFile, dir, fileSize, flush, generateNewRandFilename, isFile, isDir, loadFile, openFile, saveFile, disableInfo, enableInfo, info, loadBitmap, saveBitmap, toFormattedString, outputProcessMemory, getResidentSetMemorySize, getVirtualMemorySize, getAllocatedMemorySize, getCPUUsage, createTimeStamp, sleep, encodeString_base64, decodeString_base64, getLibVersionStrings, registerLibVersionString, getNumBytes, readBinaryNumberFromString, readBinaryNumberFromString_LittleEndian, readBinaryNumberFromString_BigEndian, readBinaryNumberFromString_LittleEndian, readBinaryNumberFromString_BigEndian, writeBinaryNumberToString, writeBinaryNumberToString_LittleEndian, writeBinaryNumberToString_BigEndian, writeBinaryNumberToString_LittleEndian, writeBinaryNumberToString_BigEndian, loadELibrary, convertBitmap, _mulScalar, blendTogether, combineInterleaved, data, getCost, DIR_FILES, DIR_DIRECTORIES, DIR_RECURSIVE, DIR_HIDDEN_FILES
layout: e_api
order: 0
permalink: escript_namespace_Util
show_in_toc: true
sidebar: e_api_sidebar
title: "Util"
toc: false
---

## Namespaces

|
| ------- | ----------------- |
| namespace | [TypeConstant](escript_namespace_Util_TypeConstant) |
| namespace | [Network](escript_namespace_Util_Network) |
| namespace | [UI](escript_namespace_Util_UI) |
{: .nohead }

## Types

|
| ------- | ----------------- |
| type | [DestructionMonitor](escript_type_Util_DestructionMonitor) |
| type | [FileLocator](escript_type_Util_FileLocator) |
| type | [IOStream](escript_type_Util_IOStream) |
| type | [Bitmap](escript_type_Util_Bitmap) |
| type | [PixelAccessor](escript_type_Util_PixelAccessor) |
| type | [Color4ub](escript_type_Util_Color4ub) |
| type | [Color4f](escript_type_Util_Color4f) |
| type | [TemporaryDirectory](escript_type_Util_TemporaryDirectory) |
| type | [UpdatableHeap](escript_type_Util_UpdatableHeap) |
| type | [ProgressIndicator](escript_type_Util_ProgressIndicator) |
| type | [FileName](escript_type_Util_FileName) |
| type | [Timer](escript_type_Util_Timer) |
| type | [MicroXMLReader](escript_type_Util_MicroXMLReader) |
{: .nohead }

## Attributes

|
| ------: | ----------------- |
| **[DIR_FILES](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1abb5a8f7f1f375580589f1f03a9321c19)** | |
| **[DIR_DIRECTORIES](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1aeaabfc1f5270d39f29481504cb691a2d)** | |
| **[DIR_RECURSIVE](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a1ae166d0338358052644fe09efbc690b)** | |
| **[DIR_HIDDEN_FILES](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a2ba8f93b38d85fa1a92f14cf93d3d0b2)** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **[copyFile](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a8c6dec0ab484185946254fe6d54f30d5)**(p0, p1) | [ESF] Bool Util.copyFile(String, String) |
| **[createDir](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a059294dd4add566cb7550e25bdc5b75b)**(p0) | [ESF] Bool Util.createDir(String) |
| **removeFile**(p0 [, p1]) | [ESF] Bool Util.removeFile(String, [recursive = false]) |
| **[dir](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1ab607fcb1863926980886dcacda3dfaf9)**(p0 [, p1]) | [ESF] false\|Array Util.dir(path, [flags=Util.DIR_FILES] ); |
| **[fileSize](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a2cac4dc19ff0255fbe9f3b7e6f44d07c)**(p0) | [ESF] number Util.fileSize( path  ); |
| **[flush](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a25a74000aa80bb8736b31ec09da155bb)**(p0) | [ESF] Void Util.flush(String fileSystem) |
| **[generateNewRandFilename](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a63731b289d2c36d0c7c09e292da7e7d8)**(p0, p1, p2, p3) | [ESF] String generateNewRandFilename (dir, prefix, postfix, length) |
| **[isFile](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1ae8366cede6aca700a2bdf9b2a0179258)**(p0) | [ESF] bool Util.isFile( path  ); |
| **[isDir](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1a18a91e3941039ac63d11bbe1b6186efc)**(p0) | [ESF] bool Util.isDir( path  ); |
| **loadFile**(p0) | [ESF] string\|false Util.loadFile( path ); |
| **openFile**(p0) | [ESF] IOStream\|void Util.openFile( path ); |
| **[saveFile](structUtil_1_1FileUtils#structUtil_1_1FileUtils_1ad2bbd827e5ecf3c860cff72caa7a1a1e)**(p0, p1 [, p2]) | [ESF] bool Util.saveFile( path , string [,bool overwrite=true] ); |
| **[disableInfo](namespaceUtil#namespaceUtil_1ae3def034625239e62eb1993577f45058)**() | [ESF] void disableInfo() |
| **[enableInfo](namespaceUtil#namespaceUtil_1aa5368304757e0c6417ad51788d6d27bc)**() | [ESF] void enableInfo() |
| **[info](namespaceUtil#namespaceUtil_1a538b5e26779c3cf0a1466e4b4396e465)**([p0]) | [ESF] void info( infoOutput\* ) |
| **[loadBitmap](namespaceUtil_1_1Serialization#namespaceUtil_1_1Serialization_1ae36b6c8ef26854ef36806b63fd591c0e)**(p0) | [ESF] Bitmap Util.loadBitmap(String) |
| **[saveBitmap](namespaceUtil_1_1Serialization#namespaceUtil_1_1Serialization_1aebcb52198ae4dce2c008a781d76e5a97)**(p0, p1) | [ESF] Void Util.saveBitmap(Bitmap, String) |
| **[toFormattedString](namespaceUtil_1_1StringUtils#namespaceUtil_1_1StringUtils_1a9f9bedc3923aae67e01a1eb8f68acfff)**(p0) | [ESF] |
| **[outputProcessMemory](namespaceUtil_1_1Utils#namespaceUtil_1_1Utils_1ae4cea090b668f402449bde3cf1f53523)**() | [ESF] |
| **[getResidentSetMemorySize](namespaceUtil_1_1Utils#namespaceUtil_1_1Utils_1a13db5a1939312cf3e3d1b0939e54c144)**() | [ESF] Number Util.getResidentSetMemorySize() |
| **[getVirtualMemorySize](namespaceUtil_1_1Utils#namespaceUtil_1_1Utils_1aebc9a7c07e573a6fab08a89894ab8cc0)**() | [ESF] Number Util.getVirtualMemorySize() |
| **[getAllocatedMemorySize](namespaceUtil_1_1Utils#namespaceUtil_1_1Utils_1aede7b47acc414680df30fab44c824006)**() | [ESF] Number Util.getAllocatedMemorySize() |
| **[getCPUUsage](namespaceUtil_1_1Utils#namespaceUtil_1_1Utils_1abe0ece3be5f85e90420843308edc29e5)**(p0) | [ESF] Number Util.getCPUUsage(Number) |
| **[createTimeStamp](namespaceUtil_1_1Utils#namespaceUtil_1_1Utils_1a66fab9e9d5c43ab09ea72c09a236983d)**() | [ESF] String Util.createTimeStamp() |
| **[sleep](namespaceUtil_1_1Utils#namespaceUtil_1_1Utils_1affd7a152f0e85eb281314a08f9573b02)**(p0) | [ESF] void Util.sleep(ms) |
| **encodeString_base64**(p0) | [ESF] string Util.encodeString_base64(string) |
| **decodeString_base64**(p0) | [ESF] string Util.decodeString_base64(string) |
| **[getLibVersionStrings](namespaceUtil_1_1LibRegistry#namespaceUtil_1_1LibRegistry_1a930ce1eb684b943f7de2f7effc897660)**() | Map Util.getLibVersionStrings() |
| **[registerLibVersionString](namespaceUtil_1_1LibRegistry#namespaceUtil_1_1LibRegistry_1a1c80d6fe8e9a931813969c8fb2cdf252)**(p0, p1) | [ESF] void Util.registerLibVersionString(lib,versionString) |
| **[getNumBytes](namespaceUtil#namespaceUtil_1aceab2b42afb19e6e17369546b021df66)**(p0) | [ESF] Number Util.getNumBytes(Util.TypeConstant) |
| **readBinaryNumberFromString**(p0, p1, p2) | Number Util.readBinaryNumberFromString(type,string,byteIndex) |
| **readBinaryNumberFromString_LittleEndian**(p0, p1, p2) | Number Util.readBinaryNumberFromString_LittleEndian(type,string,byteIndex) |
| **readBinaryNumberFromString_BigEndian**(p0, p1, p2) | Number Util.readBinaryNumberFromString_BigEndian(type,string,byteIndex) |
| **readBinaryNumberFromString_LittleEndian**(p0, p1, p2) | Number Util.readBinaryNumberFromString_LittleEndian(type,string,byteIndex) |
| **readBinaryNumberFromString_BigEndian**(p0, p1, p2) | Number Util.readBinaryNumberFromString_BigEndian(type,string,byteIndex) |
| **writeBinaryNumberToString**(p0, p1, p2, p3) | Number Util.writeBinaryNumberToString(type,string,byteIndex, value) |
| **writeBinaryNumberToString_LittleEndian**(p0, p1, p2, p3) | String Util.writeBinaryNumberToString_LittleEndian(type,string,byteIndex, value) |
| **writeBinaryNumberToString_BigEndian**(p0, p1, p2, p3) | String Util.writeBinaryNumberToString_BigEndian(type,string,byteIndex, value) |
| **writeBinaryNumberToString_LittleEndian**(p0, p1, p2, p3) | String Util.writeBinaryNumberToString_LittleEndian(type,string,byteIndex, value) |
| **writeBinaryNumberToString_BigEndian**(p0, p1, p2, p3) | String Util.writeBinaryNumberToString_BigEndian(type,string,byteIndex, value) |
| **loadELibrary**(p0 [, p1]) | Bool Util.loadELibrary(filename, [Namespace]) |
| **[convertBitmap](namespaceUtil_1_1BitmapUtils#namespaceUtil_1_1BitmapUtils_1acd03bd4a8dcfb58dfdc955280ee9fc87)**(p0, p1) | BitmapUtil.convertBitmap(Bitmap source,PixelFormat format) |
| **_mulScalar**(p0, p1) | void BitmapUtil._mulScalar(Bitmap source,value) |
| **[blendTogether](namespaceUtil_1_1BitmapUtils#namespaceUtil_1_1BitmapUtils_1a2f27c4b75874f86b55b849df85c79662)**(p0, p1) | Bitmap BitmapUtil.blendTogether(PixelFormat,Array of Bitmaps) |
| **[combineInterleaved](namespaceUtil_1_1BitmapUtils#namespaceUtil_1_1BitmapUtils_1abd3b33c28c6befe137d621cb2509f49a)**(p0, p1) | Bitmap BitmapUtil.combineInterleaved(PixelFormat,Array of Bitmaps) |
| **[data](classUtil_1_1UpdatableHeap_1_1UpdatableHeapElement#classUtil_1_1UpdatableHeap_1_1UpdatableHeapElement_1a57ed17c0287226528652343e97120abc)**() | [ESMF] Object UpdatableHeapElement.data() |
| **[getCost](classUtil_1_1UpdatableHeap_1_1UpdatableHeapElement#classUtil_1_1UpdatableHeap_1_1UpdatableHeapElement_1a66b003eb17b73004094b99b5f47fb5fd)**() | [ESMF] Object UpdatableHeapElement.getCost() |
{: .nohead .nowrap1 }
