import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../router/router_name.dart';
import '../utils/responsive.dart';

class NevBar extends StatelessWidget {
  const NevBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Responsive.width(context, mobileWidth: 40)),
      child: BottomAppBar(
        color: const Color.fromARGB(255, 8, 38, 77),
        height: Responsive.height(context, mobileHight: 47),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).goNamed(RouterName.home);
              },
              child: SvgPicture.asset(
                'assets/home_icon.svg',
                height: Responsive.width(context, mobileWidth: 24),
                width: Responsive.width(context, mobileWidth: 24),
              ),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).goNamed(RouterName.invoiceScren);
              },
              child: SvgPicture.asset(
                'assets/icon2.svg',
                height: Responsive.width(context, mobileWidth: 24),
                width: Responsive.width(context, mobileWidth: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
