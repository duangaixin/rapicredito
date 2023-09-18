package com.zy.devicesinfo;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Intent;
import android.content.IntentFilter;
import android.util.Log;

import com.zy.devicesinfo.broadcast.BatteryBroadcastReceiver;
import com.zy.devicesinfo.data.BatteryStatusData;
import com.zy.devicesinfo.utils.GeneralUtils;

public class UtilsApp {


    @SuppressLint("StaticFieldLeak")
    private static Application sApp;
    /**
     * 全局设备Id
     */
    public static String deviceId = "";
    /**
     * 电池信息
     */
    public static BatteryStatusData batteryStatusData;
    /**
     * 通过广播获取电池信息
     */
    public static BatteryBroadcastReceiver batteryBroadcastReceiver;

    public static boolean mRegisterTag = false;

    public static void init(final Application app) {
        if (app == null) {
            Log.e("Utils", "app is null.");
            return;
        }
        if (sApp == null) {
            sApp = app;
            GeneralUtils.getGaid();
            initBroadcaster();
        }
    }


    public static Application getApp() {
        if (sApp != null) return sApp;
        if (sApp == null) throw new NullPointerException("reflect failed.");
        return sApp;
    }

    public static void initBroadcaster() {
        batteryBroadcastReceiver = new BatteryBroadcastReceiver();
        IntentFilter intent = new IntentFilter();
        intent.addAction(Intent.ACTION_BATTERY_CHANGED);
        UtilsApp.getApp().registerReceiver(batteryBroadcastReceiver, intent);
        mRegisterTag = true;
    }


    public static void removeBroadcaster() {
        if (mRegisterTag) {
            UtilsApp.getApp().unregisterReceiver(batteryBroadcastReceiver);
            mRegisterTag = false;
        }
    }

}
