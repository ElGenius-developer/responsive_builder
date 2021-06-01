library responsive_builder;
import 'package:flutter/material.dart';
import 'dart:io';
part 'device_info.dart';
part 'get_device_type.dart';
part 'responsive_layout.dart';
part 'device_type_enum.dart';
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo)? builder;
  final double? width, height;
  const ResponsiveBuilder({Key? key, this.builder, this.width, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          var deviceInfo = DeviceInfo(
              deviceType: getDeviceType(
                mediaQuery,
              ),
              screenHeight: mediaQuery.size.height,
              screenWidth: mediaQuery.size.width,
              localHeight: constraints.maxHeight,
              localWidth: constraints.maxWidth,
              orientation: mediaQuery.orientation,
              mediaQuery: mediaQuery);
          return Container(child: builder!(context, deviceInfo));
        },
      ),
    );
  }
}
