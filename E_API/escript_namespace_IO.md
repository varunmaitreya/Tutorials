---
api_location: "API/EScript/E_Libs/IOLib.cpp:31:14"
api_type: namespace
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: ""
category: "EScript"
keywords: loadTextFile, saveTextFile, dir, condensePath, isDir, isFile, fileMTime, fileSize, dirname, fileGetContents, filePutContents, DIR_FILES, DIR_DIRECTORIES, DIR_BOTH, DIR_RECURSIVE
layout: e_api
order: 0
permalink: escript_namespace_IO
show_in_toc: true
sidebar: e_api_sidebar
title: "IO"
toc: false
---

## Attributes

|
| ------: | ----------------- |
| **fileGetContents** | |
| **filePutContents** | |
| **DIR_FILES** | |
| **DIR_DIRECTORIES** | |
| **DIR_BOTH** | |
| **DIR_RECURSIVE** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **loadTextFile**(p0 [, p1]) | [ESF] string loadTextFile(string filename,[format]) |
| **saveTextFile**(p0, p1) | \deprecated alias<br/>[ESF] void saveTextFile(string filename,string) |
| **dir**(p0 [, p1]) | \deprecated alias<br/>[ESF] array dir(string dirname[,int flags]) |
| **[condensePath](namespaceEScript_1_1IO#namespaceEScript_1_1IO_1a0aa0709863844883c0ea193438ec2311)**(p0) | [ESF] string condensePath(string path) |
| **isDir**(p0) | [ESF] bool isDir(string dirname) |
| **isFile**(p0) | [ESF] bool isFile(string filename) |
| **fileMTime**(p0) | [ESF] int fileMTime(string filename) |
| **fileSize**(p0) | [ESF] int fileSize(string filename) |
| **[dirname](namespaceEScript_1_1IO#namespaceEScript_1_1IO_1a606333311cac77ff91c0bcf7959dae31)**(p0) | [ESF] string dirname(string path) |
{: .nohead .nowrap1 }
