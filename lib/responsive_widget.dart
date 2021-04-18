
library responsive_widget;

import 'package:flutter/material.dart';
part 'device_info.dart';
part 'device_type_enum.dart';
part 'get_device_type.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;
  final double width, height;
  const ResponsiveWidget({Key key, this.builder,this.width, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
    /*  width: width ?? mediaQuery.size.width,
      height: height ?? mediaQuery.size.height,*/
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
              mediaQuery: mediaQuery
          );
          return Container(

              child: builder(context, deviceInfo));
        },
      ),
    );
  }
}
