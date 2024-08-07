import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.width(context, mobileWidth: 8),
          vertical: Responsive.height(context, mobileHight: 11)),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFF1264FF),
        highlightColor: const Color.fromARGB(255, 180, 180, 180),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1264FF),
            borderRadius: BorderRadius.all(
              Radius.circular(
                Responsive.fontAndRadiusSize(context, mobileFontSize: 20),
              ),
            ),
          ),
          width: Responsive.width(context, mobileWidth: 355),
          height: Responsive.height(context, mobileHight: 74),
        ),
      ),
    );
  }
}
