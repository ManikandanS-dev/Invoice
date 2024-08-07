import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/invoice_provider.dart';
import '../screen/pdf_previwe.dart';
import '../utils/responsive.dart';

class InvoiceContainer extends ConsumerStatefulWidget {
  const InvoiceContainer(
    this.id, {
    super.key,
    required this.name,
    required this.sdt,
    required this.totalFees,
    required this.amoundPay,
    required this.section,
    required this.parentName,
    required this.phoneNumber,
    required this.address,
  });
  final String name;
  final String section;
  final String sdt;
  final String id;
  final double totalFees;
  final double amoundPay;
  final String parentName;
  final String phoneNumber;
  final String address;
  @override
  ConsumerState<InvoiceContainer> createState() => _InvoiceContainerState();
}

class _InvoiceContainerState extends ConsumerState<InvoiceContainer> {
  final amount = TextEditingController(text: '');

  @override
  void dispose() {
    amount;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> editAmout() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(addInvoiceProviderProvider.notifier)
                      .udated(widget.id, double.parse(amount.value.text));
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Responsive.height(context, mobileHight: 8)),
                child: Text(
                  'Name: ${widget.name}',
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
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Responsive.height(context, mobileHight: 8)),
                child: Text(
                  'Total Fees: ${widget.totalFees}',
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
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Responsive.height(context, mobileHight: 8)),
                child: Text(
                  'Amound Pay:  ${widget.amoundPay}',
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
              // Padding
              TextField(
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
              ),
            ],
          ),
          title: Text(
            'Edit Balence',
            style: TextStyle(
                fontSize: Responsive.fontAndRadiusSize(
                  context,
                  mobileFontSize: 16,
                ),
                color: const Color(0xFF1264FF),
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.width(context, mobileWidth: 8),
          vertical: Responsive.height(context, mobileHight: 11)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PdfPreviwe(
                  sudentName: widget.name,
                  std: widget.sdt,
                  section: widget.section,
                  parentName: widget.parentName,
                  phoneNumber: widget.phoneNumber,
                  addres: widget.address,
                  totalFees: widget.totalFees,
                  amound: widget.amoundPay,
                );
              },
            ),
          );
        },
        child: Container(
            width: Responsive.width(context, mobileWidth: 355),
            height: Responsive.height(context, mobileHight: 200),
            decoration: BoxDecoration(
              color: const Color(0xFF1264FF),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Responsive.fontAndRadiusSize(context, mobileFontSize: 20),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.width(context, mobileWidth: 18),
                      top: Responsive.height(context, mobileHight: 12)),
                  child: Text(
                    'Name: ${widget.name}',
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
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.width(context, mobileWidth: 18),
                      top: Responsive.height(context, mobileHight: 12)),
                  child: Text(
                    'Class: ${widget.sdt}',
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
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.width(context, mobileWidth: 18),
                      top: Responsive.height(context, mobileHight: 12)),
                  child: Text(
                    'Amound: ${widget.amoundPay}',
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
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.width(context, mobileWidth: 18),
                      top: Responsive.height(context, mobileHight: 12)),
                  child: Text(
                    'Total  Fees: ${widget.totalFees}',
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
                Responsive.verticalSpacing(context, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return PdfPreviwe(
                                sudentName: widget.name,
                                std: widget.sdt,
                                section: widget.section,
                                parentName: widget.parentName,
                                phoneNumber: widget.phoneNumber,
                                addres: widget.address,
                                totalFees: widget.totalFees,
                                amound: widget.amoundPay,
                              );
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.print,
                        size: Responsive.fontAndRadiusSize(context,
                            mobileFontSize: 24),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        editAmout();
                      },
                      icon: Icon(
                        Icons.edit_note_rounded,
                        size: Responsive.fontAndRadiusSize(context,
                            mobileFontSize: 24),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(addInvoiceProviderProvider.notifier)
                            .delete(widget.id);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: Responsive.fontAndRadiusSize(context,
                            mobileFontSize: 24),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
