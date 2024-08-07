import 'dart:math';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
  });

  final Widget mobile;

  static const Size mobileDesingSize = Size(390, 844);

  static double mediaQueryWith(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static double scaleWidth(BuildContext context) {
    return mediaQueryWith(context) / mobileDesingSize.width;
  }

  static double scaleHight(BuildContext context) {
    double hightRatio = mobileDesingSize.height / mobileDesingSize.width;

    return mediaQueryWith(context) * hightRatio / mobileDesingSize.height;
  }

  static double width(
    BuildContext context, {
    required double mobileWidth,
  }) =>
      mobileWidth * scaleWidth(context);

  static double height(
    BuildContext context, {
    required double mobileHight,
  }) =>
      mobileHight * scaleHight(context);

  static double minWidthHight(BuildContext context, {required double size}) =>
      min(size * scaleWidth(context), size * scaleHight(context));

  static double maxWidthHight(BuildContext context, {required double size}) =>
      max(size * scaleWidth(context), size * scaleHight(context));

  static double fontAndRadiusSize(
    BuildContext context, {
    required double mobileFontSize,
  }) =>
      minWidthHight(context, size: mobileFontSize);

  static Widget horizontalSpacing(BuildContext context,
          {required double width}) =>
      SizedBox(
        width: width * scaleWidth(context),
      );

  static Widget verticalSpacing(BuildContext context,
          {required double height}) =>
      SizedBox(
        height: height * scaleHight(context),
      );

  @override
  Widget build(BuildContext context) {
    return mobile;
  }
}
