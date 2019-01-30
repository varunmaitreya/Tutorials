---
api_location: "Util/IO/DBFSProvider.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Util:namespaceUtil|DBFSProvider:classUtil_1_1DBFSProvider"
category: "Util"
keywords: deferredStatements, deferredFiles, db, getFolderId_stmt, getFileData_stmt, getFileSize_stmt, isFile_stmt, dirFiles_stmt, dirFolders_stmt, mutex, DBHandle, ~DBHandle, getDB, saveFile, readFile, getSize, dir, getFolderId, isFile, makeDir, flush, createFile, updateData, getData, storeStatement, isPendingFile
layout: api
permalink: classUtil_1_1DBFSProvider_1_1DBHandle
show_in_toc: false
sidebar: api_sidebar
subcategory: "IO"
title: "DBHandle"
toc: false
---

| public |
{:.api_label}

## Description



Internal representation of a database connection



## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[DBHandle](#classUtil_1_1DBFSProvider_1_1DBHandle_1a37d5d792199edc55ddd8cf83dc406463)**(sqlite3 * _db) |
|  | |
|  | **[~DBHandle](#classUtil_1_1DBFSProvider_1_1DBHandle_1aec71cc1819b0dd7349b4bbb39f4c5f1c)**() |
|  | |
| sqlite3 * | **[getDB](#classUtil_1_1DBFSProvider_1_1DBHandle_1ae02fa21e43b0680c2a60d201a8ee9fb9)**() const |
|  | |
| bool | **[saveFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a8180a5cc9c2d7e54b86ebb24a7e43346)**(const std::string & folder, const std::string & file, const std::vector< uint8_t > & data, bool overwrite) |
|  | |
| std::vector< uint8_t > | **[readFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a27b038632321f618053cf07941f60c94)**(const std::string & folder, const std::string & file) |
|  | |
| size_t | **[getSize](#classUtil_1_1DBFSProvider_1_1DBHandle_1ae51d85c2a3f7a42ab04dea11737daa68)**(const std::string & folder, const std::string & file) |
|  | |
| bool | **[dir](#classUtil_1_1DBFSProvider_1_1DBHandle_1a6fcd72483c734206731dc7e8b2cbad1a)**(const std::string & folder, const std::string & prefix, std::list< [FileName](classUtil_1_1FileName) > & result, uint8_t flags) |
|  | |
| int | **[getFolderId](#classUtil_1_1DBFSProvider_1_1DBHandle_1adb754f58327996ac388caa85f29f1e77)**(const std::string & folder) |
|  | |
| bool | **[isFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a6efc550e7ec2906c17903662cbef9e8d)**(const std::string & folder, const std::string & file) |
|  | |
| bool | **[makeDir](#classUtil_1_1DBFSProvider_1_1DBHandle_1af4be9b5c884be95075eafe6896ad5cb0)**(const std::string & folder) |
|  | |
| void | **[flush](#classUtil_1_1DBFSProvider_1_1DBHandle_1a6e74568d3976e53da32f9d25f83f58e8)**() |
{: .nohead .nowrap1 .api_section }


## Protected Functions

|
| ------: | ----------------- |
|  | |
| bool | **[createFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1ade120c78a96b6b04496efaa2e24b8aca)**(int folderId, const std::string & file) |
|  | |
| bool | **[updateData](#classUtil_1_1DBFSProvider_1_1DBHandle_1a2073e4b63f208336fa3ebd8ababda58b)**(int fileId, const std::vector< uint8_t > & data) |
|  | |
| std::vector< uint8_t > | **[getData](#classUtil_1_1DBFSProvider_1_1DBHandle_1a1bb7072115b9f0cf9193314224872fd2)**(int fileId) |
|  | |
| void | **[storeStatement](#classUtil_1_1DBFSProvider_1_1DBHandle_1a1b6a60bb5f9490e6cf485af823d2a51a)**(int folderId, const std::string & file, sqlite3_stmt * stmt) |
|  | |
| bool | **[isPendingFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a17c672dc62e8250fa67ccf6369bab13e)**(int intFolderId, const std::string & file) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> DBHandle {#classUtil_1_1DBFSProvider_1_1DBHandle_1a37d5d792199edc55ddd8cf83dc406463}

| public | explicit |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[DBHandle](#classUtil_1_1DBFSProvider_1_1DBHandle_1a37d5d792199edc55ddd8cf83dc406463)**( | sqlite3 * | **_db** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:63`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~DBHandle {#classUtil_1_1DBFSProvider_1_1DBHandle_1aec71cc1819b0dd7349b4bbb39f4c5f1c}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~DBHandle](#classUtil_1_1DBFSProvider_1_1DBHandle_1aec71cc1819b0dd7349b4bbb39f4c5f1c)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:64`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getDB {#classUtil_1_1DBFSProvider_1_1DBHandle_1ae02fa21e43b0680c2a60d201a8ee9fb9}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| sqlite3 * **[getDB](#classUtil_1_1DBFSProvider_1_1DBHandle_1ae02fa21e43b0680c2a60d201a8ee9fb9)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:65`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> saveFile {#classUtil_1_1DBFSProvider_1_1DBHandle_1a8180a5cc9c2d7e54b86ebb24a7e43346}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[saveFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a8180a5cc9c2d7e54b86ebb24a7e43346)**( | const std::string & | **folder**, |
| | const std::string & | **file**, |
| | const std::vector< uint8_t > & | **data**, |
| | bool | **overwrite** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:68`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> readFile {#classUtil_1_1DBFSProvider_1_1DBHandle_1a27b038632321f618053cf07941f60c94}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| std::vector< uint8_t > **[readFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a27b038632321f618053cf07941f60c94)**( | const std::string & | **folder**, |
| | const std::string & | **file** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:69`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getSize {#classUtil_1_1DBFSProvider_1_1DBHandle_1ae51d85c2a3f7a42ab04dea11737daa68}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| size_t **[getSize](#classUtil_1_1DBFSProvider_1_1DBHandle_1ae51d85c2a3f7a42ab04dea11737daa68)**( | const std::string & | **folder**, |
| | const std::string & | **file** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:70`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> dir {#classUtil_1_1DBFSProvider_1_1DBHandle_1a6fcd72483c734206731dc7e8b2cbad1a}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[dir](#classUtil_1_1DBFSProvider_1_1DBHandle_1a6fcd72483c734206731dc7e8b2cbad1a)**( | const std::string & | **folder**, |
| | const std::string & | **prefix**, |
| | std::list< [FileName](classUtil_1_1FileName) > & | **result**, |
| | uint8_t | **flags** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:71`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getFolderId {#classUtil_1_1DBFSProvider_1_1DBHandle_1adb754f58327996ac388caa85f29f1e77}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| int **[getFolderId](#classUtil_1_1DBFSProvider_1_1DBHandle_1adb754f58327996ac388caa85f29f1e77)**( | const std::string & | **folder** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:72`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> isFile {#classUtil_1_1DBFSProvider_1_1DBHandle_1a6efc550e7ec2906c17903662cbef9e8d}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[isFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a6efc550e7ec2906c17903662cbef9e8d)**( | const std::string & | **folder**, |
| | const std::string & | **file** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:73`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> makeDir {#classUtil_1_1DBFSProvider_1_1DBHandle_1af4be9b5c884be95075eafe6896ad5cb0}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[makeDir](#classUtil_1_1DBFSProvider_1_1DBHandle_1af4be9b5c884be95075eafe6896ad5cb0)**( | const std::string & | **folder** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:74`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> flush {#classUtil_1_1DBFSProvider_1_1DBHandle_1a6e74568d3976e53da32f9d25f83f58e8}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[flush](#classUtil_1_1DBFSProvider_1_1DBHandle_1a6e74568d3976e53da32f9d25f83f58e8)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:76`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> createFile {#classUtil_1_1DBFSProvider_1_1DBHandle_1ade120c78a96b6b04496efaa2e24b8aca}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[createFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1ade120c78a96b6b04496efaa2e24b8aca)**( | int | **folderId**, |
| | const std::string & | **file** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:78`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> updateData {#classUtil_1_1DBFSProvider_1_1DBHandle_1a2073e4b63f208336fa3ebd8ababda58b}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[updateData](#classUtil_1_1DBFSProvider_1_1DBHandle_1a2073e4b63f208336fa3ebd8ababda58b)**( | int | **fileId**, |
| | const std::vector< uint8_t > & | **data** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:79`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getData {#classUtil_1_1DBFSProvider_1_1DBHandle_1a1bb7072115b9f0cf9193314224872fd2}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| std::vector< uint8_t > **[getData](#classUtil_1_1DBFSProvider_1_1DBHandle_1a1bb7072115b9f0cf9193314224872fd2)**( | int | **fileId** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:80`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> storeStatement {#classUtil_1_1DBFSProvider_1_1DBHandle_1a1b6a60bb5f9490e6cf485af823d2a51a}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[storeStatement](#classUtil_1_1DBFSProvider_1_1DBHandle_1a1b6a60bb5f9490e6cf485af823d2a51a)**( | int | **folderId**, |
| | const std::string & | **file**, |
| | sqlite3_stmt * | **stmt** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:82`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> isPendingFile {#classUtil_1_1DBFSProvider_1_1DBHandle_1a17c672dc62e8250fa67ccf6369bab13e}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[isPendingFile](#classUtil_1_1DBFSProvider_1_1DBHandle_1a17c672dc62e8250fa67ccf6369bab13e)**( | int | **intFolderId**, |
| | const std::string & | **file** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/IO/DBFSProvider.h:83`</sub>{:style="float: right"}

-------------------------------------------------------------------

