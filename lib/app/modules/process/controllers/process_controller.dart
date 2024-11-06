import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/data/service/library/library_service.dart';
import 'package:hoowave_memory_editor/app/data/service/process/process_service.dart';
import 'package:hoowave_memory_editor/app/routes/app_pages.dart';

import '../../../../env.dart';
import '../../../data/model/process_model.dart';
import '../../widgets/common_dialog.dart';

class ProcessController extends GetxController {
  final ProcessService processService;

  ProcessController(this.processService);

  final Env _env = Env.instance;
  final ScrollController scrollController = ScrollController();
  final RxInt selectedProcessIndex = 65535.obs;
  final RxList<ProcessModel> processList = <ProcessModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (!processService.libraryService.getLoadStatus()) {
      CommonDialog.error(
          content: "${_env.getLibName()} Not Load",
          onRetryPressed: () {
            Get.back();
          });
    }
    processList.value = processService.fetchApplicationList();
    for (var process in processList) {
      print(process);
    }

  }

  @override
  void onClose() {
    super.onClose();
  }

  void pushMemory(){
    if(selectedProcessIndex.value == 65535) return;
    Get.toNamed(Routes.MEMORY);
  }
}
