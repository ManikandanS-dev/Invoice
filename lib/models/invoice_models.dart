import 'dart:convert';

class InvoiceModels {
  final String id;
  final String sudentName;
  final String std;
  final String section;
  final String parentName;
  final String phoneNumber;
  final String addres;
  final double totalFees;
  final double amound;
  InvoiceModels({
    required this.id,
    required this.sudentName,
    required this.std,
    required this.section,
    required this.parentName,
    required this.phoneNumber,
    required this.addres,
    required this.totalFees,
    required this.amound,
  });

  InvoiceModels copyWith({
    String? id,
    String? sudentName,
    String? std,
    String? section,
    String? parentName,
    String? phoneNumber,
    String? addres,
    double? totalFees,
    double? amound,
  }) {
    return InvoiceModels(
      id: id ?? this.id,
      sudentName: sudentName ?? this.sudentName,
      std: std ?? this.std,
      section: section ?? this.section,
      parentName: parentName ?? this.parentName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      addres: addres ?? this.addres,
      totalFees: totalFees ?? this.totalFees,
      amound: amound ?? this.amound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sudentName': sudentName,
      'std': std,
      'section': section,
      'parentName': parentName,
      'phoneNumber': phoneNumber,
      'addres': addres,
      'totalFees': totalFees,
      'amound': amound,
    };
  }

  factory InvoiceModels.fromMap(Map<String, dynamic> map) {
    return InvoiceModels(
      id: map['id'] ?? '',
      sudentName: map['sudentName'] ?? '',
      std: map['std'] ?? '',
      section: map['section'] ?? '',
      parentName: map['parentName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      addres: map['addres'] ?? '',
      totalFees: map['totalFees']?.toDouble() ?? 0.0,
      amound: map['amound']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModels.fromJson(String source) =>
      InvoiceModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InvoiceModels(id: $id, sudentName: $sudentName, std: $std, section: $section, parentName: $parentName, phoneNumber: $phoneNumber, addres: $addres, totalFees: $totalFees, amound: $amound)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InvoiceModels &&
        other.id == id &&
        other.sudentName == sudentName &&
        other.std == std &&
        other.section == section &&
        other.parentName == parentName &&
        other.phoneNumber == phoneNumber &&
        other.addres == addres &&
        other.totalFees == totalFees &&
        other.amound == amound;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sudentName.hashCode ^
        std.hashCode ^
        section.hashCode ^
        parentName.hashCode ^
        phoneNumber.hashCode ^
        addres.hashCode ^
        totalFees.hashCode ^
        amound.hashCode;
  }
}

class RePay {
  final double payamound;
  RePay({
    required this.payamound,
  });

  RePay copyWith({
    double? payamound,
  }) {
    return RePay(
      payamound: payamound ?? this.payamound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'payamound': payamound,
    };
  }

  factory RePay.fromMap(Map<String, dynamic> map) {
    return RePay(
      payamound: map['payamound']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RePay.fromJson(String source) => RePay.fromMap(json.decode(source));

  @override
  String toString() => 'RePay(payamound: $payamound)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RePay && other.payamound == payamound;
  }

  @override
  int get hashCode => payamound.hashCode;
}
