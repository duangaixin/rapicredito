import 'package:rapicredito/widget/custom_loading_dialog.dart';
import 'package:get/get.dart';


extension GetExtension on GetInterface {
  dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  showLoading({String text = ''}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(const CustomLoadingDialog(),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: false);
  }
}
