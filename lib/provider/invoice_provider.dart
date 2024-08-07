import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/invoice_models.dart';
import 'add_invoice_repositorise.dart';

part 'invoice_provider.g.dart';

@riverpod
class AddInvoiceProvider extends _$AddInvoiceProvider {
  @override
  FutureOr<List<InvoiceModels>> build() {
    return getList();
  }

  Future<List<InvoiceModels>> getList() async {
    state = const AsyncLoading();
    return await ref.watch(invoiceRepoitoriesproviderProvider).getInvoice();
  }

  Future<void> addInvoice({
    required String sudentName,
    required String std,
    required String section,
    required String parentName,
    required String phoneNumber,
    required String addres,
    required double totalFees,
    required double amound,
  }) async {
    final id = await ref.watch(invoiceRepoitoriesproviderProvider).addInvoice(
          sudentName: sudentName,
          std: std,
          section: section,
          parentName: parentName,
          phoneNumber: phoneNumber,
          addres: addres,
          totalFees: totalFees,
          amound: amound,
        );
    state = AsyncData([
      InvoiceModels(
          id: id,
          sudentName: sudentName,
          std: std,
          section: section,
          parentName: parentName,
          phoneNumber: phoneNumber,
          addres: addres,
          totalFees: totalFees,
          amound: amound),
      ...?state.value
    ]);
  }

  void delete(String id) {
    ref.watch(invoiceRepoitoriesproviderProvider).delete(id);
    var data = (state.value!.where(
      (element) {
        if (element.id != id) {
          return true;
        } else {
          return false;
        }
      },
    ).toList());
    state = AsyncData(data);
  }

  void udated(String id, double amound) {
    ref.watch(invoiceRepoitoriesproviderProvider).edit(id, amound);
    var data = [
      for (var i in state.value!) i.id == id ? i.copyWith(amound: amound) : i
    ];
    state = AsyncData(data);
  }
}
