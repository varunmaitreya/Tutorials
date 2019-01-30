---
api_location: "MinSG/Ext/PathTracing/Light.h"
api_type: class
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG|PathTracing:namespaceMinSG_1_1PathTracing"
category: "MinSG"
keywords: ~Light, sampleIncidentRadiance, isDeltaLight
layout: api
permalink: classMinSG_1_1PathTracing_1_1Light
show_in_toc: false
sidebar: api_sidebar
subcategory: "Extensions"
title: "Light"
toc: false
---

| public | abstract |
{:.api_label}

#### Inherited

* [MinSG::PathTracing::DiffuseAreaLight](classMinSG_1_1PathTracing_1_1DiffuseAreaLight)
* [MinSG::PathTracing::MinSGLight](classMinSG_1_1PathTracing_1_1MinSGLight)


## Description





## Classes

|
| ------- | ----------------- |
| struct | [MinSG::PathTracing::Light::SampleResult](structMinSG_1_1PathTracing_1_1Light_1_1SampleResult) <br/>  |
{: .nohead }


## Public Functions

|
| ------: | ----------------- |
|  | |
|  | **[~Light](#classMinSG_1_1PathTracing_1_1Light_1aae0cfbe31342a4bea0ddb7a0de49495d)**() |
|  | |
| [SampleResult](structMinSG_1_1PathTracing_1_1Light_1_1SampleResult) | **[sampleIncidentRadiance](#classMinSG_1_1PathTracing_1_1Light_1a2f98cd820587a2d553f2d8ff9974fb9e)**(const [SurfacePoint](classMinSG_1_1PathTracing_1_1SurfacePoint) & surface, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & sample) const |
|  | |
| bool | **[isDeltaLight](#classMinSG_1_1PathTracing_1_1Light_1a08b6a952a70a650092ac17144ac287e9)**() const |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> ~Light {#classMinSG_1_1PathTracing_1_1Light_1aae0cfbe31342a4bea0ddb7a0de49495d}

| public | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
|  **[~Light](#classMinSG_1_1PathTracing_1_1Light_1aae0cfbe31342a4bea0ddb7a0de49495d)**( |  ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/PathTracing/Light.h:43`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> sampleIncidentRadiance {#classMinSG_1_1PathTracing_1_1Light_1a2f98cd820587a2d553f2d8ff9974fb9e}

| public | const | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [SampleResult](structMinSG_1_1PathTracing_1_1Light_1_1SampleResult) **[sampleIncidentRadiance](#classMinSG_1_1PathTracing_1_1Light_1a2f98cd820587a2d553f2d8ff9974fb9e)**( | const [SurfacePoint](classMinSG_1_1PathTracing_1_1SurfacePoint) & | **surface**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **sample** |
|   ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/PathTracing/Light.h:45`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> isDeltaLight {#classMinSG_1_1PathTracing_1_1Light_1a08b6a952a70a650092ac17144ac287e9}

| public | const | inline | virtual |
{:.api_label}

|
| ------: | ----------------- |
|  |
| bool **[isDeltaLight](#classMinSG_1_1PathTracing_1_1Light_1a08b6a952a70a650092ac17144ac287e9)**( |  ) const |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Ext/PathTracing/Light.h:46`</sub>{:style="float: right"}

-------------------------------------------------------------------

