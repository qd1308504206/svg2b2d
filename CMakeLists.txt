cmake_minimum_required(VERSION 3.8)

project(svg2b2d VERSION 1.0)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_SOURCE_DIR}/dependency)
find_package(Blend2D REQUIRED)



file(GLOB SVG2B2D_INC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)
file(GLOB SVG2B2D_SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)

list(APPEND SVG2B2D_SRC_LIST ${SVG2B2D_INC} ${SVG2B2D_SRC})


set(PROJECT_NAME "svg2b2d")

# find Blend2D library
find_package(Blend2D REQUIRED)


add_library(${PROJECT_NAME} STATIC ${SVG2B2D_SRC_LIST} 
)


include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/src
	${CMAKE_CURRENT_SOURCE_DIR}/dependency/include
	${Blend2D_INCLUDE_DIR}
)

target_link_libraries(${PROJECT_NAME} PUBLIC ${Blend2D_LIBRARIES})

option(BUILD_TEST "build test" ON)

if(BUILD_TEST)
	add_subdirectory(test)
endif()