class ProcessModel {
  ProcessModel({
    required this.id,
    required this.pid,
    required this.name,
  });

  int id;
  int pid;
  String name;

  factory ProcessModel.fromJson(Map<String, dynamic> json) {
    return ProcessModel(
      id: json['id'] as int,
      pid: json['pid'] as int,
      name: json['name'] as String,
    );
  }
}
