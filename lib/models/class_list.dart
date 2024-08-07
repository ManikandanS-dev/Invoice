import 'dart:convert';

class ClassList {
  final String sdaList;
  final double fees;
  ClassList({
    required this.sdaList,
    required this.fees,
  });

  ClassList copyWith({
    String? sdaList,
    double? fees,
  }) {
    return ClassList(
      sdaList: sdaList ?? this.sdaList,
      fees: fees ?? this.fees,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sdaList': sdaList,
      'fees': fees,
    };
  }

  factory ClassList.fromMap(Map<String, dynamic> map) {
    return ClassList(
      sdaList: map['sdaList'] ?? '',
      fees: map['fees']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassList.fromJson(String source) =>
      ClassList.fromMap(json.decode(source));

  @override
  String toString() => 'ClassList(sdaList: $sdaList, fees: $fees)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassList && other.sdaList == sdaList && other.fees == fees;
  }

  @override
  int get hashCode => sdaList.hashCode ^ fees.hashCode;
}
