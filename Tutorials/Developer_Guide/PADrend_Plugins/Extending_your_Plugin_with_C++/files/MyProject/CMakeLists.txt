#
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
# Author: Sascha Brandt (sascha@brandt.graphics)
# PADrend Version 1.0.0
#
cmake_minimum_required(VERSION 3.1.0)

# Modify this to your liking
project(MyProject)

# Set c++ standard to c++11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add your sources here
add_library(${PROJECT_NAME} SHARED 
	src/Main.cpp # The main entry point for the EScript library loader
	src/ELibMyProject.cpp # Initialize your EScript bindings here
)

# Copy resulting library to root build folder
set_target_properties(${PROJECT_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")

# --- Dependencies ---

# Dependency to EScript
if(NOT TARGET EScript)
	find_package(EScript 0.6.7 REQUIRED NO_MODULE) # only used when building library separately
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC EScript) # link to EScript library

# Dependency to Geometry
if(NOT TARGET Geometry)
	find_package(Geometry 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC Geometry)

# Dependency to Rendering
if(NOT TARGET Rendering)
	find_package(Rendering 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC Rendering)

# Dependency to Util
if(NOT TARGET Util)
	find_package(Util 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC Util)

# Dependency to MinSG
if(NOT TARGET MinSG)
	find_package(MinSG 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC MinSG)

# Dependency to E_Geometry
if(NOT TARGET E_Geometry)
	find_package(E_Geometry 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC E_Geometry)

# Dependency to E_Rendering
if(NOT TARGET E_Rendering)
	find_package(E_Rendering 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC E_Rendering)

# Dependency to E_Util
if(NOT TARGET E_Util)
	find_package(E_Util 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC E_Util)

# Dependency to E_MinSG
if(NOT TARGET E_MinSG)
	find_package(E_MinSG 0.2.0 REQUIRED NO_MODULE)
endif()
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC E_MinSG)

