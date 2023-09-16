package com.zy.devicesinfo

import android.app.Application
import android.content.Context
import android.text.TextUtils
import com.google.gson.Gson
import com.zy.devicesinfo.data.AppListDataArmour
import com.zy.devicesinfo.data.BatteryStatusData
import com.zy.devicesinfo.data.GeneralData
import com.zy.devicesinfo.data.HardwareData
import com.zy.devicesinfo.data.LocationAddressData
import com.zy.devicesinfo.data.MediaFilesData
import com.zy.devicesinfo.data.NetWorkData
import com.zy.devicesinfo.data.OtherData
import com.zy.devicesinfo.data.PhotoData
import com.zy.devicesinfo.data.SimCardData
import com.zy.devicesinfo.data.StorageData
import com.zy.devicesinfo.utils.AccountDataUtil
import com.zy.devicesinfo.utils.CalendarDataUtil
import com.zy.devicesinfo.utils.EncryptionUtil
import com.zy.devicesinfo.utils.IpUtil
import com.zy.devicesinfo.utils.PhotoDataUtil
import com.zy.devicesinfo.utils.SmsDataUtil
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class MethodCallHandlerImpl(private var context: Context) : MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "initApp" -> {
                UtilsApp.init(context.applicationContext as Application)
            }

            "getGeneralData" -> {
                val deviceInfo = GeneralData()
                result.success(Gson().toJson(deviceInfo))
            }

            "getAppListDataArmour" -> {
                val appListData = AppListDataArmour.getAppListData()
                result.success(Gson().toJson(appListData))
            }

            "getBatteryStatusData" -> {
                val batteryStatusData = BatteryStatusData()
                result.success(Gson().toJson(batteryStatusData))
            }

            "getContactDataArmour" -> {
                //获取联系人信息
            }

            "getHardwareData" -> {
                val hardwareData = HardwareData()
                result.success(Gson().toJson(hardwareData))
            }

            "getLocationAddressData" -> {
                val locationAddressData = LocationAddressData()
                result.success(Gson().toJson(locationAddressData))

            }

            "getMediaFilesData" -> {
                val mediaFilesData = MediaFilesData()
                result.success(Gson().toJson(mediaFilesData))
            }

            "getNetWorkData" -> {
                val netWorkData = NetWorkData()
                result.success(Gson().toJson(netWorkData))
            }

            "getSimCardData" -> {
                val simCardData = SimCardData()
                result.success(Gson().toJson(simCardData))

            }

            "getOtherData" -> {
                val otherData = OtherData()
                result.success(Gson().toJson(otherData))

            }

            "getStorageData" -> {
                val storageData = StorageData()
                result.success(Gson().toJson(storageData))
            }

            "getSmsData" -> {
                val smsData = SmsDataUtil.receiveSms()
                result.success(Gson().toJson(smsData))
            }

            "getCalendarData" -> {
                val calendarData = CalendarDataUtil.getCalenderList()
                result.success(Gson().toJson(calendarData))
            }

            "getAccountData" -> {
                val accountData = AccountDataUtil.getAccountList()
                result.success(Gson().toJson(accountData))
            }

            "getPhotoData" -> {
                val photoListData = PhotoDataUtil.getPhotoListData()
                result.success(Gson().toJson(photoListData))
            }

            "getIpData" -> {
                val ipData = IpUtil.getIpData();
                result.success(Gson().toJson(ipData))
            }

            "encryptAes" -> {
                var param = call.arguments
                if (param != null && param is Map<*, *> && param.isNotEmpty()) {
                    if (param.containsKey("jsonStr")) {
                        val jsonStr = param["jsonStr"] as String?
                        if (!TextUtils.isEmpty(jsonStr)) {
                            val str = EncryptionUtil.compress(jsonStr)
                            val aesStr = EncryptionUtil.aesStr(str)
                            result.success(aesStr)
                        } else {
                            result.success("")
                        }


                    }
                }else{
                    result.success("")
                }
            }

            else -> {
                result.notImplemented()
            }
        }
    }
}