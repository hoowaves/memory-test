class ProcessModel {
  ProcessModel({
    required this.pid,
    required this.name,
  });

  final int pid;
  final String name;

  factory ProcessModel.fromJson(Map<String, dynamic> json) {
    return ProcessModel(
      pid: json['pid'] as int,
      name: json['name'] as String,
    );
  }
}