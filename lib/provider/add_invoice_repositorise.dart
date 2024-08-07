import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/invoice_models.dart';

part 'add_invoice_repositorise.g.dart';

final fireStore = FirebaseFirestore.instance;

@riverpod
InvoiceRepoitories invoiceRepoitoriesprovider(
    InvoiceRepoitoriesproviderRef ref) {
  return InvoiceRepoitories();
}

class InvoiceRepoitories {
  Future<String> addInvoice({
    required String sudentName,
    required String std,
    required String section,
    required String parentName,
    required String phoneNumber,
    required String addres,
    required double totalFees,
    required double amound,
  }) async {
    final data = await fireStore.collection('Invoice').add(InvoiceModels(
            id: DateTime.timestamp().toString(),
            sudentName: sudentName,
            std: std,
            section: section,
            parentName: parentName,
            phoneNumber: phoneNumber,
            addres: addres,
            totalFees: totalFees,
            amound: amound)
        .toMap());
    return data.id;
  }

  Future<List<InvoiceModels>> getInvoice() async {
    final data = await fireStore.collection('Invoice').get();
    final fdata = [
      for (var i in data.docs)
        InvoiceModels.fromMap(i.data()).copyWith(id: i.id)
    ];
    return fdata;
  }

  void delete(String id) {
    fireStore.collection('Invoice').doc(id).delete();
  }

  void edit(String id, double amound) {
    fireStore.collection('Invoice').doc(id).update({'amound': amound});
  }
}
