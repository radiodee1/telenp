# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "map_store_np: 1 messages, 5 services")

set(MSG_I_FLAGS "-Imap_store_np:/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(map_store_np_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
)

### Generating Services
_generate_srv_cpp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
)
_generate_srv_cpp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
)
_generate_srv_cpp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
)
_generate_srv_cpp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
)
_generate_srv_cpp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
)

### Generating Module File
_generate_module_cpp(map_store_np
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(map_store_np_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(map_store_np_generate_messages map_store_np_generate_messages_cpp)

# target for backward compatibility
add_custom_target(map_store_np_gencpp)
add_dependencies(map_store_np_gencpp map_store_np_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_np_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
)

### Generating Services
_generate_srv_lisp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
)
_generate_srv_lisp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
)
_generate_srv_lisp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
)
_generate_srv_lisp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
)
_generate_srv_lisp(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
)

### Generating Module File
_generate_module_lisp(map_store_np
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(map_store_np_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(map_store_np_generate_messages map_store_np_generate_messages_lisp)

# target for backward compatibility
add_custom_target(map_store_np_genlisp)
add_dependencies(map_store_np_genlisp map_store_np_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_np_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
)

### Generating Services
_generate_srv_py(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
)
_generate_srv_py(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
)
_generate_srv_py(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
)
_generate_srv_py(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
)
_generate_srv_py(map_store_np
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
)

### Generating Module File
_generate_module_py(map_store_np
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(map_store_np_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(map_store_np_generate_messages map_store_np_generate_messages_py)

# target for backward compatibility
add_custom_target(map_store_np_genpy)
add_dependencies(map_store_np_genpy map_store_np_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_np_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store_np
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store_np
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store_np
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
