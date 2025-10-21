cmake_minimum_required(VERSION 3.16)
project(my-c-project C)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Compiler options
add_compile_options(-Wall -Wextra)

# Output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# Collect all source files
set(SOURCES
    src/main.c
    src/file1.c
)

# Executable
add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/src)

# Installation
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)