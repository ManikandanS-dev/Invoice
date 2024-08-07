import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/router_name.dart';
import '../utils/responsive.dart';

class ClassListContainer extends StatelessWidget {
  const ClassListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.width(context, mobileWidth: 370),
      height: Responsive.height(context, mobileHight: 173),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/image0.png',
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: Responsive.height(context, mobileHight: 8),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed(RouterName.sudentProfile);
              },
              child: Container(
                width: Responsive.width(context, mobileWidth: 291),
                height: Responsive.height(context, mobileHight: 43),
                decoration: BoxDecoration(
                  color: const Color(0xFF1264FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Responsive.fontAndRadiusSize(
                        context,
                        mobileFontSize: 23,
                      ),
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Create Invoice',
                    softWrap: true,
                    style: TextStyle(
                        fontSize: Responsive.fontAndRadiusSize(
                          context,
                          mobileFontSize: 12,
                        ),
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
