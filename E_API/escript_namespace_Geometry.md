---
api_location: "API/E_Geometry/ELibGeometry.cpp:46:23"
api_type: namespace
author: Generated using <a href="https://github.com/MeisterYeti/WhatsUpDoc">WhatsUpDoc</a>
breadcrumbs: ""
category: "Geometry"
keywords: getClosestPointOnLineToRay, rayPlaneIntersection, lineSphereIntersections, lineTriangleIntersection, triangleTriangleIntersection, calcEnclosingOrthoFrustum, computeMiniball, createOrthogonal, CORNER_xyz, CORNER_Xyz, CORNER_xYz, CORNER_XYz, CORNER_xyZ, CORNER_XyZ, CORNER_xYZ, CORNER_XYZ, SIDE_X_NEG, SIDE_Y_NEG, SIDE_Z_NEG, SIDE_X_POS, SIDE_Y_POS, SIDE_Z_POS
layout: e_api
order: 0
permalink: escript_namespace_Geometry
show_in_toc: true
sidebar: e_api_sidebar
title: "Geometry"
toc: false
---

## Types

|
| ------- | ----------------- |
| type | [Line3](escript_type_Geometry_Line3) |
| type | [Plane](escript_type_Geometry_Plane) |
| type | [Vec3](escript_type_Geometry_Vec3) |
| type | [Frustum](escript_type_Geometry_Frustum) |
| type | [PointOctree](escript_type_Geometry_PointOctree) |
| type | [Vec4](escript_type_Geometry_Vec4) |
| type | [Vec2](escript_type_Geometry_Vec2) |
| type | [Triangle](escript_type_Geometry_Triangle) |
| type | [Box](escript_type_Geometry_Box) |
| type | [Ray3](escript_type_Geometry_Ray3) |
| type | [Matrix3x3](escript_type_Geometry_Matrix3x3) |
| type | [Sphere](escript_type_Geometry_Sphere) |
| type | [Tetrahedron](escript_type_Geometry_Tetrahedron) |
| type | [Quaternion](escript_type_Geometry_Quaternion) |
| type | [Segment3](escript_type_Geometry_Segment3) |
| type | [Matrix4x4](escript_type_Geometry_Matrix4x4) |
| type | [Rect](escript_type_Geometry_Rect) |
| type | [SRT](escript_type_Geometry_SRT) |
{: .nohead }

## Attributes

|
| ------: | ----------------- |
| **CORNER_xyz** | |
| **CORNER_Xyz** | |
| **CORNER_xYz** | |
| **CORNER_XYz** | |
| **CORNER_xyZ** | |
| **CORNER_XyZ** | |
| **CORNER_xYZ** | |
| **CORNER_XYZ** | |
| **SIDE_X_NEG** | |
| **SIDE_Y_NEG** | |
| **SIDE_Z_NEG** | |
| **SIDE_X_POS** | |
| **SIDE_Y_POS** | |
| **SIDE_Z_POS** | |
{: .nohead }
## Functions

|
| ------: | ----------------- |
| **getClosestPointOnLineToRay**(p0, p1, p2, p3) | [ESF] Vec3 getClosestPointOnLineToRay(Vec3 linePos, Vec3 lineDir, Vec3 rayPos, Vec3 rayDir) |
| **rayPlaneIntersection**(p0, p1, p2, p3) | [ESF] Vec3\|false rayPlaneIntersection(Vec3 planePos, Vec3 planeNormal, Vec3 rayPos, Vec3 rayDir) |
| **lineSphereIntersections**(p0, p1) | [ESF] [Number,Number]\|false lineSphereIntersections(Line3 line, Sphere sphere) |
| **lineTriangleIntersection**(p0, p1) | [ESF] [Number,Number]\|false lineSphereIntersections(Line3 line, Triangle triangle) |
| **triangleTriangleIntersection**(p0, p1) | [ESF] Segment3\|true\|false triangleTriangleIntersection(Triangle triangle1, Triangle triangle2)<br/>Returns true when the triangles are coplanar |
| **calcEnclosingOrthoFrustum**(p0, p1) | [ESF] Frustum calcEnclosingOrthoFrustum(Box, Matrix4x4) |
| **[computeMiniball](namespaceGeometry_1_1BoundingSphere#namespaceGeometry_1_1BoundingSphere_1a26aedb094347988baa68b1ac7b7c2b5f)**(p0) | [ESF] Sphere computeMiniball(Array points) |
| **[createOrthogonal](namespaceGeometry_1_1Helper#namespaceGeometry_1_1Helper_1ae45a33659744d9492c69a63a0190997b)**(p0) | [ESF] [Vec3\|Vec2] createOrthogonal([Vec3\|Vec2] vector) |
{: .nohead .nowrap1 }
