import 'dart:ffi';
import 'package:get/get.dart';

typedef OpenProcessFunc = Int32 Function(Int32);
typedef OpenProcess = int Function(int);
typedef CloseProcessFunc = Int32 Function(Int32);
typedef CloseProcess = int Function(int);

class ProcessService extends GetxService {
  late DynamicLibrary dylib;
  late OpenProcess openProcess;
  late CloseProcess closeProcess;

  int? currentProcessHandle;

  ProcessService() {
    try {
      dylib = DynamicLibrary.open("process_memory.dll");
      openProcess = dylib
          .lookup<NativeFunction<OpenProcessFunc>>("openProcess")
          .asFunction();
      closeProcess = dylib
          .lookup<NativeFunction<CloseProcessFunc>>("closeProcess")
          .asFunction();
    } catch (e) {
      print(e);
    }
  }

  void openTargetProcess(int processID) {
    currentProcessHandle = openProcess(processID);
  }

  void closeTargetProcess() {
    if (currentProcessHandle != null) {
      closeProcess(currentProcessHandle!);
      currentProcessHandle = null;
    }
  }
}
