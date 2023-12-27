# - Try to find Blend2D  
# Once done, this will define  
#  
#  Blend2D_FOUND - system has Blend2D  
#  Blend2D_INCLUDE_DIRS - the Blend2D include directories  
#  Blend2D_LIBRARIES - link these to use Blend2D  
  
include(FindPackageHandleStandardArgs)  
  
# Search for the Blend2D include directory  
find_path(  
    Blend2D_INCLUDE_DIR  
    NAMES blend2d.h  
    PATHS 		
		$ENV{Blend2D_DIR}
		$ENV{Blend2D_ROOT}
		${Blend2D_DIR}
		${Blend2D_ROOT}
	PATH_SUFFIXES
		include
    DOC "Blend2D include directory"  
)
  
# Search for the Blend2D library  
find_library(  
    Blend2D_LIBRARY  
    NAMES blend2d  
	PATHS
		$ENV{Blend2D_DIR}
		$ENV{Blend2D_ROOT}
		${Blend2D_DIR}
		${Blend2D_ROOT}
	PATH_SUFFIXES
		lib/Release
		lib

    DOC "Blend2D library"  
)  
  
# Handle the QUIETLY and REQUIRED arguments and set Blend2D_FOUND to TRUE if all listed variables are TRUE.  
find_package_handle_standard_args(  
    Blend2D  
    DEFAULT_MSG  
    Blend2D_INCLUDE_DIR  
    Blend2D_LIBRARY  
)  
  
# Set the Blend2D include directories and libraries variables  
if(Blend2D_FOUND)  
    set(Blend2D_INCLUDE_DIRS ${Blend2D_INCLUDE_DIR})  
    set(Blend2D_LIBRARIES ${Blend2D_LIBRARY})  
endif()  
  
# Mark the Blend2D include directory and library as advanced variables  
mark_as_advanced(Blend2D_INCLUDE_DIR Blend2D_LIBRARY)