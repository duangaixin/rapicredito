import 'package:android_intent_plus/android_intent.dart';
import 'package:rapicredito/page/dialog/no_net_dialog.dart';
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

  showNoNetDialog() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      return;
    }
    Get.dialog(NoNetDialog(
      clickConfirm: () {
        const intent =
            AndroidIntent(action: 'android.settings.AIRPLANE_MODE_SETTINGS');
        intent.launch();
      },
    ),
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: false);
  }
}
