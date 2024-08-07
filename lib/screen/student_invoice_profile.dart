import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/list_class.dart';
import '../models/class_list.dart';
import '../provider/invoice_provider.dart';
import '../utils/responsive.dart';
import 'pdf_previwe.dart';

class StudentInvoiceProfile extends ConsumerStatefulWidget {
  const StudentInvoiceProfile({super.key});

  @override
  ConsumerState<StudentInvoiceProfile> createState() =>
      _StudentInvoiceProfileState();
}

class _StudentInvoiceProfileState extends ConsumerState<StudentInvoiceProfile> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController(text: '');
  final parentName = TextEditingController(text: '');
  final phoneNumber = TextEditingController(text: '');
  final addres = TextEditingController(text: '');
  final amount = TextEditingController(text: '');
  ClassList? valueChang;
  String? section;

  void onSave() async {
    final validate = formKey.currentState!.validate();
    if (!validate) {
      return;
    }

    ref.read(addInvoiceProviderProvider.notifier).addInvoice(
        sudentName: name.value.text,
        std: valueChang!.sdaList,
        section: section!,
        parentName: parentName.value.text,
        phoneNumber: phoneNumber.value.text,
        addres: addres.value.text,
        totalFees: valueChang!.fees,
        amound: double.parse(amount.value.text));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return PdfPreviwe(
          sudentName: name.value.text,
          std: valueChang?.sdaList ?? '',
          section: section ?? '',
          parentName: parentName.value.text,
          phoneNumber: phoneNumber.value.text,
          addres: addres.value.text,
          totalFees: valueChang?.fees ?? 0,
          amound: double.parse(amount.value.text),
        );
      },
    )).then(
      (value) {
        name.text = '';
        parentName.text = '';
        phoneNumber.text = '';
        addres.text = '';
        amount.text = '0';
      },
    );
  }

  @override
  void dispose() {
    name;
    parentName;
    phoneNumber;
    addres;
    amount;

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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Responsive.verticalSpacing(context, height: 65),
                  Center(
                    child: Text(
                      'Create Invoice',
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
                  customForm('Studen Name', name),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.width(context, mobileWidth: 12),
                        vertical: Responsive.height(context, mobileHight: 15)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: const Color.fromARGB(
                                        255, 184, 183, 183))),
                            child: DropdownButton(
                              underline: const SizedBox.shrink(),
                              isExpanded: true,
                              hint: Text(
                                'Select  STD',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: Responsive.fontAndRadiusSize(
                                      context,
                                      mobileFontSize: 14,
                                    ),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              value: valueChang,
                              items: listClass.map(
                                (e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Center(
                                      child: Text(
                                        e.sdaList,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize:
                                                Responsive.fontAndRadiusSize(
                                              context,
                                              mobileFontSize: 14,
                                            ),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                setState(() {
                                  valueChang = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Responsive.horizontalSpacing(context, width: 12),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: const Color.fromARGB(
                                        255, 184, 183, 183))),
                            child: DropdownButton(
                              underline: const SizedBox.shrink(),
                              isExpanded: true,
                              hint: Text(
                                'Select  Section',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: Responsive.fontAndRadiusSize(
                                      context,
                                      mobileFontSize: 14,
                                    ),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              value: section,
                              items: sectionList.map(
                                (e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Center(
                                      child: Text(
                                        e,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize:
                                                Responsive.fontAndRadiusSize(
                                              context,
                                              mobileFontSize: 14,
                                            ),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                setState(() {
                                  section = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  customForm('Parent Name', parentName),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.width(context, mobileWidth: 12),
                        vertical: Responsive.height(context, mobileHight: 15)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Phone Number:',
                        border: OutlineInputBorder(
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
                  ),
                  customForm('Addres', addres),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.width(context, mobileWidth: 12),
                        vertical: Responsive.height(context, mobileHight: 15)),
                    child: Container(
                      width: double.infinity,
                      height: Responsive.height(context, mobileHight: 43),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 184, 183, 183))),
                      child: Center(
                        child: Text(
                          'Total Fees : ${valueChang?.fees.toString() ?? ''} ',
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.width(context, mobileWidth: 12),
                        vertical: Responsive.height(context, mobileHight: 15)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      controller: amount,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        hintText: 'Amonut:',
                        border: OutlineInputBorder(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: InkWell(
                      onTap: () {
                        onSave();
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
                            'Invoice PDF',
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
                  Responsive.verticalSpacing(context, height: 65),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
