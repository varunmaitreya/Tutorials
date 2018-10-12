#!/bin/bash

# copy folders
cp -r ../Tutorials .
cp -r ../API .
cp ../index.md .
mkdir -p ./_data/sidebars

#if ! [ -x "$(command -v escript)" ]; then
  echo "Building EScript..."
  # clone & build escript
  git clone https://github.com/EScript/EScript.git escript && cd escript
  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_ESCRIPT_APPLICATION=ON -DBUILD_ESCRIPT_TEST=OFF . && make
  cd ..

  ESCRIPT_CMD=./escript/EScript/escript
#else
#  echo "EScript found"
#  ESCRIPT_CMD=escript
#fi

# build table of contents & update code sections
$ESCRIPT_CMD ../Tools/MarkDownTool.escript -t -c Tutorials

# cleanup escript
rm -rf escript