---
api_location: "MinSG/Ext/Profiling/Logger.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|Profiling:namespaceMinSG_1_1Profiling"
category: "MinSG"
keywords: output, Logger, ~Logger, log
layout: api
permalink: classMinSG_1_1Profiling_1_1Logger
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "Logger"
toc: false
---

| public | abstract |
{:.api_label}

#### Inherited

* [MinSG::Profiling::LoggerJSON](classMinSG_1_1Profiling_1_1LoggerJSON)
* [MinSG::Profiling::LoggerPlainText](classMinSG_1_1Profiling_1_1LoggerPlainText)
* [MinSG::Profiling::LoggerTSV](classMinSG_1_1Profiling_1_1LoggerTSV)
* [MinSG::Profiling::LoggerXML](classMinSG_1_1Profiling_1_1LoggerXML)


## Description



Base class for logging actions. The format of the output that is written to the associated stream is determined by selecting an appropriate subclass.



## Protected Attributes

|
| ------: | ----------------- |
|  | |
| std::ostream & | **[output](#classMinSG_1_1Profiling_1_1Logger_1a54e0da381066743c594ebe9702dd6688)**  |
{: .nohead .nowrap1 .api_section }


## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[Logger](#classMinSG_1_1Profiling_1_1Logger_1ac971bf441cf056ffd7191a783f1c2f55)**(std::ostream & outputStream) |
|  | |
|  | **[~Logger](#classMinSG_1_1Profiling_1_1Logger_1a0142b19b438338596679363a1de7f6f7)**() |
|  | |
| void | **[log](#classMinSG_1_1Profiling_1_1Logger_1a19d5d04d8b41343ee7afddacc88fd164)**(const [Action](namespaceMinSG_1_1Profiling#namespaceMinSG_1_1Profiling_1a2610f94fd11c50fc69d1dd2f977c63d7) & action) <br/> Create formatted output for the given action. |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>variable</small><br/> output {#classMinSG_1_1Profiling_1_1Logger_1a54e0da381066743c594ebe9702dd6688}

| protected |
{:.api_label}

|
| ------: | ----------------- |
|  |
| std::ostream & **[output](#classMinSG_1_1Profiling_1_1Logger_1a54e0da381066743c594ebe9702dd6688)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Profiling/Logger.h:29`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> Logger {#classMinSG_1_1Profiling_1_1Logger_1ac971bf441cf056ffd7191a783f1c2f55}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[Logger](#classMinSG_1_1Profiling_1_1Logger_1ac971bf441cf056ffd7191a783f1c2f55)**( | std::ostream & | **outputStream** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Profiling/Logger.h:31`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~Logger {#classMinSG_1_1Profiling_1_1Logger_1a0142b19b438338596679363a1de7f6f7}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~Logger](#classMinSG_1_1Profiling_1_1Logger_1a0142b19b438338596679363a1de7f6f7)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/Profiling/Logger.h:32`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> log {#classMinSG_1_1Profiling_1_1Logger_1a19d5d04d8b41343ee7afddacc88fd164}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[log](#classMinSG_1_1Profiling_1_1Logger_1a19d5d04d8b41343ee7afddacc88fd164)**( | const [Action](namespaceMinSG_1_1Profiling#namespaceMinSG_1_1Profiling_1a2610f94fd11c50fc69d1dd2f977c63d7) & | **action** ) |
{: .nohead .nowrap1 .api_doc }

Create formatted output for the given action.





<sub>Defined in `MinSG/Ext/Profiling/Logger.h:35`</sub>{:style="float: right"}

-------------------------------------------------------------------

