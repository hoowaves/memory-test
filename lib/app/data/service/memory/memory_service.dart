import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/data/service/library/library_service.dart';

typedef ReadProcessMemoryFunc = Int32 Function(
    Int32, Pointer<Void>, Pointer<Void>, Int32);
typedef WriteProcessMemoryFunc = Int32 Function(
    Int32, Pointer<Void>, Pointer<Void>, Int32);
typedef ReadProcessMemory = int Function(
    int, Pointer<Void>, Pointer<Void>, int);
typedef WriteProcessMemory = int Function(
    int, Pointer<Void>, Pointer<Void>, int);

class MemoryService extends GetxService {
  final LibraryService libraryService;
  late DynamicLibrary dylib;
  late ReadProcessMemory readProcessMemory;
  late WriteProcessMemory writeProcessMemory;

  MemoryService(this.libraryService) {
    if(libraryService.isLoaded.value == false) return;
    dylib = libraryService.getDylib()!;
    readProcessMemory = dylib
        .lookup<NativeFunction<ReadProcessMemoryFunc>>("readProcessMemory")
        .asFunction();
    writeProcessMemory = dylib
        .lookup<NativeFunction<WriteProcessMemoryFunc>>("writeProcessMemory")
        .asFunction();
  }

  String readMemory(int processHandle, int address, int size) {
    final buffer = malloc<Uint8>(size);
    if (readProcessMemory(
            processHandle, Pointer.fromAddress(address), buffer.cast(), size) !=
        0) {
      final data = buffer.asTypedList(size);
      print(data);
      malloc.free(buffer);
      return data.map((e) => e.toRadixString(16)).join(" ");
    } else {
      malloc.free(buffer);
      return "Failed to read memory";
    }
  }

  bool writeMemory(int processHandle, int address, List<int> data) {
    final buffer = malloc<Uint8>(data.length);
    final typedBuffer = buffer.asTypedList(data.length);
    typedBuffer.setAll(0, data);
    final result = writeProcessMemory(processHandle,
        Pointer.fromAddress(address), buffer.cast(), data.length);
    malloc.free(buffer);
    return result != 0;
  }
}
