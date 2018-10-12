#!/bin/bash

# cleanup
rm -rf Tutorials
rm -rf API
rm index.md

# copy folders & files
cp -r ../Tutorials .
cp ../index.md .

# create directories
mkdir -p ./_data/sidebars
mkdir -p API
mkdir -p tmp
cd tmp

# --------------
# build index
# --------------

# clone & build escript
git clone https://github.com/EScript/EScript.git escript && cd escript
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_ESCRIPT_APPLICATION=ON -DBUILD_ESCRIPT_TEST=OFF . && make && cd ..

# build table of contents & update code sections
./escript/EScript/escript ../../Tools/MarkDownTool.escript -t -c ../Tutorials ../_data/sidebars/home_sidebar.yml

# --------------
# build api docs
# --------------

# Geometry
git clone https://github.com/PADrend/Geometry.git Geometry
doxygen Geometry/doc/Doxyfile
mv doc/html ../API/Geometry

# GUI
git clone https://github.com/PADrend/GUI.git GUI
doxygen GUI/doc/Doxyfile
mv doc/html ../API/GUI

# Rendering
git clone https://github.com/PADrend/Rendering.git Rendering
doxygen Rendering/doc/Doxyfile
mv doc/html ../API/Rendering

# Util
git clone https://github.com/PADrend/Util.git Util
doxygen Util/doc/Doxyfile
mv doc/html ../API/Util

# MinSG
git clone https://github.com/PADrend/MinSG.git MinSG
doxygen MinSG/doc/Doxyfile
mv doc/html ../API/MinSG

# cleanup
cd ..
rm -rf tmp
