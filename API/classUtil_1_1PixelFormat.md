---
api_location: "Util/Graphics/PixelFormat.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "Util:namespaceUtil"
category: "Util"
keywords: valueType, byteOffset_r, byteOffset_g, byteOffset_b, byteOffset_a, numComponents, bytesPerPixel, NONE, RGB, RGB_FLOAT, BGR, BGR_FLOAT, RGBA, RGBA_FLOAT, BGRA, BGRA_FLOAT, MONO, MONO_FLOAT, UNKNOWN, PixelFormat, getByteOffset_r, getByteOffset_g, getByteOffset_b, getByteOffset_a, getBytesPerPixel, getNumComponents, getBytesPerComponent, getValueType, isValid
layout: api
permalink: classUtil_1_1PixelFormat
show_in_toc: true
sidebar: api_sidebar
subcategory: "Graphics"
title: "PixelFormat"
toc: false
---

| public |
{:.api_label}

## Description



Representation of the pixel data format.
> **Note**: if a color component (r,g,b or a) is not set, its byteOffset is set to the constant NONE.






## Public Static Attributes

|
| ------: | ----------------- |
|  | |
| const uint8_t | **[NONE](#classUtil_1_1PixelFormat_1a4cdb7deddf942fd796649349d87dbfa4)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[RGB](#classUtil_1_1PixelFormat_1a548cfd20f5c9dc4617e26c3f9e9230e4)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[RGB_FLOAT](#classUtil_1_1PixelFormat_1a88c221b9c18cf516699072e62dc00544)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[BGR](#classUtil_1_1PixelFormat_1a3fdc277afc5f6e6869aa12faae2c19d9)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[BGR_FLOAT](#classUtil_1_1PixelFormat_1ae58457f679ce79a946a555a4ef392863)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[RGBA](#classUtil_1_1PixelFormat_1af8a98b63f0f9b9702279fbd2c9ec1d16)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[RGBA_FLOAT](#classUtil_1_1PixelFormat_1a2e3a4542d517bb2573e9fb88f073d2c5)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[BGRA](#classUtil_1_1PixelFormat_1ab1e85f0c17aea7ad74a275131c362964)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[BGRA_FLOAT](#classUtil_1_1PixelFormat_1ac6030ffbf67a67e54c06573d1b72ea8b)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[MONO](#classUtil_1_1PixelFormat_1af36acb40f7a24a25b5b50c830471474a)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[MONO_FLOAT](#classUtil_1_1PixelFormat_1a03b396c8765981d9af7e955671ae288b)**  |
|  | |
| const [PixelFormat](classUtil_1_1PixelFormat) | **[UNKNOWN](#classUtil_1_1PixelFormat_1afe4ff8bb8c64371a0919002bb4240439)**  |
{: .nohead .nowrap1 .api_section }


## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[PixelFormat](#classUtil_1_1PixelFormat_1ad96fbb1b31eb4c2be33476f7011a5f69)**( [TypeConstant](namespaceUtil#namespaceUtil_1a1a435620d3040a5fff9aa70ec2be94a1)  _valueType, uint8_t _byteOffset_r, uint8_t _byteOffset_g, uint8_t _byteOffset_b, uint8_t _byteOffset_a) |
|  | |
| bool | **[operator==](#classUtil_1_1PixelFormat_1a4bbd2ee005ee07120d19454d4a680f9a)**(const [PixelFormat](classUtil_1_1PixelFormat) & other) const |
|  | |
| bool | **[operator!=](#classUtil_1_1PixelFormat_1a10f9b344840335ffd15c5768827afb02)**(const [PixelFormat](classUtil_1_1PixelFormat) & other) const |
|  | |
| uint8_t | **[getByteOffset_r](#classUtil_1_1PixelFormat_1aece7cb54676fd3445b6f0299db199431)**() const |
|  | |
| uint8_t | **[getByteOffset_g](#classUtil_1_1PixelFormat_1aa30c298b3f5b2a7a9fedaae76a35f747)**() const |
|  | |
| uint8_t | **[getByteOffset_b](#classUtil_1_1PixelFormat_1a077cb0117f6c54f07eabc39a5b8bce96)**() const |
|  | |
| uint8_t | **[getByteOffset_a](#classUtil_1_1PixelFormat_1a95a84793b531412a2136986ba6e8cf65)**() const |
|  | |
| uint16_t | **[getBytesPerPixel](#classUtil_1_1PixelFormat_1afb82f7dae3fac59ef0adbcf4f03b805c)**() const |
|  | |
| uint8_t | **[getNumComponents](#classUtil_1_1PixelFormat_1a504d0e7b7438e042254cf85bdf36de8a)**() const |
|  | |
| uint8_t | **[getBytesPerComponent](#classUtil_1_1PixelFormat_1a09cdc5b6342a9404a84c557956c531b9)**() const |
|  | |
| [TypeConstant](namespaceUtil#namespaceUtil_1a1a435620d3040a5fff9aa70ec2be94a1) | **[getValueType](#classUtil_1_1PixelFormat_1a21b01bfc6b9fd548c87e88d991ba6d8a)**() const |
|  | |
| bool | **[isValid](#classUtil_1_1PixelFormat_1a7b71c060ad86d6367fe2ef12cb3276be)**() const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>variable</small><br/> NONE {#classUtil_1_1PixelFormat_1a4cdb7deddf942fd796649349d87dbfa4}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const uint8_t **[NONE](#classUtil_1_1PixelFormat_1a4cdb7deddf942fd796649349d87dbfa4)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:30`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> RGB {#classUtil_1_1PixelFormat_1a548cfd20f5c9dc4617e26c3f9e9230e4}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[RGB](#classUtil_1_1PixelFormat_1a548cfd20f5c9dc4617e26c3f9e9230e4)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:57`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> RGB_FLOAT {#classUtil_1_1PixelFormat_1a88c221b9c18cf516699072e62dc00544}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[RGB_FLOAT](#classUtil_1_1PixelFormat_1a88c221b9c18cf516699072e62dc00544)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:58`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> BGR {#classUtil_1_1PixelFormat_1a3fdc277afc5f6e6869aa12faae2c19d9}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[BGR](#classUtil_1_1PixelFormat_1a3fdc277afc5f6e6869aa12faae2c19d9)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:59`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> BGR_FLOAT {#classUtil_1_1PixelFormat_1ae58457f679ce79a946a555a4ef392863}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[BGR_FLOAT](#classUtil_1_1PixelFormat_1ae58457f679ce79a946a555a4ef392863)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:60`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> RGBA {#classUtil_1_1PixelFormat_1af8a98b63f0f9b9702279fbd2c9ec1d16}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[RGBA](#classUtil_1_1PixelFormat_1af8a98b63f0f9b9702279fbd2c9ec1d16)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:61`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> RGBA_FLOAT {#classUtil_1_1PixelFormat_1a2e3a4542d517bb2573e9fb88f073d2c5}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[RGBA_FLOAT](#classUtil_1_1PixelFormat_1a2e3a4542d517bb2573e9fb88f073d2c5)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:62`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> BGRA {#classUtil_1_1PixelFormat_1ab1e85f0c17aea7ad74a275131c362964}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[BGRA](#classUtil_1_1PixelFormat_1ab1e85f0c17aea7ad74a275131c362964)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:63`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> BGRA_FLOAT {#classUtil_1_1PixelFormat_1ac6030ffbf67a67e54c06573d1b72ea8b}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[BGRA_FLOAT](#classUtil_1_1PixelFormat_1ac6030ffbf67a67e54c06573d1b72ea8b)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:64`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> MONO {#classUtil_1_1PixelFormat_1af36acb40f7a24a25b5b50c830471474a}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[MONO](#classUtil_1_1PixelFormat_1af36acb40f7a24a25b5b50c830471474a)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:65`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> MONO_FLOAT {#classUtil_1_1PixelFormat_1a03b396c8765981d9af7e955671ae288b}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[MONO_FLOAT](#classUtil_1_1PixelFormat_1a03b396c8765981d9af7e955671ae288b)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:66`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> UNKNOWN {#classUtil_1_1PixelFormat_1afe4ff8bb8c64371a0919002bb4240439}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const [PixelFormat](classUtil_1_1PixelFormat) **[UNKNOWN](#classUtil_1_1PixelFormat_1afe4ff8bb8c64371a0919002bb4240439)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:67`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> PixelFormat {#classUtil_1_1PixelFormat_1ad96fbb1b31eb4c2be33476f7011a5f69}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[PixelFormat](#classUtil_1_1PixelFormat_1ad96fbb1b31eb4c2be33476f7011a5f69)**( |  [TypeConstant](namespaceUtil#namespaceUtil_1a1a435620d3040a5fff9aa70ec2be94a1)  | **_valueType**, |
| | uint8_t | **_byteOffset_r**, |
| | uint8_t | **_byteOffset_g**, |
| | uint8_t | **_byteOffset_b**, |
| | uint8_t | **_byteOffset_a** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:32`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> operator== {#classUtil_1_1PixelFormat_1a4bbd2ee005ee07120d19454d4a680f9a}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[operator==](#classUtil_1_1PixelFormat_1a4bbd2ee005ee07120d19454d4a680f9a)**( | const [PixelFormat](classUtil_1_1PixelFormat) & | **other** ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:37`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> operator!= {#classUtil_1_1PixelFormat_1a10f9b344840335ffd15c5768827afb02}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[operator!=](#classUtil_1_1PixelFormat_1a10f9b344840335ffd15c5768827afb02)**( | const [PixelFormat](classUtil_1_1PixelFormat) & | **other** ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:41`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getByteOffset_r {#classUtil_1_1PixelFormat_1aece7cb54676fd3445b6f0299db199431}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint8_t **[getByteOffset_r](#classUtil_1_1PixelFormat_1aece7cb54676fd3445b6f0299db199431)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:45`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getByteOffset_g {#classUtil_1_1PixelFormat_1aa30c298b3f5b2a7a9fedaae76a35f747}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint8_t **[getByteOffset_g](#classUtil_1_1PixelFormat_1aa30c298b3f5b2a7a9fedaae76a35f747)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:46`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getByteOffset_b {#classUtil_1_1PixelFormat_1a077cb0117f6c54f07eabc39a5b8bce96}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint8_t **[getByteOffset_b](#classUtil_1_1PixelFormat_1a077cb0117f6c54f07eabc39a5b8bce96)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:47`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getByteOffset_a {#classUtil_1_1PixelFormat_1a95a84793b531412a2136986ba6e8cf65}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint8_t **[getByteOffset_a](#classUtil_1_1PixelFormat_1a95a84793b531412a2136986ba6e8cf65)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:48`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getBytesPerPixel {#classUtil_1_1PixelFormat_1afb82f7dae3fac59ef0adbcf4f03b805c}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint16_t **[getBytesPerPixel](#classUtil_1_1PixelFormat_1afb82f7dae3fac59ef0adbcf4f03b805c)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:49`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getNumComponents {#classUtil_1_1PixelFormat_1a504d0e7b7438e042254cf85bdf36de8a}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint8_t **[getNumComponents](#classUtil_1_1PixelFormat_1a504d0e7b7438e042254cf85bdf36de8a)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:50`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getBytesPerComponent {#classUtil_1_1PixelFormat_1a09cdc5b6342a9404a84c557956c531b9}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint8_t **[getBytesPerComponent](#classUtil_1_1PixelFormat_1a09cdc5b6342a9404a84c557956c531b9)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:51`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getValueType {#classUtil_1_1PixelFormat_1a21b01bfc6b9fd548c87e88d991ba6d8a}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [TypeConstant](namespaceUtil#namespaceUtil_1a1a435620d3040a5fff9aa70ec2be94a1) **[getValueType](#classUtil_1_1PixelFormat_1a21b01bfc6b9fd548c87e88d991ba6d8a)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:52`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> isValid {#classUtil_1_1PixelFormat_1a7b71c060ad86d6367fe2ef12cb3276be}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[isValid](#classUtil_1_1PixelFormat_1a7b71c060ad86d6367fe2ef12cb3276be)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `Util/Graphics/PixelFormat.h:53`</sub>{:style="float: right"}

-------------------------------------------------------------------

