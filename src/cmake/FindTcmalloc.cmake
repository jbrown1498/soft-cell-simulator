# - Find Google perftools
# Find the Google perftools includes and libraries
# This module defines
#  GOOGLE_PERFTOOLS_INCLUDE_DIR, where to find heap-profiler.h, etc.
#  GOOGLE_PERFTOOLS_FOUND, If false, do not try to use Google perftools.
# also defined for general use are
#  TCMALLOC_LIBRARIES, where to find the tcmalloc library.
#  PROFILER_LIBRARIES, where to find the profiler library.

FIND_PATH(GOOGLE_PERFTOOLS_INCLUDE_DIR google/heap-profiler.h
/usr/local/include
/usr/include
)

FIND_LIBRARY(TCMALLOC_LIBRARY NAMES tcmalloc PATHS /usr/lib /usr/local/lib)

IF (TCMALLOC_LIBRARY AND GOOGLE_PERFTOOLS_INCLUDE_DIR)
    SET(TCMALLOC_LIBRARIES ${TCMALLOC_LIBRARY})
    SET(GOOGLE_PERFTOOLS_FOUND "YES")
ELSE (TCMALLOC_LIBRARY AND GOOGLE_PERFTOOLS_INCLUDE_DIR)
  SET(GOOGLE_PERFTOOLS_FOUND "NO")
ENDIF (TCMALLOC_LIBRARY AND GOOGLE_PERFTOOLS_INCLUDE_DIR)

FIND_LIBRARY(PROFILER_LIBRARY
  NAMES profiler
  PATHS /usr/lib /usr/local/lib
)

IF (PROFILER_LIBRARY AND GOOGLE_PERFTOOLS_INCLUDE_DIR)
    SET(PROFILER_LIBRARIES ${PROFILER_LIBRARY})
ENDIF (PROFILER_LIBRARY AND GOOGLE_PERFTOOLS_INCLUDE_DIR)

IF (GOOGLE_PERFTOOLS_FOUND)
   IF (NOT GOOGLE_PERFTOOLS_FIND_QUIETLY)
      MESSAGE(STATUS "Found Google perftools: ${GOOGLE_PERFTOOLS_LIBRARIES}")
   ENDIF (NOT GOOGLE_PERFTOOLS_FIND_QUIETLY)
ELSE (GOOGLE_PERFTOOLS_FOUND)
   IF (GOOGLE_PERFTOOLS_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find Google perftools library")
   ENDIF (GOOGLE_PERFTOOLS_FIND_REQUIRED)
ENDIF (GOOGLE_PERFTOOLS_FOUND)

MARK_AS_ADVANCED(
  TCMALLOC_LIBRARY
  PROFILER_LIBRARY
  GOOGLE_PERFTOOLS_INCLUDE_DIR
)
