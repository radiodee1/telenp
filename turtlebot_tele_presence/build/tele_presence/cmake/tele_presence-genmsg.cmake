# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tele_presence: 2 messages, 1 services")

set(MSG_I_FLAGS "-Itele_presence:/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tele_presence_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListElement.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_msg_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntryList.msg"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListElement.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)

### Generating Services
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/CreateMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)

### Generating Module File
_generate_module_cpp(tele_presence
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tele_presence_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tele_presence_generate_messages tele_presence_generate_messages_cpp)

# target for backward compatibility
add_custom_target(tele_presence_gencpp)
add_dependencies(tele_presence_gencpp tele_presence_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tele_presence_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListElement.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_msg_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntryList.msg"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListElement.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)

### Generating Services
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/CreateMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)

### Generating Module File
_generate_module_lisp(tele_presence
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tele_presence_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tele_presence_generate_messages tele_presence_generate_messages_lisp)

# target for backward compatibility
add_custom_target(tele_presence_genlisp)
add_dependencies(tele_presence_genlisp tele_presence_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tele_presence_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListElement.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_msg_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntryList.msg"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListElement.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)

### Generating Services
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/CreateMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)

### Generating Module File
_generate_module_py(tele_presence
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tele_presence_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tele_presence_generate_messages tele_presence_generate_messages_py)

# target for backward compatibility
add_custom_target(tele_presence_genpy)
add_dependencies(tele_presence_genpy tele_presence_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tele_presence_generate_messages_py)


debug_message(2 "tele_presence: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
