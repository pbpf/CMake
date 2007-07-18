# FIND_PACKAGE_HANDLE_STANDARD_ARGS(NAME VAR ... )
#    This macro is intended to be used in FindXXX.cmake modules files.
#    It handles the REQUIRED and QUIET argument to FIND_PACKAGE() and
#    it also sets the <UPPERCASED_NAME>_FOUND variable.
#    The package is found if all variables listed are TRUE.
#    Example:
#
#    FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibXml2 LIBXML2_LIBRARIES LIBXML2_INCLUDE_DIR)
#
#    LibXml2 is considered to be found, if both LIBXML2_LIBRARIES and 
#    LIBXML2_INCLUDE_DIR are valid. Then also LIBXML2_FOUND is set tto TRUE.
#    If it is not found and REQUIRED was used, it fails with FATAL_ERROR, 
#    independent whether QUIET was used or not.
#    If it is found, the location is reported using the VAR argument, so 
#    here a message "Found LibXml2: /usr/lib/libxml2.so" will be printed out.

MACRO(FIND_PACKAGE_HANDLE_STANDARD_ARGS _NAME _VAR1 )
  STRING(TOUPPER ${_NAME} _NAME_UPPER)

  SET(${_NAME_UPPER}_FOUND TRUE)
  IF(NOT ${_VAR1})
    SET(${_NAME_UPPER}_FOUND FALSE)
  ENDIF(NOT ${_VAR1})

  FOREACH(_CURRENT_VAR ${ARGN})
    IF(NOT ${_CURRENT_VAR})
      SET(${_NAME_UPPER}_FOUND FALSE)
    ENDIF(NOT ${_CURRENT_VAR})
  ENDFOREACH(_CURRENT_VAR)

  IF (${_NAME_UPPER}_FOUND)
    IF (NOT ${_NAME}_FIND_QUIETLY)
        MESSAGE(STATUS "Found ${_NAME}: ${${_VAR1}}")
    ENDIF (NOT ${_NAME}_FIND_QUIETLY)
  ELSE (${_NAME_UPPER}_FOUND)
    IF (${_NAME}_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could NOT find ${_NAME}")
    ELSE (${_NAME}_FIND_REQUIRED)
      IF (NOT ${_NAME}_FIND_QUIETLY)
        MESSAGE(STATUS "Could NOT find ${_NAME}")
      ENDIF (NOT ${_NAME}_FIND_QUIETLY)
    ENDIF (${_NAME}_FIND_REQUIRED)
  ENDIF (${_NAME_UPPER}_FOUND)
ENDMACRO(FIND_PACKAGE_HANDLE_STANDARD_ARGS)
