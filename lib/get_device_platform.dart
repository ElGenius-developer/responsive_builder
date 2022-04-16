part of 'responsive_builder.dart';

DevicePlatform getDevicePlatForm(BuildContext context) {
  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
      return DevicePlatform.Android;
    case TargetPlatform.fuchsia:
      return DevicePlatform.Fuchsia;
    case TargetPlatform.iOS:
      return DevicePlatform.IOS;
    case TargetPlatform.linux:
      return DevicePlatform.Linux;
    case TargetPlatform.macOS:
      return DevicePlatform.MacOS;
    case TargetPlatform.windows:
      return DevicePlatform.Windows;
    default:
      {
        if (kIsWeb)
          return DevicePlatform.Web;
        else
          return DevicePlatform.Embedded;
      }
  }
}
