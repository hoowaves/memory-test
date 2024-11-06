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

  Map<String, dynamic> toJson() {
    return {
      'pid': pid,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'ProcessModel(pid: $pid, name: $name)';
  }
}