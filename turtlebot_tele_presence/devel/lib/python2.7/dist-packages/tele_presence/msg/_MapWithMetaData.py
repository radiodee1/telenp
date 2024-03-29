"""autogenerated by genpy from tele_presence/MapWithMetaData.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import tele_presence.msg
import nav_msgs.msg
import genpy
import std_msgs.msg

class MapWithMetaData(genpy.Message):
  _md5sum = "72b8bf80de7d69cde5c979ffc2a31b50"
  _type = "tele_presence/MapWithMetaData"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# One entry in a list of maps.

# Entire MapListEntry object
tele_presence/MapListEntry info

# Entire map object
nav_msgs/OccupancyGrid grid

================================================================================
MSG: tele_presence/MapListEntry
# One entry in a list of maps.

# Naming a map is optional.
string name

# Maps made by the make-a-map app are given a session ID, which is the
# time when the map-making session was started, expressed as seconds
# since the epoch and converted to a string.
string session_id

# Creation time of this map, in seconds since the epoch.
int64 date

# Unique ID of this map.
string map_id

================================================================================
MSG: nav_msgs/OccupancyGrid
# This represents a 2-D grid map, in which each cell represents the probability of
# occupancy.

Header header 

#MetaData for the map
MapMetaData info

# The map data, in row-major order, starting with (0,0).  Occupancy
# probabilities are in the range [0,100].  Unknown is -1.
int8[] data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.secs: seconds (stamp_secs) since epoch
# * stamp.nsecs: nanoseconds since stamp_secs
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of postion and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

"""
  __slots__ = ['info','grid']
  _slot_types = ['tele_presence/MapListEntry','nav_msgs/OccupancyGrid']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       info,grid

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MapWithMetaData, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.info is None:
        self.info = tele_presence.msg.MapListEntry()
      if self.grid is None:
        self.grid = nav_msgs.msg.OccupancyGrid()
    else:
      self.info = tele_presence.msg.MapListEntry()
      self.grid = nav_msgs.msg.OccupancyGrid()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.info.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.info.session_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_struct_q.pack(self.info.date))
      _x = self.info.map_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_3I.pack(_x.grid.header.seq, _x.grid.header.stamp.secs, _x.grid.header.stamp.nsecs))
      _x = self.grid.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_2If2I7d.pack(_x.grid.info.map_load_time.secs, _x.grid.info.map_load_time.nsecs, _x.grid.info.resolution, _x.grid.info.width, _x.grid.info.height, _x.grid.info.origin.position.x, _x.grid.info.origin.position.y, _x.grid.info.origin.position.z, _x.grid.info.origin.orientation.x, _x.grid.info.origin.orientation.y, _x.grid.info.origin.orientation.z, _x.grid.info.origin.orientation.w))
      length = len(self.grid.data)
      buff.write(_struct_I.pack(length))
      pattern = '<%sb'%length
      buff.write(struct.pack(pattern, *self.grid.data))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.info is None:
        self.info = tele_presence.msg.MapListEntry()
      if self.grid is None:
        self.grid = nav_msgs.msg.OccupancyGrid()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.name = str[start:end].decode('utf-8')
      else:
        self.info.name = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.session_id = str[start:end].decode('utf-8')
      else:
        self.info.session_id = str[start:end]
      start = end
      end += 8
      (self.info.date,) = _struct_q.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.map_id = str[start:end].decode('utf-8')
      else:
        self.info.map_id = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.grid.header.seq, _x.grid.header.stamp.secs, _x.grid.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.grid.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.grid.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 76
      (_x.grid.info.map_load_time.secs, _x.grid.info.map_load_time.nsecs, _x.grid.info.resolution, _x.grid.info.width, _x.grid.info.height, _x.grid.info.origin.position.x, _x.grid.info.origin.position.y, _x.grid.info.origin.position.z, _x.grid.info.origin.orientation.x, _x.grid.info.origin.orientation.y, _x.grid.info.origin.orientation.z, _x.grid.info.origin.orientation.w,) = _struct_2If2I7d.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sb'%length
      start = end
      end += struct.calcsize(pattern)
      self.grid.data = struct.unpack(pattern, str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.info.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.info.session_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_struct_q.pack(self.info.date))
      _x = self.info.map_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_3I.pack(_x.grid.header.seq, _x.grid.header.stamp.secs, _x.grid.header.stamp.nsecs))
      _x = self.grid.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_2If2I7d.pack(_x.grid.info.map_load_time.secs, _x.grid.info.map_load_time.nsecs, _x.grid.info.resolution, _x.grid.info.width, _x.grid.info.height, _x.grid.info.origin.position.x, _x.grid.info.origin.position.y, _x.grid.info.origin.position.z, _x.grid.info.origin.orientation.x, _x.grid.info.origin.orientation.y, _x.grid.info.origin.orientation.z, _x.grid.info.origin.orientation.w))
      length = len(self.grid.data)
      buff.write(_struct_I.pack(length))
      pattern = '<%sb'%length
      buff.write(self.grid.data.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.info is None:
        self.info = tele_presence.msg.MapListEntry()
      if self.grid is None:
        self.grid = nav_msgs.msg.OccupancyGrid()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.name = str[start:end].decode('utf-8')
      else:
        self.info.name = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.session_id = str[start:end].decode('utf-8')
      else:
        self.info.session_id = str[start:end]
      start = end
      end += 8
      (self.info.date,) = _struct_q.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.map_id = str[start:end].decode('utf-8')
      else:
        self.info.map_id = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.grid.header.seq, _x.grid.header.stamp.secs, _x.grid.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.grid.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.grid.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 76
      (_x.grid.info.map_load_time.secs, _x.grid.info.map_load_time.nsecs, _x.grid.info.resolution, _x.grid.info.width, _x.grid.info.height, _x.grid.info.origin.position.x, _x.grid.info.origin.position.y, _x.grid.info.origin.position.z, _x.grid.info.origin.orientation.x, _x.grid.info.origin.orientation.y, _x.grid.info.origin.orientation.z, _x.grid.info.origin.orientation.w,) = _struct_2If2I7d.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sb'%length
      start = end
      end += struct.calcsize(pattern)
      self.grid.data = numpy.frombuffer(str[start:end], dtype=numpy.int8, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_q = struct.Struct("<q")
_struct_3I = struct.Struct("<3I")
_struct_2If2I7d = struct.Struct("<2If2I7d")
