file(REMOVE_RECURSE
  "/home/jetson/Robot/picky/devel/lib/librobotis_framework_common.pdb"
  "/home/jetson/Robot/picky/devel/lib/librobotis_framework_common.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/robotis_framework_common.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
