library responsive_builder;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
part 'device_info.dart';
part 'device_type_platform_enums.dart';
part 'get_device_type.dart';
part 'responsive_layout.dart';
part 'get_device_platform.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo)? builder;
  const ResponsiveBuilder({
    Key? key,
    this.builder,
  }) : super(key: key);
  @override
  Widget build(BuildContext widgetContext) {
    var mediaQuery = MediaQuery.of(widgetContext);
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          var deviceInfo = DeviceInfo(
              deviceType: getDeviceType(
                mediaQuery,
              ),
              platform: getDevicePlatForm(widgetContext),
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
