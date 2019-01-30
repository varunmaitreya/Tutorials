---
api_location: "Util/IO/TemporaryDirectory.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Util:namespaceUtil"
category: "Util"
keywords: path, counter, TemporaryDirectory, TemporaryDirectory, TemporaryDirectory, ~TemporaryDirectory, getPath
layout: api
permalink: classUtil_1_1TemporaryDirectory
show_in_toc: true
sidebar: api_sidebar
subcategory: "IO"
title: "TemporaryDirectory"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [Util::ReferenceCounter](classUtil_1_1ReferenceCounter)


## Description

Creation and deletion of temporary directories.

When creating an object of this class, a new directory is created, which can be used to store temporary files. When the object is destroyed, the directory will be deleted together with all files inside.



**Author**: Benjamin Eikel



**Date**: 2011-08-15





## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[TemporaryDirectory](#classUtil_1_1TemporaryDirectory_1a204a6bf82d978ff962a67f5463ce97b2)**(const std::string & fragment) |
|  | |
|  | **[~TemporaryDirectory](#classUtil_1_1TemporaryDirectory_1a19440e71622565f0741ce17939a6c948)**() <br/> Delete the directory and all its contents. |
|  | |
| const [FileName](classUtil_1_1FileName) & | **[getPath](#classUtil_1_1TemporaryDirectory_1a0a4acbad403f9cbffd6de8e0ae459b3f)**() const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> TemporaryDirectory {#classUtil_1_1TemporaryDirectory_1a204a6bf82d978ff962a67f5463ce97b2}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[TemporaryDirectory](#classUtil_1_1TemporaryDirectory_1a204a6bf82d978ff962a67f5463ce97b2)**( | const std::string & | **fragment** ) |
{: .nohead .nowrap1 .api_doc }



Create a new temporary directory. The part will contain the current process identifier, an automatically increasing counter and the given fragment.


#### Parameters
**fragment**
:  String that will be used as part of the path. This must not contain characters that are invalid in file names.







<sub>Defined in `Util/IO/TemporaryDirectory.h:49`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~TemporaryDirectory {#classUtil_1_1TemporaryDirectory_1a19440e71622565f0741ce17939a6c948}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~TemporaryDirectory](#classUtil_1_1TemporaryDirectory_1a19440e71622565f0741ce17939a6c948)**( |  ) |
{: .nohead .nowrap1 .api_doc }

Delete the directory and all its contents.





<sub>Defined in `Util/IO/TemporaryDirectory.h:52`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getPath {#classUtil_1_1TemporaryDirectory_1a0a4acbad403f9cbffd6de8e0ae459b3f}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [FileName](classUtil_1_1FileName) & **[getPath](#classUtil_1_1TemporaryDirectory_1a0a4acbad403f9cbffd6de8e0ae459b3f)**( |  ) const |
{: .nohead .nowrap1 .api_doc }



Retrieve the path to the directory.


#### Returns
Directory location that can be used for temporary files.





<sub>Defined in `Util/IO/TemporaryDirectory.h:59`</sub>{:style="float: right"}

-------------------------------------------------------------------

