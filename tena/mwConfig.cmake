add_library(foo STATIC IMPORTED)
find_library(FOO_LIBRARY_PATH foo HINTS "${CMAKE_CURRENT_LIST_DIR}/../../")
set_target_properties(foo PROPERTIES IMPORTED_LOCATION "${FOO_LIBRARY_PATH}")
