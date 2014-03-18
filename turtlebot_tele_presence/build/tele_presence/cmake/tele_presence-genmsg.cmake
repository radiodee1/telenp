# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tele_presence: 2 messages, 9 services")

set(MSG_I_FLAGS "-Itele_presence:/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg;-Itele_presence:/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg;-Igeometry_msgs:/opt/ros/hydro/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/hydro/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/hydro/share/actionlib_msgs/cmake/../msg")

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
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_msg_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapWithMetaData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/nav_msgs/cmake/../msg/OccupancyGrid.msg;/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg;/opt/ros/hydro/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)

### Generating Services
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/CreateMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapList.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/PictureMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapUniversal.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/BasicStop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/BasicLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
)
_generate_srv_cpp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapRename.srv"
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
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_msg_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapWithMetaData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/nav_msgs/cmake/../msg/OccupancyGrid.msg;/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg;/opt/ros/hydro/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)

### Generating Services
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/CreateMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapList.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/PictureMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapUniversal.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/BasicStop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/BasicLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
)
_generate_srv_lisp(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapRename.srv"
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
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_msg_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapWithMetaData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/nav_msgs/cmake/../msg/OccupancyGrid.msg;/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg;/opt/ros/hydro/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)

### Generating Services
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/CreateMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapList.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/PictureMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapUniversal.srv"
  "${MSG_I_FLAGS}"
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/BasicStop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/BasicLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
)
_generate_srv_py(tele_presence
  "/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapRename.srv"
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



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tele_presence
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(tele_presence_generate_messages_cpp tele_presence_generate_messages_cpp)
add_dependencies(tele_presence_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(tele_presence_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(tele_presence_generate_messages_cpp nav_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tele_presence
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(tele_presence_generate_messages_lisp tele_presence_generate_messages_lisp)
add_dependencies(tele_presence_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(tele_presence_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(tele_presence_generate_messages_lisp nav_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tele_presence
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(tele_presence_generate_messages_py tele_presence_generate_messages_py)
add_dependencies(tele_presence_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(tele_presence_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(tele_presence_generate_messages_py nav_msgs_generate_messages_py)
