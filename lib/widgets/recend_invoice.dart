import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/invoice_provider.dart';
import '../utils/responsive.dart';
import 'invoice_container.dart';
import 'loading_container.dart';

class RecendInvoice extends ConsumerWidget {
  const RecendInvoice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(addInvoiceProviderProvider);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: Responsive.height(
              context,
              mobileHight: 17,
            ),
            bottom: Responsive.height(context, mobileHight: 10)),
        child: Container(
            height: double.infinity,
            width: Responsive.width(context, mobileWidth: 375),
            decoration: BoxDecoration(
              color: const Color(0xFF18181A),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Responsive.fontAndRadiusSize(context, mobileFontSize: 20),
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Responsive.height(context, mobileHight: 10),
                          top: Responsive.height(context, mobileHight: 13),
                          left: Responsive.width(context, mobileWidth: 12)),
                      child: Text(
                        'Recent Invoice',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: Responsive.fontAndRadiusSize(
                              context,
                              mobileFontSize: 14,
                            ),
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                data.when(
                  data: (value) => Expanded(
                    child: ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return InvoiceContainer(value[index].id,
                            totalFees: value[index].totalFees,
                            amoundPay: value[index].amound,
                            name: value[index].sudentName,
                            address: value[index].addres,
                            parentName: value[index].parentName,
                            phoneNumber: value[index].phoneNumber,
                            section: value[index].section,
                            sdt: value[index].std);
                      },
                    ),
                  ),
                  error: (error, stackTrace) => const SizedBox.shrink(),
                  loading: () {
                    return Expanded(
                      child: ListView(
                        children: const [
                          LoadingContainer(),
                          LoadingContainer(),
                          LoadingContainer(),
                          LoadingContainer(),
                        ],
                      ),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }
}
