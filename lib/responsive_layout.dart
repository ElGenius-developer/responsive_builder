part of 'responsive_builder.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  final Widget? watch;
  ResponsiveLayout(
      {required this.desktop, required this.mobile, required this.tablet , this.watch});
  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = getDeviceType(MediaQuery.of(context));
    print(deviceType);
    switch (deviceType) {
      case DeviceType.Mobile:
        return mobile;
      case DeviceType.Tablet:
        return tablet;
      case DeviceType.Desktop:
        return desktop;
      case DeviceType.Watch:
        return watch??Container();
     }
  }
}
