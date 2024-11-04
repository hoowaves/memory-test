import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/data/service/library/library_service.dart';
import 'package:hoowave_memory_editor/app/data/service/process/process_service.dart';
import 'package:hoowave_memory_editor/app/routes/app_pages.dart';

import '../../../../env.dart';
import '../../widgets/common_dialog.dart';

class ProcessController extends GetxController {
  final ProcessService processService;

  ProcessController(this.processService);

  final Env _env = Env.instance;
  final ScrollController scrollController = ScrollController();
  final RxList<String> processList = [
    "1 process1",
    "2 process2",
    "3 process3",
    "4 process4",
    "5 process5",
    "6 process6",
    "7 process7",
    "8 process8",
    "9 process9",
    "10 process10",
    "11 process11",
    "12 process12",
    "13 process13",
    "14 process14",
    "15 process15",
  ].obs;
  final RxInt selectedProcessIndex = 65535.obs;

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
    final processList = processService.fetchProcessList();

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
