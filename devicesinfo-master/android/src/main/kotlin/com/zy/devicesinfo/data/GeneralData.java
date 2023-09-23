package com.zy.devicesinfo.data;

import static com.zy.devicesinfo.utils.NetWorkUtils.getMyMacAddress;
import static com.zy.devicesinfo.utils.OtherUtils.getIsWifiProxy;
import static com.zy.devicesinfo.utils.OtherUtils.getSensorList;
import static com.zy.devicesinfo.utils.OtherUtils.isAppDebug;

import android.os.Build;
import android.os.SystemClock;

import com.zy.devicesinfo.utils.GeneralUtils;
import com.zy.devicesinfo.utils.LanguageUtils;
import com.zy.devicesinfo.utils.NetWorkUtils;
import com.zy.devicesinfo.utils.OtherUtils;

import java.util.List;

public class GeneralData {


    public String androidId;
    public String gaid;
    public String networkOperatorName;
    public String networkOperator;
    public String networkType;
    public String phoneType;
    public String mcc;
    public String bluetoothMac;
    public String mnc;
    public String localeIso3Language;
    public String localeIso3Country;
    public String timeZoneId;
    public String localeDisplayLanguage;
    public String cid;
    public String dns;
    public String uuid;
    public int slotCount;
    public String meid;
    public String imei1;
    public String imei2;
    public String mac;
    public String language;
    public String uiModeType;
    public String securityPatch;
    public Long elapsedRealtime;
    public List<SensorData.SensorInfo> sensorList;
    public int isUsingProxyPort;
    public int isUsbDebug;
    {
        elapsedRealtime = SystemClock.elapsedRealtime();
        androidId = GeneralUtils.getAndroidID();
        gaid = GeneralUtils.gaid;
        networkOperatorName = GeneralUtils.getNetworkOperatorName();
        networkOperator = GeneralUtils.getNetworkOperator();
        networkType = GeneralUtils.getNetworkType();
        phoneType = GeneralUtils.getPhoneType();
        mcc = GeneralUtils.getMcc();
        mnc = GeneralUtils.getMnc();
        cid = GeneralUtils.getCidNumbers();
        dns = GeneralUtils.getLocalDNS();
        uuid = GeneralUtils.getMyUUID();
        slotCount = OtherUtils.getPhoneSimCount();
        meid = GeneralUtils.getMeid();
        localeIso3Country = LanguageUtils.getSystemLanguage().getISO3Country();
        localeIso3Language = LanguageUtils.getSystemLanguage().getISO3Language();
        localeDisplayLanguage = LanguageUtils.getSystemLanguage().getDisplayLanguage();
        language = LanguageUtils.getSystemLanguage().getLanguage();
        //        imei1 = GeneralUtils.getIMEI(0);
        //        imei2 = GeneralUtils.getIMEI(1);
        imei1 = GeneralUtils.getImeiOne();
        imei2 = GeneralUtils.getImeiTwo();
        uiModeType = GeneralUtils.getUiModeType();
        timeZoneId = LanguageUtils.getCurrentTimeZone();
        // mac = getMacAddress();
        mac = getMyMacAddress();
        bluetoothMac = NetWorkUtils.getBluetoothMac();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            securityPatch = Build.VERSION.SECURITY_PATCH;
        }
        sensorList = getSensorList(new SensorData());
        isUsbDebug = isAppDebug();
        isUsingProxyPort = getIsWifiProxy();
    }

}
