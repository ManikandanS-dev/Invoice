import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class SchoolEditScr extends StatefulWidget {
  const SchoolEditScr({super.key});

  @override
  State<SchoolEditScr> createState() => _SchoolEditScrState();
}

class _SchoolEditScrState extends State<SchoolEditScr> {
  final _formKey = GlobalKey<FormState>();
  final schoolName = TextEditingController(text: '');
  final loction = TextEditingController(text: '');
  final principal = TextEditingController(text: '');

  void onSave() {
    final validate = _formKey.currentState!.validate();
    if (!validate) {
      return;
    }
  }

  @override
  void dispose() {
    schoolName;
    loction;
    principal;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget customForm(String name, TextEditingController controll) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.width(context, mobileWidth: 12),
            vertical: Responsive.height(context, mobileHight: 15)),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: controll,
          decoration: InputDecoration(
            labelText: name,
            hintText: '$name:',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter Data';
            }
            return null;
          },
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF040404),
              Color(0xFF012046),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: ListView(
            children: [
              Responsive.verticalSpacing(context, height: 122),
              Center(
                child: Text(
                  'School Profile Edit',
                  softWrap: true,
                  style: TextStyle(
                      fontSize: Responsive.fontAndRadiusSize(
                        context,
                        mobileFontSize: 14,
                      ),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Responsive.verticalSpacing(context, height: 36),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      customForm(
                        "School Name",
                        schoolName,
                      ),
                      customForm("Location", loction),
                      customForm("principal", principal),
                      Responsive.verticalSpacing(context, height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            onSave();
                            // _formKey.currentState!.reset();
                          },
                          child: Container(
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
                                'Submit',
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
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
