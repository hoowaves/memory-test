import 'package:get/get.dart';

import '../../../data/service/library/library_service.dart';
import '../controllers/process_controller.dart';

class ProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ProcessController(
        Get.find<LibraryService>(),
      ),
    );
  }
}
