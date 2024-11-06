import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

enum MemoryFormat { byte, twoByte, fourByte, hex }

class MemoryModel {
  MemoryModel({required this.address, required this.value});

  final int address;
  final int? value;
  final TextEditingController addressController = TextEditingController();
  Rx<MemoryFormat> selectedFormat = Rx<MemoryFormat>(MemoryFormat.fourByte);

  factory MemoryModel.fromJson(Map<String, dynamic> json) {
    return MemoryModel(
      address: json['address'] as int,
      value: json['value'] as int,
    );
  }

  String formatValue(int value) {
    switch (selectedFormat.value) {
      case MemoryFormat.byte:
        return value.toString();
      case MemoryFormat.twoByte:
        return (value & 0xFFFF).toRadixString(16);
      case MemoryFormat.fourByte:
        return (value & 0xFFFFFFFF).toRadixString(16);
      case MemoryFormat.hex:
        return value.toRadixString(16);
      default:
        return value.toString();
    }
  }
}
