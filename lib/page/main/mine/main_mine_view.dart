import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_keep_state_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/mine/index.dart';
import 'package:rapicredito/page/main/mine/widget/common_setting_click_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/custom_image_view.dart';
import 'package:rapicredito/widget/pull_to_refresh_view.dart';

class MainMinePage extends GetKeepStateView<MainMineCtr> {
  const MainMinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PullToRefreshView(
        ctr.refreshController,
        onRefresh: ctr.refreshInfo,
        enablePullUp: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainAppBarView(
                title: 'RapiCrédito',
              ),
              headerView,
              contentView
            ],
          ),
        ),
      ),
    );
  }

  Widget get headerView => Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 16.0, right: 16.0, bottom: 26.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              var imageUrl = ctr.state.userImageUrl;
              var isUrlNotExist = ObjectUtil.isEmptyString(imageUrl);
              return Visibility(
                  visible: isUrlNotExist,
                  child: const CustomImageView(
                    Resource.assetsImageLogo,
                    imageType: ImageType.assets,
                    shape: BoxShape.circle,
                    memCacheHeight: 75,
                    memCacheWidth: 75,
                    width: 75.0,
                    height: 75.0,
                    margin: EdgeInsets.only(right: 23.0, left: 7.0),
                  ));
            }),
            Obx(() {
              var imageUrl = ctr.state.userImageUrl;
              var isUrlNotExist = ObjectUtil.isEmptyString(imageUrl);
              return Visibility(
                  visible: !isUrlNotExist,
                  child: CustomImageView(
                    imageUrl,
                    placeholder: Resource.assetsImageLogo,
                    shape: BoxShape.circle,
                    memCacheHeight: 75,
                    memCacheWidth: 75,
                    width: 75.0,
                    height: 75.0,
                    margin: const EdgeInsets.only(right: 23.0, left: 7.0),
                  ));
            }),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return Text(
                    ctr.state.userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color(0xff333333)),
                  );
                }),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Obx(() {
                      return Text(
                        '+57 ${ctr.state.phoneNum}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff333333),
                        ),
                      );
                    }))
              ],
            ))
          ],
        ),
      );

  Widget get contentView => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 18.0),
              height: 1.0,
              width: double.infinity,
              color: const Color(0xffE9E9E9),
            ),
            CommonSettingClickView(
              iconHeight: 24.0,
              iconWith: 22,
              iconPath: Resource.assetsImageMineSetting,
              onTap: ctr.goToSettingPage,
              content: 'Ajuste',
            ),
            CommonSettingClickView(
              iconHeight: 25.0,
              iconWith: 24.0,
              iconPath: Resource.assetsImageMinePhone,
              onTap: ctr.goToClientPage,
              content: 'client'.tr,
            ),
            CommonSettingClickView(
              iconHeight: 22,
              iconWith: 22,
              iconPath: Resource.assetsImageMineSignAgreement,
              onTap: () {
                ctr.goToWebViewPage('Aviso de Privacidad',
                    'https://test.rapicreditoco.com/rapicreditos/privacy.html');
              },
              content: 'Avisos de Privacidad',
            ),
            CommonSettingClickView(
              iconHeight: 22,
              iconWith: 22,
              iconPath: Resource.assetsImageMineClient,
              onTap: ctr.goToChatPage,
              content: 'Servicio al cliente en línea',
            ),
            CommonSettingClickView(
              iconHeight: 24.0,
              iconWith: 25.0,
              iconPath: Resource.assetsImageMineSupplyAgreement,
              onTap: () {
                //  ctr.goToTestPage();
                ctr.goToWebViewPage('Terminos y Condiciones',
                    'https://test.rapicreditoco.com/rapicreditos/Term.html');
              },
              content: 'Atención al cliente',
            ),
          ],
        ),
      );
}
