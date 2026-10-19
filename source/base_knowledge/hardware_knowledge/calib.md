# キャリブレーションについて

## ros2 camera_info

型はsensor_msgs/msg/CameraInfoである

```bash
std_msgs/msg/Header header
uint32 height
uint32 width
string distortion_model
double[] d
double[9] k
double[9] r
double[12] p
uint32 binning_x
uint32 binning_y
sensor_msgs/msg/RegionOfInterest roi
```

1. std_msgs/msg/Header_header

std_msgs/msg/Headerではタイムスタンプと

```bash
builtin_interfaces/Time stamp
string frame_id
```

2.
