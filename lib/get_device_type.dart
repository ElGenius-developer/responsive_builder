part of responsive_widget;

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  switch (orientation) {
    case Orientation.landscape:
      width = mediaQueryData.size.height;
      break;
    case Orientation.portrait:
      width = mediaQueryData.size.width;
      break;
  }
  if (width >= 900) {
    return DeviceType.Desktop;
  } 
    if (width > 600 && width < 900 ) {
    return DeviceType.Tablet;
  } 
    if(width >200 && width < 600 ){
    return DeviceType.Mobile;
   }

    return DeviceType.Watch;
  
  
}
