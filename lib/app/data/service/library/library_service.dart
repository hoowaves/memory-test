import 'dart:ffi';

import 'package:get/get.dart';
import 'package:hoowave_memory_editor/env.dart';

class LibraryService extends GetxService {
  late DynamicLibrary dylib;
  final RxBool isLoaded = false.obs;

  LibraryService() {
    try {
      dylib = DynamicLibrary.open(Env.libName);
      isLoaded.value = true;
    } catch (e) {
      isLoaded.value = false;
    }
  }

  bool getLoadStatus(){
    return isLoaded.value;
  }
}
