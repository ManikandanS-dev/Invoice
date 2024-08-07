import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/invoice_provider.dart';
import '../widgets/invoice_container.dart';
import '../widgets/loading_container.dart';
import '../widgets/nev_bar.dart';

class InvoiceListScr extends ConsumerWidget {
  const InvoiceListScr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(addInvoiceProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF040404),
            Color(0xFF012046),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: data.when(
          data: (value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return InvoiceContainer(value[index].id,
                  address: value[index].addres,
                  parentName: value[index].parentName,
                  phoneNumber: value[index].phoneNumber,
                  section: value[index].section,
                  totalFees: value[index].totalFees,
                  amoundPay: value[index].amound,
                  name: value[index].sudentName,
                  sdt: value[index].std);
            },
          ),
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () {
            return ListView(
              children: const [
                LoadingContainer(),
                LoadingContainer(),
                LoadingContainer(),
                LoadingContainer(),
              ],
            );
          },
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NevBar(),
    );
  }
}
