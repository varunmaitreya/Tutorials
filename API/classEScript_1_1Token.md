---
api_location: "EScript/EScript/Compiler/Token.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "EScript:namespaceEScript"
category: "EScript"
keywords: TYPE_ID, tokenCount, typeId, line, startingPos, getTypeId, isA, isA, cast, cast, Token, ~Token, toString, setLine, getLine, clone, getType, setStaringPos, getStartingPos
layout: api
permalink: classEScript_1_1Token
show_in_toc: false
sidebar: api_sidebar
title: "Token"
toc: false
---

| public |
{:.api_label}

#### Inherits

* [EScript::EReferenceCounter](classEScript_1_1EReferenceCounter)


#### Inherited

* [EScript::TColon](structEScript_1_1TColon)
* [EScript::TControl](classEScript_1_1TControl)
* [EScript::TEndBlock](structEScript_1_1TEndBlock)
* [EScript::TEndCommand](structEScript_1_1TEndCommand)
* [EScript::TEndMap](structEScript_1_1TEndMap)
* [EScript::TEndScript](structEScript_1_1TEndScript)
* [EScript::TIdentifier](classEScript_1_1TIdentifier)
* [EScript::TMapDelimiter](structEScript_1_1TMapDelimiter)
* [EScript::TOperator](structEScript_1_1TOperator)
* [EScript::TStartBlock](structEScript_1_1TStartBlock)
* [EScript::TStartMap](structEScript_1_1TStartMap)
* [EScript::TValueBool](structEScript_1_1TValueBool)
* [EScript::TValueIdentifier](structEScript_1_1TValueIdentifier)
* [EScript::TValueNumber](structEScript_1_1TValueNumber)
* [EScript::TValueString](structEScript_1_1TValueString)
* [EScript::TValueVoid](structEScript_1_1TValueVoid)


## Description

[ [Token](classEScript_1_1Token) ]



## Public Static Attributes

|
| ------: | ----------------- |
|  | |
| const uint32_t | **[TYPE_ID](#classEScript_1_1Token_1a3a34116c306e2468fe14ec262aeb8c39)**  |
|  | |
| int | **[tokenCount](#classEScript_1_1Token_1a0223f606e6c76037e16a9787c2f3b227)**  |
{: .nohead .nowrap1 .api_section }


## Public Attributes

|
| ------: | ----------------- |
|  | |
| const uint32_t | **[typeId](#classEScript_1_1Token_1a25fc6a4a1922f1f6b31dbe8a0493dcb4)**  |
{: .nohead .nowrap1 .api_section }


## Public Static Functions

|
| ------: | ----------------- |
|  | |
| uint32_t | **[getTypeId](#classEScript_1_1Token_1a86b01e3d9f2c0a4c048164c70ff4deb4)**() |
| template< class TokenType_t  >  | |
| bool | **[isA](#classEScript_1_1Token_1aa63d0e3e2b5ae4c0109765b5eae68c0d)**( [Token](classEScript_1_1Token) * t) |
| template< class TokenType_t  >  | |
| bool | **[isA](#classEScript_1_1Token_1a12bcc8a9c58cc42e083d65caa7e00c4b)**(const [_CountedRef](classEScript_1_1%5F%5FCountedRef) < [Token](classEScript_1_1Token) > & t) |
| template< class TokenType_t  >  | |
| TokenType_t * | **[cast](#classEScript_1_1Token_1abb88a0d9551e61342514e94d80cba9fa)**(const [_CountedRef](classEScript_1_1%5F%5FCountedRef) < [Token](classEScript_1_1Token) > & t) |
| template< class TokenType_t  >  | |
| TokenType_t * | **[cast](#classEScript_1_1Token_1a7dec57d65fa36988c92f9540c75d8734)**( [Token](classEScript_1_1Token) * t) |
{: .nohead .nowrap1 .api_section }


## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[Token](#classEScript_1_1Token_1a1e51ed8f7f6b19a8815c1e51815a2770)**(const uint32_t _type) |
|  | |
|  | **[~Token](#classEScript_1_1Token_1a5ab9c6c7d80928fb058704683acd7e29)**() |
|  | |
| std::string | **[toString](#classEScript_1_1Token_1ad7c5253ea61eeb9648c4510c3c576e85)**() const |
|  | |
| void | **[setLine](#classEScript_1_1Token_1af9c1c50fcc02c234e2e7fc1df0f64069)**(int _line) |
|  | |
| int | **[getLine](#classEScript_1_1Token_1a366759fd78ed8d7a95d0c506743867bb)**() const |
|  | |
| [Token](classEScript_1_1Token) * | **[clone](#classEScript_1_1Token_1aa3b44dc41c649b53dc231fb7e774f4c4)**() const |
|  | |
| uint32_t | **[getType](#classEScript_1_1Token_1a97732e81509e034fc5ddf3b872fb6728)**() const |
|  | |
| void | **[setStaringPos](#classEScript_1_1Token_1aeec379e2eeaab27768da0149ecdd8906)**(size_t p) |
|  | |
| size_t | **[getStartingPos](#classEScript_1_1Token_1a6eeea64ec0068036beefd5dbebbfa8d6)**() const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>variable</small><br/> TYPE_ID {#classEScript_1_1Token_1a3a34116c306e2468fe14ec262aeb8c39}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const uint32_t **[TYPE_ID](#classEScript_1_1Token_1a3a34116c306e2468fe14ec262aeb8c39)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:28`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> tokenCount {#classEScript_1_1Token_1a0223f606e6c76037e16a9787c2f3b227}

| public | static |
{:.api_label}

|
| ------: | ----------------- |
|  |
| int **[tokenCount](#classEScript_1_1Token_1a0223f606e6c76037e16a9787c2f3b227)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:49`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>variable</small><br/> typeId {#classEScript_1_1Token_1a25fc6a4a1922f1f6b31dbe8a0493dcb4}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| const uint32_t **[typeId](#classEScript_1_1Token_1a25fc6a4a1922f1f6b31dbe8a0493dcb4)**  |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:63`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getTypeId {#classEScript_1_1Token_1a86b01e3d9f2c0a4c048164c70ff4deb4}

| public | static | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint32_t **[getTypeId](#classEScript_1_1Token_1a86b01e3d9f2c0a4c048164c70ff4deb4)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:29`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> isA {#classEScript_1_1Token_1aa63d0e3e2b5ae4c0109765b5eae68c0d}

| public | static | inline |
{:.api_label}

|
| ------: | ----------------- |
| template< class TokenType_t  > |
| bool **[isA](#classEScript_1_1Token_1aa63d0e3e2b5ae4c0109765b5eae68c0d)**( |  [Token](classEScript_1_1Token) * | **t** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:32`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> isA {#classEScript_1_1Token_1a12bcc8a9c58cc42e083d65caa7e00c4b}

| public | static | inline |
{:.api_label}

|
| ------: | ----------------- |
| template< class TokenType_t  > |
| bool **[isA](#classEScript_1_1Token_1a12bcc8a9c58cc42e083d65caa7e00c4b)**( | const [_CountedRef](classEScript_1_1%5F%5FCountedRef) < [Token](classEScript_1_1Token) > & | **t** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:36`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> cast {#classEScript_1_1Token_1abb88a0d9551e61342514e94d80cba9fa}

| public | static | inline |
{:.api_label}

|
| ------: | ----------------- |
| template< class TokenType_t  > |
| TokenType_t * **[cast](#classEScript_1_1Token_1abb88a0d9551e61342514e94d80cba9fa)**( | const [_CountedRef](classEScript_1_1%5F%5FCountedRef) < [Token](classEScript_1_1Token) > & | **t** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:40`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> cast {#classEScript_1_1Token_1a7dec57d65fa36988c92f9540c75d8734}

| public | static | inline |
{:.api_label}

|
| ------: | ----------------- |
| template< class TokenType_t  > |
| TokenType_t * **[cast](#classEScript_1_1Token_1a7dec57d65fa36988c92f9540c75d8734)**( |  [Token](classEScript_1_1Token) * | **t** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:44`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> Token {#classEScript_1_1Token_1a1e51ed8f7f6b19a8815c1e51815a2770}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[Token](#classEScript_1_1Token_1a1e51ed8f7f6b19a8815c1e51815a2770)**( | const uint32_t | **_type** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:51`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> ~Token {#classEScript_1_1Token_1a5ab9c6c7d80928fb058704683acd7e29}

| public | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~Token](#classEScript_1_1Token_1a5ab9c6c7d80928fb058704683acd7e29)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:53`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> toString {#classEScript_1_1Token_1ad7c5253ea61eeb9648c4510c3c576e85}

| public | const | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| std::string **[toString](#classEScript_1_1Token_1ad7c5253ea61eeb9648c4510c3c576e85)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:54`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> setLine {#classEScript_1_1Token_1af9c1c50fcc02c234e2e7fc1df0f64069}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[setLine](#classEScript_1_1Token_1af9c1c50fcc02c234e2e7fc1df0f64069)**( | int | **_line** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:56`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getLine {#classEScript_1_1Token_1a366759fd78ed8d7a95d0c506743867bb}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| int **[getLine](#classEScript_1_1Token_1a366759fd78ed8d7a95d0c506743867bb)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:57`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> clone {#classEScript_1_1Token_1aa3b44dc41c649b53dc231fb7e774f4c4}

| public | const | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Token](classEScript_1_1Token) * **[clone](#classEScript_1_1Token_1aa3b44dc41c649b53dc231fb7e774f4c4)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:60`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getType {#classEScript_1_1Token_1a97732e81509e034fc5ddf3b872fb6728}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| uint32_t **[getType](#classEScript_1_1Token_1a97732e81509e034fc5ddf3b872fb6728)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:62`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> setStaringPos {#classEScript_1_1Token_1aeec379e2eeaab27768da0149ecdd8906}

| public | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[setStaringPos](#classEScript_1_1Token_1aeec379e2eeaab27768da0149ecdd8906)**( | size_t | **p** ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:65`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> getStartingPos {#classEScript_1_1Token_1a6eeea64ec0068036beefd5dbebbfa8d6}

| public | const | inline |
{:.api_label}

|
| ------: | ----------------- |
|  |
| size_t **[getStartingPos](#classEScript_1_1Token_1a6eeea64ec0068036beefd5dbebbfa8d6)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `EScript/EScript/Compiler/Token.h:66`</sub>{:style="float: right"}

-------------------------------------------------------------------

