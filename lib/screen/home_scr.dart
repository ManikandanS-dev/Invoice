import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import '../widgets/class_list_container.dart';
import '../widgets/nev_bar.dart';
import '../widgets/recend_invoice.dart';
import '../widgets/school_container.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF040404),
              Color(0xFF012046),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              Responsive.verticalSpacing(context, height: 11),
              const SchoolContainner(),
              Responsive.verticalSpacing(context, height: 17),
              const ClassListContainer(),
              const RecendInvoice(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const NevBar(),
      ),
    );
  }
}
