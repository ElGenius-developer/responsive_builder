part of responsive_builder;

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;

  if (orientation == Orientation.landscape) {
    if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
      width = mediaQueryData.size.height;
    }
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 900) {
    return DeviceType.Desktop;
  } else if (width > 600) {
    return DeviceType.Tablet;
  } else if (width > 200) {
    return DeviceType.Mobile;
  } else
    return DeviceType.Watch;
}
