part of'../responsive_builder.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  try {
    if (orientation == Orientation.landscape) {
      if (Platform.isAndroid || Platform.isIOS) {
        width = mediaQueryData.size.height;
      }
    } else {
      width = mediaQueryData.size.width;
    }
  } catch (error) {
    width = mediaQueryData.size.width;
  }
  if (width >= 900) {
    return DeviceType.Desktop;
  }
  if (width > 600 && width < 900) {
    return DeviceType.Tablet;
  }
  if (width > 200 && width < 600) {
    return DeviceType.Mobile;
  }

  return DeviceType.Watch;
}
