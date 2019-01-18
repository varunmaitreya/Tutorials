#!/bin/bash

# cleanup
rm -rf Tutorials
rm -rf API
rm -rf E_API
rm index.md

# copy folders & files
cp -r ../Tutorials .
cp ../index.md .

# create directories
mkdir -p ./_data/sidebars
mkdir -p tmp
mkdir -p API
mkdir -p E_API
cd tmp

# --------------
# build index
# --------------

# clone & build escript
echo "Building EScript..."
git clone https://github.com/MeisterYeti/EScript.git EScript &> /dev/null
cd EScript
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_ESCRIPT_APPLICATION=ON -DBUILD_ESCRIPT_TEST=OFF -DBUILD_SHARED_LIBS=ON . && make
cd ..
git clone https://github.com/MeisterYeti/E_XML.git E_XML &> /dev/null
cd E_XML
cmake -DCMAKE_BUILD_TYPE=Release . && make
cd ..
cp EScript/EScript/escript .
cp EScript/libEScript.so .
cp E_XML/libE_XML.so .
echo "done"

# --------------
# build api docs
# --------------

echo "Checking out source..."
git clone --recursive https://github.com/PADrend/PADrendComplete.git src &> /dev/null

# need patching of EScript for documentation
cd src/modules/EScript
patch -p1 < ../../../../../Tools/doc/escript_doc.patch
cd ../../..

mkdir API
mv src/modules/Geometry API
mv src/modules/GUI API
mv src/modules/Rendering API
mv src/modules/MinSG API
mv src/modules/Util API
mv src/modules/Sound API
cp -r src/modules/EScript API
mkdir E_API
mv src/modules/EScript E_API
mv src/modules/E_Geometry E_API
mv src/modules/E_GUI E_API
mv src/modules/E_Rendering E_API
mv src/modules/E_MinSG E_API
mv src/modules/E_Util E_API
mv src/modules/E_Sound E_API
echo "done"

echo "Building API doc..."
cd API
doxygen ../../../Tools/doc/Doxyfile
cd ..
./escript ../../Tools/Doxygen2md.escript -o ../API/ -a refs.json API/xml
echo "done"

echo "Building E_API doc..."
cd E_API
# Somehow doxygen mixes up namespaces when running in one call
cd EScript
doxygen ../../../../Tools/doc/E_Doxyfile
cd ../E_Geometry
doxygen ../../../../Tools/doc/E_Doxyfile
cd ../E_GUI
doxygen ../../../../Tools/doc/E_Doxyfile
cd ../E_Rendering
doxygen ../../../../Tools/doc/E_Doxyfile
cd ../E_MinSG
doxygen ../../../../Tools/doc/E_Doxyfile
cd ../E_Util
doxygen ../../../../Tools/doc/E_Doxyfile
cd ../E_Sound
doxygen ../../../../Tools/doc/E_Doxyfile
cd ../..
./escript ../../Tools/EDoxygen2md.escript -o ../E_API/ -ref refs.json E_API/xml
echo "done"
# --------------
# build TOC
# --------------

echo "Collecting Timestamps..."
export LC_TIME="en_US.UTF-8"
echo "{" > timestamps.json
git ls-tree -r --name-only HEAD ../../Tutorials | while read filename; do
  echo "\"${filename:3}\": \"$(git log -1 --date=format:"%B %d, %Y" --format="%ad" -- "$filename")\"," >> timestamps.json
done
echo "}" >> timestamps.json
echo "done"

# build table of contents & update code sections
echo "Building TOC..."
./escript ../../Tools/MarkDownTool.escript -c -toc ../_data/sidebars/home_sidebar.yml -t timestamps.json ../Tutorials
./escript ../../Tools/MarkDownTool.escript -toc ../_data/sidebars/api_sidebar.yml -p "C++ API" ../API
./escript ../../Tools/MarkDownTool.escript -toc ../_data/sidebars/e_api_sidebar.yml -p "EScript API" ../E_API
echo "done"

# cleanup
cd ..
rm -rf tmp
