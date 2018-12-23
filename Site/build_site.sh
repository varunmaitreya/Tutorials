#!/bin/bash

# cleanup
rm -rf Tutorials
rm -rf API
#rm index.md

# copy folders & files
cp -r ../Tutorials .
cp ../index.md .

# create directories
mkdir -p ./_data/sidebars
mkdir -p tmp
cd tmp

# --------------
# build index
# --------------

# clone & build escript
echo "Building EScript..."
git clone https://github.com/EScript/EScript.git escript &> /dev/null && cd escript
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_ESCRIPT_APPLICATION=ON -DBUILD_ESCRIPT_TEST=OFF . && make && cd ..
echo "done"

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
./escript/EScript/escript ../../Tools/MarkDownTool.escript -t -c -o=../_data/sidebars/home_sidebar.yml -s=timestamps.json ../Tutorials
echo "done"

npm install fast-xml-parser -g

# --------------
# build api docs
# --------------

echo "Checking out source..."
git clone --recursive https://github.com/PADrend/PADrendComplete.git src &> /dev/null
mkdir API
mv src/modules/Geometry API
mv src/modules/GUI API
mv src/modules/Rendering API
mv src/modules/MinSG API
mv src/modules/Util API
mv src/modules/Sound API
mkdir E_API
mv src/modules/EScript E_API
mv src/modules/E_Geometry E_API
mv src/modules/E_GUI E_API
mv src/modules/E_Rendering E_API
mv src/modules/E_MinSG E_API
mv src/modules/E_Util E_API
mv src/modules/E_Sound E_API
echo "done"

# Geometry
echo "Building API doc..."
cd API
doxygen ../../../Tools/Doxyfile
mv html ../../API
cd ../..
echo "done"

# cleanup
#rm -rf tmp
