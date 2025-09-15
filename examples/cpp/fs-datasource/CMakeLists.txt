project(filestore-service CXX)

set (FS_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set (NDS_FMT_DIR ${CMAKE_CURRENT_BINARY_DIR}/ndsfmt)
list (APPEND CMAKE_MODULE_PATH
    ${FS_ROOT}/cmake
    ${FS_ROOT}/zserio/bin/cmake
)

include (zstd)
include (zserio_compiler)
add_subdirectory(${FS_ROOT}/zserio/runtime)
add_library (nds_fmt "${FS_ROOT}/zs/tt.zs")
set (ZSERIO_JAR_FILE ${FS_ROOT}/zserio/bin/zserio.jar)
set (ZS_PARAMS -setTopLevelPackage nds -setCppAllocator std -withReflectionCode -withTypeInfoCode)
zserio_generate_cpp(
    TARGET nds_fmt
    SRC_DIR ${FS_ROOT}/zs
    GEN_DIR ${NDS_FMT_DIR}
    EXTRA_ARGS ${ZS_PARAMS}
)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} PUBLIC
  nds_fmt
  libzstd_static
  mapget-http-service
)
target_link_libraries(nds_fmt PUBLIC
  ZserioCpp17Runtime
)

