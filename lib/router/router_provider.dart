import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import '../screen/home_scr.dart';
import '../screen/invoice_list_scr.dart';
import '../screen/school_edit_scr.dart';
import '../screen/student_invoice_profile.dart';
import 'router_name.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _navigatoreKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _navigatoreKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: RouterName.home,
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
        path: '/editSchoolsProfile',
        name: RouterName.editSchoolsProfile,
        builder: (context, state) => const SchoolEditScr(),
      ),
      GoRoute(
        path: '/SudentProfile',
        name: RouterName.sudentProfile,
        builder: (context, state) => const StudentInvoiceProfile(),
      ),
      GoRoute(
        path: '/invoiceScren',
        name: RouterName.invoiceScren,
        builder: (context, state) => const InvoiceListScr(),
      ),
    ],
  );
}
