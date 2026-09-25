cmake_minimum_required(VERSION 4.4.3)
project(game)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)

add_executable(${PROJECT_NAME})
file(GLOB SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)
target_sources(${PROJECT_NAME}
    PRIVATE
    ${SOURCES}
)

set(VENDOR_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor")
set(GLFW_DIR "${VENDOR_DIR}/glfw")
set(VULKAN_DIR "${VENDOR_DIR}/vulkan/x86_64")

include(FetchContent)
FetchContent_Declare(
    glfw
    SOURCE_DIR "${GLFW_DIR}"
)
FetchContent_MakeAvailable(glfw)

add_library(vulkan INTERFACE)
target_link_directories(vulkan
    INTERFACE
    "${VULKAN_DIR}/lib"
)

target_include_directories(vulkan
    INTERFACE
    "${VULKAN_DIR}/include"
)

target_link_libraries(${PROJECT_NAME} PRIVATE glfw vulkan)
