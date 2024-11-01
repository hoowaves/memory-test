import 'dart:convert';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/data/service/library/library_service.dart';

typedef OpenProcessFunc = Int32 Function(Int32);
typedef OpenProcess = int Function(int);

typedef CloseProcessFunc = Int32 Function(Int32);
typedef CloseProcess = int Function(int);

typedef GetProcessListFunc = Void Function(Pointer<Void> buffer, Int32 bufferSize);
typedef GetProcessList = void Function(Pointer<Void> buffer, int bufferSize);


class ProcessService extends GetxService {
  final LibraryService libraryService;
  late DynamicLibrary dylib;
  late OpenProcess openProcess;
  late CloseProcess closeProcess;
  late GetProcessList getProcessList;

  int? currentProcessHandle;

  ProcessService(this.libraryService) {
    dylib = libraryService.getDylib();
    openProcess = dylib
        .lookup<NativeFunction<OpenProcessFunc>>("openProcess")
        .asFunction();

    closeProcess = dylib
        .lookup<NativeFunction<CloseProcessFunc>>("closeProcess")
        .asFunction();

    getProcessList = dylib
        .lookup<NativeFunction<GetProcessListFunc>>("getProcessList")
        .asFunction();
  }

  void fetchProcessList() {
    const int bufferSize = 20000;
    final Pointer<Uint8> buffer = calloc<Uint8>(bufferSize);

    getProcessList(buffer.cast<Void>(), bufferSize);

    final resultString = buffer.cast<Utf8>().toDartString();
    print('Process List: $resultString');
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
