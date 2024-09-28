# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "BananaFlow_autogen"
  "CMakeFiles/BananaFlow_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/BananaFlow_autogen.dir/ParseCache.txt"
  )
endif()
