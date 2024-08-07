import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class SchoolContainner extends StatelessWidget {
  const SchoolContainner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: Responsive.height(context, mobileHight: 139),
      width: Responsive.width(context, mobileWidth: 379),
      child: Column(
        children: [
          Responsive.verticalSpacing(context, height: 33),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: Responsive.width(context, mobileWidth: 336),
          //       bottom: Responsive.height(context, mobileHight: 8)),
          //   child: InkWell(
          //     onTap: () {
          //       GoRouter.of(context).pushNamed(RouterName.editSchoolsProfile);
          //     },
          //     child: SvgPicture.asset(
          //       'assets/edit_icon.svg',
          //       height: Responsive.width(context, mobileWidth: 24),
          //       width: Responsive.width(context, mobileWidth: 24),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/school.png',
                  height: Responsive.width(context, mobileWidth: 63),
                  width: Responsive.width(context, mobileWidth: 63),
                ),
                Responsive.horizontalSpacing(context, width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Responsive.height(context, mobileHight: 6)),
                      child: Text(
                        'National Vidyalaya CBSE School',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: Responsive.fontAndRadiusSize(
                              context,
                              mobileFontSize: 15,
                            ),
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Responsive.height(context, mobileHight: 6)),
                      child: Text(
                        'Pudukkottai, Tamil Nadu',
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
                    Text(
                      'principal: Dr. Emily Johnson',
                      softWrap: true,
                      style: TextStyle(
                          fontSize: Responsive.fontAndRadiusSize(
                            context,
                            mobileFontSize: 12,
                          ),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
