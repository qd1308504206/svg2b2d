cmake_minimum_required(VERSION 3.8)


file(GLOB SVG2B2D_TEST_INC ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
file(GLOB SVG2B2D_TEST_SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

list(APPEND SVG2B2D_TEST_SRC_LIST ${SVG2B2D_TEST_INC} ${SVG2B2D_TEST_SRC})


set(PROJECT_NAME "svg2b2d_test")






add_executable(${PROJECT_NAME} ${SVG2B2D_TEST_SRC_LIST})


target_link_libraries(${PROJECT_NAME} PUBLIC svg2b2d)


add_custom_command(TARGET ${PROJECT_NAME} ${TARGET_NAME} PRE_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/../dependency/lib/$<IF:$<CONFIG:Debug>,Debug,Release>/blend2d.dll  "${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_CFG_INTDIR}")

