class MemoryModel {
  MemoryModel({
    required this.processId,
    required this.address,
    this.data,
    required this.size,
    this.success,
  });

  int processId;
  int address;
  List<int>? data;
  int size;
  bool? success;

  factory MemoryModel.fromJson(Map<String, dynamic> json) {
    return MemoryModel(
      processId: json['processId'] as int,
      address: json['address'] as int,
      data: json['data'] != null ? List<int>.from(json['data']) : null,
      size: json['size'] as int,
      success: json['success'] as bool?,
    );
  }
}