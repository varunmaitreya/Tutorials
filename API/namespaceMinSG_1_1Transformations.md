---
api_type: namespace
author: Generated using <a href="http://www.doxygen.nl/">Doxygen</a>
breadcrumbs: "MinSG:namespaceMinSG"
category: "MinSG"
keywords: localDirToWorldDir, localDirToRelDir, localPosToWorldPos, localPosToRelPos, relDirToWorldDir, relDirToLocalDir, relPosToWorldPos, relPosToLocalPos, worldDirToLocalDir, worldDirToRelDir, worldPosToLocalPos, worldPosToRelPos, worldSRTToRelSRT, rotateAroundLocalAxis, rotateAroundRelAxis, rotateAroundWorldAxis, rotateToWorldDir
layout: api
permalink: namespaceMinSG_1_1Transformations
show_in_toc: true
sidebar: api_sidebar
subcategory: "Helper"
title: "Transformations"
toc: false
---

## Description





## coordinate transformations

|
| ------: | ----------------- |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[localDirToWorldDir](#namespaceMinSG_1_1Transformations_1afa46a596d9ca12fab02f96472edf1e92)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & localDir) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[localDirToRelDir](#namespaceMinSG_1_1Transformations_1a695b6003a5e9344fab194813aea48cd1)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & localDir) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[localPosToWorldPos](#namespaceMinSG_1_1Transformations_1a97da44fea11e89a079f20e1a93b861ce)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & localPos) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[localPosToRelPos](#namespaceMinSG_1_1Transformations_1aa34a09d72dc08bdca05c8053ac2f0a77)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & localPos) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[relDirToWorldDir](#namespaceMinSG_1_1Transformations_1a7a71118adbe983a5446c1f31f8d06e6e)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & relDir) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[relDirToLocalDir](#namespaceMinSG_1_1Transformations_1ad5918ef96fb5416581721cf6d2835f4a)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & relDir) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[relPosToWorldPos](#namespaceMinSG_1_1Transformations_1ac32158521f1219af7b5736326699ed93)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & relPos) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[relPosToLocalPos](#namespaceMinSG_1_1Transformations_1a47232ff92fcfd2e3c60be9df12dfb0f7)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & relPos) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[worldDirToLocalDir](#namespaceMinSG_1_1Transformations_1a09ed5a2f09a3ca21b888f25dbabbba9f)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & worldDir) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[worldDirToRelDir](#namespaceMinSG_1_1Transformations_1a03824de63cce1da08a198c10c2171e80)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & worldDir) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[worldPosToLocalPos](#namespaceMinSG_1_1Transformations_1a00753571c7420dc896a7b22001697afe)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & worldPos) |
|  | |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) | **[worldPosToRelPos](#namespaceMinSG_1_1Transformations_1acb59b9947778d194587e13b4f2ac6797)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & worldPos) |
{: .nohead .nowrap1 .api_section }


## Node transformations

|
| ------: | ----------------- |
|  | |
| [Geometry::SRT](namespaceGeometry#namespaceGeometry_1acbf1a7ed1b25571b97a1d7c2f14ae848) | **[worldSRTToRelSRT](#namespaceMinSG_1_1Transformations_1aff31dcd581ebb5c7f2de05a0e2030776)**(const [Node](classMinSG_1_1Node) & node, const [Geometry::SRT](namespaceGeometry#namespaceGeometry_1acbf1a7ed1b25571b97a1d7c2f14ae848) & worldSRT) |
|  | |
| void | **[rotateAroundLocalAxis](#namespaceMinSG_1_1Transformations_1a605beea0b0a50cce25cd4061960c6654)**( [Node](classMinSG_1_1Node) & node, const [Geometry::Angle](namespaceGeometry#namespaceGeometry_1add8f0bfbc173e50540e5a71500f085ab) & angle, const [Geometry::Line3](namespaceGeometry#namespaceGeometry_1a2b2cbba43080657aa8704a1e044e3696) & localAxis) |
|  | |
| void | **[rotateAroundRelAxis](#namespaceMinSG_1_1Transformations_1ac49faaa636ab68d35c8a4343d7c0a40e)**( [Node](classMinSG_1_1Node) & node, const [Geometry::Angle](namespaceGeometry#namespaceGeometry_1add8f0bfbc173e50540e5a71500f085ab) & angle, const [Geometry::Line3](namespaceGeometry#namespaceGeometry_1a2b2cbba43080657aa8704a1e044e3696) & relAxis) |
|  | |
| void | **[rotateAroundWorldAxis](#namespaceMinSG_1_1Transformations_1a1bcbac7aadc49fa2b87b46f43438c173)**( [Node](classMinSG_1_1Node) & node, const [Geometry::Angle](namespaceGeometry#namespaceGeometry_1add8f0bfbc173e50540e5a71500f085ab) & angle, const [Geometry::Line3](namespaceGeometry#namespaceGeometry_1a2b2cbba43080657aa8704a1e044e3696) & worldAxis) |
|  | |
| void | **[rotateToWorldDir](#namespaceMinSG_1_1Transformations_1aa00b8d06e76e321376702883bf439ebc)**( [Node](classMinSG_1_1Node) & node, const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & worldDir) |
{: .nohead .nowrap1 .api_section }


-------------------------------------------------------------------

## Documentation

### <small>function</small><br/> localDirToWorldDir {#namespaceMinSG_1_1Transformations_1afa46a596d9ca12fab02f96472edf1e92}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[localDirToWorldDir](#namespaceMinSG_1_1Transformations_1afa46a596d9ca12fab02f96472edf1e92)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **localDir** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:26`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> localDirToRelDir {#namespaceMinSG_1_1Transformations_1a695b6003a5e9344fab194813aea48cd1}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[localDirToRelDir](#namespaceMinSG_1_1Transformations_1a695b6003a5e9344fab194813aea48cd1)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **localDir** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:27`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> localPosToWorldPos {#namespaceMinSG_1_1Transformations_1a97da44fea11e89a079f20e1a93b861ce}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[localPosToWorldPos](#namespaceMinSG_1_1Transformations_1a97da44fea11e89a079f20e1a93b861ce)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **localPos** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:28`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> localPosToRelPos {#namespaceMinSG_1_1Transformations_1aa34a09d72dc08bdca05c8053ac2f0a77}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[localPosToRelPos](#namespaceMinSG_1_1Transformations_1aa34a09d72dc08bdca05c8053ac2f0a77)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **localPos** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:29`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> relDirToWorldDir {#namespaceMinSG_1_1Transformations_1a7a71118adbe983a5446c1f31f8d06e6e}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[relDirToWorldDir](#namespaceMinSG_1_1Transformations_1a7a71118adbe983a5446c1f31f8d06e6e)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **relDir** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:30`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> relDirToLocalDir {#namespaceMinSG_1_1Transformations_1ad5918ef96fb5416581721cf6d2835f4a}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[relDirToLocalDir](#namespaceMinSG_1_1Transformations_1ad5918ef96fb5416581721cf6d2835f4a)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **relDir** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:31`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> relPosToWorldPos {#namespaceMinSG_1_1Transformations_1ac32158521f1219af7b5736326699ed93}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[relPosToWorldPos](#namespaceMinSG_1_1Transformations_1ac32158521f1219af7b5736326699ed93)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **relPos** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:32`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> relPosToLocalPos {#namespaceMinSG_1_1Transformations_1a47232ff92fcfd2e3c60be9df12dfb0f7}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[relPosToLocalPos](#namespaceMinSG_1_1Transformations_1a47232ff92fcfd2e3c60be9df12dfb0f7)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **relPos** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:33`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> worldDirToLocalDir {#namespaceMinSG_1_1Transformations_1a09ed5a2f09a3ca21b888f25dbabbba9f}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[worldDirToLocalDir](#namespaceMinSG_1_1Transformations_1a09ed5a2f09a3ca21b888f25dbabbba9f)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **worldDir** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:34`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> worldDirToRelDir {#namespaceMinSG_1_1Transformations_1a03824de63cce1da08a198c10c2171e80}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[worldDirToRelDir](#namespaceMinSG_1_1Transformations_1a03824de63cce1da08a198c10c2171e80)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **worldDir** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:35`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> worldPosToLocalPos {#namespaceMinSG_1_1Transformations_1a00753571c7420dc896a7b22001697afe}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[worldPosToLocalPos](#namespaceMinSG_1_1Transformations_1a00753571c7420dc896a7b22001697afe)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **worldPos** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:36`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> worldPosToRelPos {#namespaceMinSG_1_1Transformations_1acb59b9947778d194587e13b4f2ac6797}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) **[worldPosToRelPos](#namespaceMinSG_1_1Transformations_1acb59b9947778d194587e13b4f2ac6797)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **worldPos** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:37`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> worldSRTToRelSRT {#namespaceMinSG_1_1Transformations_1aff31dcd581ebb5c7f2de05a0e2030776}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| [Geometry::SRT](namespaceGeometry#namespaceGeometry_1acbf1a7ed1b25571b97a1d7c2f14ae848) **[worldSRTToRelSRT](#namespaceMinSG_1_1Transformations_1aff31dcd581ebb5c7f2de05a0e2030776)**( | const [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::SRT](namespaceGeometry#namespaceGeometry_1acbf1a7ed1b25571b97a1d7c2f14ae848) & | **worldSRT** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:49`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> rotateAroundLocalAxis {#namespaceMinSG_1_1Transformations_1a605beea0b0a50cce25cd4061960c6654}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[rotateAroundLocalAxis](#namespaceMinSG_1_1Transformations_1a605beea0b0a50cce25cd4061960c6654)**( |  [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Angle](namespaceGeometry#namespaceGeometry_1add8f0bfbc173e50540e5a71500f085ab) & | **angle**, |
| | const [Geometry::Line3](namespaceGeometry#namespaceGeometry_1a2b2cbba43080657aa8704a1e044e3696) & | **localAxis** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:51`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> rotateAroundRelAxis {#namespaceMinSG_1_1Transformations_1ac49faaa636ab68d35c8a4343d7c0a40e}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[rotateAroundRelAxis](#namespaceMinSG_1_1Transformations_1ac49faaa636ab68d35c8a4343d7c0a40e)**( |  [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Angle](namespaceGeometry#namespaceGeometry_1add8f0bfbc173e50540e5a71500f085ab) & | **angle**, |
| | const [Geometry::Line3](namespaceGeometry#namespaceGeometry_1a2b2cbba43080657aa8704a1e044e3696) & | **relAxis** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:52`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> rotateAroundWorldAxis {#namespaceMinSG_1_1Transformations_1a1bcbac7aadc49fa2b87b46f43438c173}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[rotateAroundWorldAxis](#namespaceMinSG_1_1Transformations_1a1bcbac7aadc49fa2b87b46f43438c173)**( |  [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Angle](namespaceGeometry#namespaceGeometry_1add8f0bfbc173e50540e5a71500f085ab) & | **angle**, |
| | const [Geometry::Line3](namespaceGeometry#namespaceGeometry_1a2b2cbba43080657aa8704a1e044e3696) & | **worldAxis** |
|   ) |
{: .nohead .nowrap1 .api_doc }





<sub>Defined in `MinSG/Core/Transformations.h:53`</sub>{:style="float: right"}

-------------------------------------------------------------------

### <small>function</small><br/> rotateToWorldDir {#namespaceMinSG_1_1Transformations_1aa00b8d06e76e321376702883bf439ebc}

| public |
{:.api_label}

|
| ------: | ----------------- |
|  |
| void **[rotateToWorldDir](#namespaceMinSG_1_1Transformations_1aa00b8d06e76e321376702883bf439ebc)**( |  [Node](classMinSG_1_1Node) & | **node**, |
| | const [Geometry::Vec3](namespaceGeometry#namespaceGeometry_1ab29e4544da9b15b5bf224cbf5b691313) & | **worldDir** |
|   ) |
{: .nohead .nowrap1 .api_doc }




> **Note**: As no up vector is specified, the rotation is not fully determined (so just see what happens...)






<sub>Defined in `MinSG/Core/Transformations.h:56`</sub>{:style="float: right"}

-------------------------------------------------------------------

