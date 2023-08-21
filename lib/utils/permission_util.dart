import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Function(String) defaultCall = (s) {};

  static checkPermission(
      {required List<Permission> permissionList,
      VoidCallback? onSuccess,
      VoidCallback? onFailed,
      VoidCallback? goSetting}) async {
    List<Permission> newPermissionList = [];
    for (Permission permission in permissionList) {
      PermissionStatus status = await permission.status;
      if (!status.isGranted) {
        newPermissionList.add(permission);
      }
    }
    if (newPermissionList.isNotEmpty) {
      PermissionStatus permissionStatus =
          await requestPermission(newPermissionList);

      switch (permissionStatus) {
        case PermissionStatus.denied:
          onFailed != null ? onFailed() : defaultCall('');
          break;
        case PermissionStatus.granted:
          onSuccess != null ? onSuccess() : defaultCall('');
          break;
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
        case PermissionStatus.permanentlyDenied:
        case PermissionStatus.provisional:
          goSetting != null ? goSetting() : openAppSettings();
          break;
      }
    } else {
      onSuccess != null ? onSuccess() : defaultCall("权限申请成功");
    }
  }

  static requestPermission(List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }
}
